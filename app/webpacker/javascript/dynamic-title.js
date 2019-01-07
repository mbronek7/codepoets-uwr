document.addEventListener('DOMContentLoaded', function () {
  var original = document.title
  var message = "We miss you :(";
  var went = false;
  var restore;

  function back() {
    document.title = "Hurra you went back :)";
    restore = setTimeout(set_back_message, 4000);
    went = false;
  };

  function set_back_message() {
    document.title = original;
  };
  window.onblur = function () {
    clearTimeout(restore);
    document.title = message;
    went = true;
  }

  window.onfocus = function () {
    if (went) {
      back();
      went = false;
    } else {
      set_back_message();
    }
  }
}, false);