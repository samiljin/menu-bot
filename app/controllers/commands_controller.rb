class CommandsController < ApplicationController

  def handle
    text       = params[:message][:text]
    chat_id    = params[:message][:chat][:id]
    key, param = text.split(' ')

    handler = handlers.find { |handler|  handler.key == key }

    head :bad_request and return if handler.nil?

    options = {
      body: {
        text: handler.call(param),
        chat_id: chat_id
      }
    }
    
    HTTParty.post(url, options)

    head :ok
  end
  
  private

  def url
    "https://api.telegram.org/#{api_key}/sendMessage"
  end

  def api_key
    ENV['API_KEY']
  end

  def handlers
    [ResponseHandlers::SodexoHandler]
  end

end