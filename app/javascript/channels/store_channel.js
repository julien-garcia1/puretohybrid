import consumer from "./consumer";

const initStoreCable = () => {
  const ticketsContainer = document.querySelector('#tickets');

  if (ticketsContainer) {
    // console.log("je suis la")
    // console.log(ticketsContainer)
    consumer.subscriptions.create({ channel: "StoreChannel", id: ticketsContainer.dataset.storeId }, {
      received(data) {
        // console.log(ticketsContainer)
        // console.log(ticketsContainer.querySelector('tbody'))
        // console.log(data)
        ticketsContainer.insertAdjacentHTML('beforeend', data.body);
      },
    });
  }
}

export { initStoreCable };
