import consumer from "./consumer";

consumer.subscriptions.create("ChatroomChannel", {
  initialized() {
    // Called before page loaded
  },
  connected() {
    // Called when the subscription is ready for use on the server
    alert("connected");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    alert("disconnected");
  },

  received(data) {
    $("#messsage-container").append(data.mod_message);
    scroll_bottom();
  },
});
