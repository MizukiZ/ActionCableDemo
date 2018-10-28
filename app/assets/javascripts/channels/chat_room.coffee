App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) -> chat = document.getElementById 'chat'; newMessage = document.createElement 'p'; newMessage.innerText = data['message'];chat.appendChild(newMessage);
    # Called when there's incoming data on the websocket for this channel

  speak: (msg)-> @perform('speak', {message:msg})
