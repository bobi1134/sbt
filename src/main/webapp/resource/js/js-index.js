$(function() {
    /**********************滚动条样式***************************/
    $("body").niceScroll();

    /**********************数字滚动效果***************************/
    //调用函数
    getNum(678787878);
    //获取数字
    function getNum(num) {
        var str = String(num);
        for (var i = 0; i < str.length; i++) {
            $(".container_index .page-one .center-info .num").append("<i class='" + str.charAt(i) + "'></i>");
        }
        $(".container_index .page-one .center-info .num").find("i").each(function() {
            var num = parseInt($(this).attr("class"));
            var multiplier = 40;
            var addend = 3;
            switch (num) {
                case 0:
                    animate(-(0*multiplier+addend), $(this));
                    break;
                case 1:
                    animate(-(1*multiplier+addend), $(this));
                    break;
                case 2:
                    animate(-(2*multiplier+addend), $(this));
                    break;
                case 3:
                    animate(-(3*multiplier+addend), $(this));
                    break;
                case 4:
                    animate(-(4*multiplier+addend), $(this));
                    break;
                case 5:
                    animate(-(5*multiplier+addend), $(this));
                    break;
                case 6:
                    animate(-(6*multiplier+addend), $(this));
                    break;
                case 7:
                    animate(-(7*multiplier+addend), $(this));
                    break;
                case 8:
                    animate(-(8*multiplier+addend), $(this));
                    break;
                case 9:
                    animate(-(9*multiplier+addend), $(this));
                    break;
            }
        });


    }
    //给数字加入动画
    function animate(position, obj) {
        obj.animate({
            backgroundPosition: '(0 ' + (position) + 'px)'
        }, {
            "duration": 2000,
        });
    }

    /**********************鼠标操作滚动条的页面样式***************************/
    //根据滚动条的位置来依次显示出改div块的效果
    $(window).scroll(function() {
        console.log($(window).scrollTop());
        if($(window).scrollTop() > 400){
            $(".container_index .page-two .content_top").css("opacity",1).addClass("animated fadeInLeft");
        }
        if($(window).scrollTop() > 1100){
            $(".container_index .page-two .content_center").fadeIn(600);
            $(".container_index .page-two .content_center .content_3").show().addClass("animated fadeInUp");
        }
        if($(window).scrollTop() > 1500){
            $(".container_index .page-two .content_bottom .h1").css("opacity",1).addClass("animated bounceInUp");
            $(".container_index .page-two .content_bottom .tit").css("opacity",1).addClass("animated bounceInUp");
            $(".container_index .page-two .content_bottom .href").css("opacity",1).addClass("animated bounceInDown");
            $(".container_index .page-two .content_bottom .href_intr").css("opacity",1).addClass("animated bounceInDown");
        }
        if($(window).scrollTop() > 1850){
            $(".container_index .page-footer .link").css("opacity",1).addClass("animated bounceInDown");
            setTimeout(function(){
                $(".container_index .page-footer .source").css("opacity",1).addClass("animated bounceInDown");
            },300);
            setTimeout(function(){
                $(".container_index .page-footer .go").css("opacity",1).addClass("animated bounceInDown");
            },600);
            setTimeout(function(){
                $(".container_index .page-footer .qq").css("opacity",1).addClass("animated bounceInDown");
            },900);
            setTimeout(function(){
                $(".container_index .page-footer .wechat").css("opacity",1).addClass("animated bounceInDown");
            },1200);
            setTimeout(function(){
                $(".container_index .copyright .info").css("opacity",1).addClass("animated bounceInUp");
            },1500);
        }
    });

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

    /**********************tip info***************************/
//    $("#regBtn").click(function(){
//        //获取tip框的宽度和高度
//        var outerHeight = $(".container_index .tip").outerHeight() / 2;
//        var outerWidth = $(".container_index .tip").outerWidth() / 2;
//        $(".container_index .tip").show().css({"margin-top":-outerHeight,"margin-left":-outerWidth}).animate({left:"50%",top:"50%"},200,function(){
//            setTimeout(function(){
//                 $(".container_index .tip").slideUp("fast");        
//                    $(".container_index .tip").css({"margin-top":-outerHeight,"margin-left":-outerWidth}).animate({left:"0",top:"50%"}); 
//            },800);
//        });
//    });
    
    function getTip(tipText){
    	$("#tipText").text(tipText);
    	var outerHeight = $(".tip").outerHeight() / 2;
        var outerWidth = $(".tip").outerWidth() / 2;
        $(".tip").show().css({"margin-top":-outerHeight,"margin-left":-outerWidth}).animate({left:"50%",top:"50%"},200,function(){
            setTimeout(function(){
                 $(".tip").slideUp("fast");        
                    $(".tip").css({"margin-top":-outerHeight,"margin-left":-outerWidth}).animate({left:"0",top:"50%"}); 
            },800);
        });
    }
    
    /**********************点击按钮Sign In/Sign Up***************************/
    $("#SignIn").click(function(){
    	$(".yy").show();
    	$(".login_box").addClass("animated rotateIn").show();
    });
    $(".login_box .title .a_2").click(function(){
    	$(".yy").hide();
    	$(".login_box").addClass("animated rotateOut");
    	setTimeout(function(){
    		$(".login_box").removeClass("animated rotateOut rotateIn").hide();
       },800);
    });
    
    $("#SignUp").click(function(){
    	$(".yy").show();
    	$(".reg_box").addClass("animated zoomIn").show();
    });
    $(".reg_box .title .a_2").click(function(){
    	$(".yy").hide();
    	$(".reg_box").addClass("animated zoomOut");
    	setTimeout(function(){
    		$(".reg_box").removeClass("animated zoomIn zoomOut").hide();
       },800);
    });
    
    /**********************vue.js代码***************************/
    //测试
    new Vue({
        el:'#tipText',
        data: {
            message:'Hello World!'
        }
    });
    
    //更换验证码
    $("#vimg").click(function(){
    	$("#vimg").attr("src", path+"/vcode?random=" + Math.random());
    });
    
    //注册
    $("#regBtn").click(function(){
    	//getTip("你好");
    	var username = $("#reg_username").val();
		var password = $("#reg_password").val();
		var email = $("#reg_email").val();
		var vcode = $("#reg_vcode").val();
		var tip = "";
		if(username == ""){
			tip = "用户名不能为空！";
			$("#reg_username").focus();
		}else if(!/[a-zA-Z][a-zA-Z0-9_-]{4,9}$/.test($.trim(username))){
			tip = "用户名只能是5-10位字母和数字！";
			$("#reg_username").focus();
		}else if(password == ""){
			tip = "密码不能为空！";
			$("#reg_password").focus();
		}else if(email == ""){
			tip = "邮箱不能为空！";
			$("#reg_email").focus();
		}else if(!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test($.trim(email))){
			tip = "邮箱格式不正确！";
			$("#reg_email").focus();
		}else if(vcode == ""){
			tip = "验证码不能为空！";
			$("#reg_vcode").focus();
		}else if(!/[0-9]{4}/.test($.trim(vcode))){
			tip = "验证码格式不正确！";
			$("#reg_vcode").focus();
		}
		if(tip != ""){
			getTip(tip);
		}else{
			$.ajax({
				type : "post",
				url : path+"/user/reg",
				dataType : "json",
				data : $("#regForm").serialize(),
				success : function(json){
					if (json.objectErrors != null) {
						getTip(json.objectErrors[0].defaultMessage);
					}else if (json.status == "success") {
						getTip("注册成功！请前往邮箱激活！");
					}else if(json.status == "exist"){
						getTip("用户名已存在！");
					}else if(json.status == "error"){
						getTip("注册失败！");
					}else if(json.status == "vcode"){
						getTip("验证码不正确！");
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
		}
    });
    
    //登陆
    $("#loginBtn").click(function(){
    	var username = $("#login_username").val();
		var password = $("#login_password").val();
		var tip = "";
		if(username == ""){
			tip = "用户名不能为空！";
			$("#login_username").focus();
		}else if(!/[a-zA-Z][a-zA-Z0-9_-]{4,9}$/.test($.trim(username))){
			tip = "用户名只能是5-10位字母和数字！";
			$("#login_username").focus();
		}else if(password == ""){
			tip = "密码不能为空！";
			$("#login_password").focus();
		}
		if(tip != ""){
			getTip(tip);
		}else{
			$.ajax({
				type : "post",
				url : path+"/user/login",
				dataType : "json",
				data : $("#loginForm").serialize(),
				success : function(json){
					if (json.objectErrors != null) {
						getTip(json.objectErrors[0].defaultMessage);
					}else if(json.status == "notExist"){
						getTip("账号不存在！");
					}else if(json.status == "notActive"){
						getTip("账号未激活，请前往邮箱进行激活！");
					}else if(json.status == "loginError"){
						getTip("账号或密码错误！");
					}else if(json.status == "loginSuccess_and_role_1"){
							window.location = path+"/user/admin";
					}else if(json.status == "loginSuccess_and_role_2"){
						window.location = path+"/index";
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
		}
    });
    
});
