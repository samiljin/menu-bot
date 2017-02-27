require 'open-uri'

class ResponseHandlers::SodexoHandler < ResponseHandlers::BaseHandler

  def self.key
    '/sodexo'
  end

  def self.call(param)
    page = Nokogiri::HTML(open("http://www.sodexo.fi/galaksi"))

    menu = []

    list = page.css('.food-list').css('li')
    list.each do |item|
      menu.push("#{item.css('.lunch_desc').css('.fi').text} \n")
    end

    menu.join
  end

end
