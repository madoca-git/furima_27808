import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class='text'>
                    ${data.content.text}
                  </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
    $('.comment-btn').prop("disabled", false);
  }
});
