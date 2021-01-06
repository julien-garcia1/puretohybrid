import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {},
  disconnected() {},
  received(data) {
    if (Notification.permission === 'granted') {
      var title = 'Nouveau Ticket'
      var body = "Un client a besoin d'aide !"
      var options = { body: body }
      new Notification(title, options)
    }
  }
});