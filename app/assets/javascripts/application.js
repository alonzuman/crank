//= require rails-ujs
//= require_tree .

function setCookie(name, value, days) {
  var expires = "";
  if (days) {
    var date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    expires = "; expires=" + date.toUTCString();
  }
  document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

function getCookie(name) {
  var value = ';' + document.cookie;
  var parts = value.split(';' + name + '=');
  if (parts.length === 2) return parts.pop().split(';').shift();
}

const toggleButton = document.getElementById('theme-toggle');

toggleButton.addEventListener('click', () => {
  const theme = getCookie('theme')
  if (theme === 'light') {
    setCookie('theme', 'dark', 100);
    location.reload();
  } else {
    setCookie('theme', 'light', 100);
    location.reload();
  }
})
