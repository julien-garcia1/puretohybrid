import consumer from "./consumer";

const initStoreCable = () => {
  const ticketsContainer = document.querySelector('#tickets');

  if (ticketsContainer) {
    consumer.subscriptions.create({ channel: "StoreChannel", id: ticketsContainer.dataset.storeId }, {
      received(data) {
        ticketsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initStoreCable };