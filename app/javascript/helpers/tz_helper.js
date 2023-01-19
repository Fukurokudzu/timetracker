// TODO: replace TZ data with data from DB

document.addEventListener("turbo:submit-start", function () {
  document.getElementById('tz_header').innerText = jstz.determine().name();
  }, false);

// document.getElementById('user_time_zone').value = jstz.determine().name();