const filterForm = document.querySelector('#filter-form');
const submitButton = document.querySelector('#filter-button[type="submit"]');
submitButton.addEventListener('click', (event) => {
  event.preventDefault();

  const formData = new FormData(filterForm);
  const url = filterForm.action;
  const params = new URLSearchParams(formData).toString();
  const fetchUrl = url + '?' + params;
  fetchExerciseCards(fetchUrl);
});

function fetchExerciseCards(url) {
  fetch(url)
    .then(response => response.text())
    .then(data => {
      const parser = new DOMParser();
      const html = parser.parseFromString(data, 'text/html');
      const exerciseList = html.querySelector('#exercise-list');
      const targetElement = document.querySelector('#exercise-list');
      targetElement.innerHTML = exerciseList.innerHTML;
    });
}