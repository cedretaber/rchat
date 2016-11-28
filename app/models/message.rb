class Message

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def save
    self.class.add(self)
    self
  end

  @@messages = []

  class << self
    def all
      @@messages
    end

    def add(message)
      @@messages.unshift(message)
    end
  end
end
