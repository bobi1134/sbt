$(function() {
     /**********************滚动条样式***************************/
    $("body").niceScroll();
	
    /**********************回到顶部***************************/
    $(window).scroll(function(){
        if($(window).scrollTop() >= 100){
            $(".scroll_top").fadeIn(300);
        } else{
            $(".scroll_top").stop(true,true).fadeOut(300);
        }
    });
    $(".scroll_top").click(function(){
        $("html,body").animate({
            scrollTop:0
        },"slow");
    });
});
