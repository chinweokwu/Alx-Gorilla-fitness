document.addEventListener('DOMContentLoaded', () => {
function calculateCaloriesBurned(bodyWeightKg, met, timeHours) {
  const calCaloriesBurnt = met * bodyWeightKg * timeHours;
  return calCaloriesBurnt;
}
  let calculateBtn = document.getElementById('calculate-btn');
  let weightVal = document.getElementById('weight-val');
  let timeVal = document.getElementById('time-val');
  let metVal = document.getElementById('met-val');
  
  calculateBtn.addEventListener('click', () => { 
    let bodyWeight =  parseFloat(weightVal.value);
    let timeMins =  parseFloat(timeVal.value);
    let met = parseFloat(metVal.value);


    const hoursDec = timeMins / 3600;
    const caloriesBurnt =  calculateCaloriesBurned(bodyWeight, met, hoursDec);
    const res = document.getElementById('calories-burnt-res');
    res.textContent = isNaN(caloriesBurnt) ? 'Invalid input' : caloriesBurnt.toFixed(2);

    // Clear input fields
    document.getElementById('weight-val').value = '';
    document.getElementById('time-val').value = '';
    document.getElementById('met-val').value = '';
  })
});