; (function($) {

  /*Plugin starts here*/
  $.fn.scrollUp = function () {
      var button = this;
      //button soll erscheinen und verschwinden
      $(window).scroll(function(event){
        if (window.scrollY >= 500 && button.attr("hidden")) {
          button.removeAttr("hidden");
        } else if (window.scrollY < 500 && !button.attr("hidden")) {
          button.attr("hidden", true);
        }
      });

      // bei Click auf Button soll nach oben gescrollt werden
      button.on("click", function(){
        window.scrollTo({
          top: 0,
          behavior: 'smooth'
        });
      });

  }
  /*Plugin ends here*/
})(jQuery);
