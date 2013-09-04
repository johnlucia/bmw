$(document).ready(function() {  
  if(is_touch_device()){
    $('#nav > ul > li').each(function() {
      if($(this).children('ul').length > 0){
        $(this).addClass('parentNav');
        var topLink = $(this).find("> a").clone();
        $(this).find("> ul > .first").removeClass("first");
        $(this).find("> ul").prepend("<li class='first touchTopLInk'></li>");
        $(this).find("> ul > .touchTopLInk").html(topLink);
      } 
    });

    $('.parentNav > a').bind("click", function() {
      $('.open > a').not($(this)).parent().removeClass('open');
      $(this).parent().toggleClass("open");
      return false;
    });
  }
  
  function is_touch_device() {  
    try {  
      document.createEvent("TouchEvent");  
      return true;  
    } catch (e) {  
      return false;  
    }  
  }
});


