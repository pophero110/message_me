import consumer from "./consumer";

consumer.subscriptions.create("ChatroomChannel", {
  initialized() {
    // Called before page loaded
  },
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#messsage-container").append(data.mod_message);
    scroll_bottom();
  },
});
