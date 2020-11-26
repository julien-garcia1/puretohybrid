import consumer from "./consumer";
const initStoreCable = () => {
  const ticketsContainer = document.querySelector('#tickets');
  if (ticketsContainer) {
    consumer.subscriptions.create({ channel: "StoreChannel" }, {
      received(data) {
        // console.log('Hello')
        ticketsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initStoreCable };