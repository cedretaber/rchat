class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(room_name, message)
    ActionCable.server.broadcast room_name, message: message
  end
end
