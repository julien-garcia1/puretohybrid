const timerFunction = () => {
  const timeClock = document.getElementById('time');

  if (timeClock) {
    function startTimer(duration, display) {
      var timer = duration, minutes, seconds;
      setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
        display.textContent = minutes + ":" + seconds;

        if (--timer <= 0) {
          timeClock.innerHTML = '<a href="#" class="blue-span">Appeler le Callcenter</a>';
        }
      }, 1000);
    };

    window.onload = function () {
      var twoMinutes = 60 * 2,
      display = document.querySelector('#time');
      startTimer(twoMinutes, display);
    };
  }
}

export { timerFunction };