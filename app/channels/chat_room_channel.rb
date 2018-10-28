class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # create message from the user input
    chat_message = ChatMessage.create!(content: data['message'])

    # send info to the cable server
  ActionCable.server.broadcast 'chat_room_channel', message: chat_message.content
  end
end
