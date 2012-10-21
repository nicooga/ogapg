// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap

$(function(){
  var keyStop = {
  8: ":not(input:text, textarea, input:file, input:password)", // stop backspace = back
  13: "input:text, input:password", // stop enter = submit 

  end: null
  };

  $(document).bind("keydown", function(event){
  var selector = keyStop[event.which];

  if(selector !== undefined && $(event.target).is(selector)) {
    event.preventDefault(); //stop event
  }

  return true;
  });


});