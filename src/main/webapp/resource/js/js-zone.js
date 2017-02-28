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

    /**********************菜单向左向右事件***************************/
    $("#xiangzuo").click(function(){
    	// alert(0);
    	$(".container_zone .zone_menu").animate({left:"-181px"},500,function(){
    		$(".container_zone .zone_menu .icon-xiangzuo").hide();
    		$(".container_zone .zone_menu .icon-xiangyou").show();
    	});
    });
    $("#xiangyou").click(function(){
    	// alert(0);
    	$(".container_zone .zone_menu").animate({left:"0"},500,function(){
    		$(".container_zone .zone_menu .icon-xiangzuo").show();
    		$(".container_zone .zone_menu .icon-xiangyou").hide();
    	});
    });
    
    
    /**********************点击查看按钮***************************/
    var flag = false;
    $("#message_ul").find("li .title a").click(function(){
    	var now =  $(this).parent().parent();
    	var css = now.find(".content").css("display");
    	var messageId = now.find("#messageId").val();
    	var isRead = now.find("#isRead").val();
    	if(css == "none"){
    		now.find(".content").slideDown();
    		//发送ajax，改变状态
    		if(isRead == 1){
    			$.ajax({
    				type : "post",
    				url : path+"/user/message/read",
    				dataType : "json",
    				data : {messageId:messageId},
    				success : function(json){
    					if(json.status == "notLogin"){
    						getTip("用户未登录！");
    						window.location = path+"/bus";
    					}else if(json.status == "null_messagesId"){
    						getTip("MessageId不能为空！");
    					}else if(json.status == "udpate_ok"){
    						now.find("#new").fadeOut();
    						now.find("#isRead").val(2);
    						if(json.isRead == 2){
        						$("#leftMenuIsRead").fadeOut();
        					}
    					}
    				},
    				error : function(){
    					getTip("抱歉，系统错误！");
    				}
    			});
    		}
    	}else{
    		$(this).parent().parent().find(".content").slideUp();
    	}
    });
});
