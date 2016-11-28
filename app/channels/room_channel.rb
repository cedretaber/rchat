# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  ROOM_CHANNEL = "room_channel".freeze

  def subscribed
    stream_from(ROOM_CHANNEL)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = data["message"].tap { |msg| break Message.new(msg).save }
    MessageBroadcastJob.perform_later(ROOM_CHANNEL, message.message)
  end
end
