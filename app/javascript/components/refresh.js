const refreshPage = () => {
  const ticketDiv = document.querySelector('.ticket-title');

  if (ticketDiv) {
    setTimeout(function(){
    location = ''
    }, 20 *1000);
  }
};

export { refreshPage };