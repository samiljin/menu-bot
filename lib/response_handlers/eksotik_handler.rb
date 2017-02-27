require 'open-uri'

class ResponseHandlers::EksotikHandler < ResponseHandlers::BaseHandler

  def self.key
    '/eksotik'
  end

  def self.call(param)
    page = Nokogiri::HTML(open("http://eksotik.fi/lounas/"))

    menu = []

    list = page.css('h3')
    list.each_with_index { |item, index|
      next if index == 0
      next if item.text.include? 'Päivän'
      menu.push "#{item.text} \n"
    }

    menu.join
  end

end
