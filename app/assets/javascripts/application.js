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
//= require_tree ./vendor
//= require_tree .

$(document).ready(function() {
        $('.block').hover(
                function() {
                        $(this).find('.info').animate({"opacity":'1'}, 300);
                },
                function() {
                        $(this).find('.info').animate({"opacity":'0'}, 300);
                }
        );
        

        var documentWidth = $(document).width();
        var content_x = $('.content').position().left;

        var scroll_left = false;

        /*
         * commenting out mouseover stuff for now
         *
         * $('.controls').mousemove(function(event) {
                var next = $(this).find('.right');
                var previous = $(this).find('.left');
                var target = $(this).closest('.gridify').find('.content');

                var scroll_right = false;
                var active_zone = next.position().left - ( documentWidth * 0.25 );

                if (! scroll_right && event.pageX > active_zone) {
                        scroll_right = true;
                        content_x = content_x - 1;
                        console.log(content_x);
                        target.css({
                                'margin-left': content_x,
                        });
                }
        });
        */

        $('.controls a.right').click(function() {
                var target = $(this).closest('.gridify').find('.content');
                var content_left = target.offset().left;
                var last = target.find('.block').last();
                documentWidth = $(document).width();
                if (last.position().left < documentWidth) {
                        return false;
                }
                target.animate({
                        "margin-left": content_left - (documentWidth * 0.99),
                });

                return false;
        });
        $('.controls a.left').click(function() {
                var target = $(this).closest('.gridify').find('.content');
                var content_left = target.offset().left;
                var first = target.find('.block').first();
                documentWidth = $(document).width();
                if (first.position().left > 0) {
                        console.log(first);
                        return false;
                }
                target.animate({
                        "margin-left": content_left + (documentWidth * 0.99),
                });

                return false;
        });




});


$(window).resize(function () { 
  var width = $('.hometile').width();
  $(".hometile").css({
    "height": width
  }); 
});
