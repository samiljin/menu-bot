class ResponseHandlers::BaseHandler

  def self.chat_id=(chat_id)
    @chat_id = chat_id
  end

  def self.chat_id
    @chat_id
  end

end