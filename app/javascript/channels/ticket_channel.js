import consumer from "./consumer"




document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#ticket-show')) {
    // console.log("je suis dans mon izefzefezf")
    const ticketId = document.querySelector('#ticket-show').dataset.ticketId

    const ticketChannel = consumer.subscriptions.create({ channel: "TicketChannel", id: ticketId }, {
      received(data) {
        // data => { sent_by: "Paul", body: "This is a cool ticket app." }
        // console.log("je suis dans receive data")
        // console.log(data)
        if (data.action == 'refresh') {
          document.location.reload()
        }
      }
    })

    // ticketChannel.send({ sent_by: "Paul", body: "This is a cool ticket app." })
  }
});




