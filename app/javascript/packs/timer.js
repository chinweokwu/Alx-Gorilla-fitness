let timerInterval;
let elapsedTime = 0;
let running = false;

function displayTime() {
  const minutes = Math.floor(elapsedTime / 60);
  const seconds = elapsedTime % 60;
  const timeDisplay = document.getElementById('timer-display');
  timeDisplay.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
}

function startTimer() {
  if (!running) {
    timerInterval = setInterval(() => {
      elapsedTime += 1;
      displayTime();
    }, 1000);
    running = true;
  }
}

function stopTimer() {
  if (running) {
    clearInterval(timerInterval);
    running = false;
  }
}

function resetTimer() {
  stopTimer();
  elapsedTime = 0;
  displayTime();
}

document.addEventListener('DOMContentLoaded', () => {
  displayTime();

  const startButton = document.getElementById('start-button');
  startButton.addEventListener('click', startTimer);

  const stopButton = document.getElementById('stop-button');
  stopButton.addEventListener('click', stopTimer);

  const resetButton = document.getElementById('reset-button');
  resetButton.addEventListener('click', resetTimer);
});