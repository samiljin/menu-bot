require 'open-uri'

class ResponseHandlers::SmarthouseHandler < ResponseHandlers::BaseHandler

  def self.key
    '/smarthouse'
  end

  def self.call(param)
    date = DateTime.now.strftime('%Y-%m-%d')
    json = JSON.load(open("http://www.amica.fi/modules/json/json/Index?costNumber=3498&firstDay=#{date}&lastDay=#{date}&language=fi"))

    menu = []

    json['MenusForDays'].first['SetMenus'].each do |set|
      menu.push "#{set['Name']} \n"
      set['Components'].each do |component|
        menu.push "#{component} \n"
      end
      menu.push "\n"
    end

    menu.join
  end

end
