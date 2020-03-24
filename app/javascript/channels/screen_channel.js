import consumer from "./consumer"

consumer.subscriptions.create("ScreenChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
  }
});
