$(function() {
     //滚动条样式
    $("body").niceScroll();
    
	//日期插件
    $("#datepicker").datepicker({
    	//beforeShowDay: $.datepicker.noWeekends,  
        //限定日期
         minDate: "+0",  
         maxDate: "+"+days+"",
         dateFormat: "yy-mm-dd"
    });
    
    //Autocomplete自动补全
    var availableTags = ["雅安[yaan]","都江堰[dujiangyan]","温江[wenjiang]"];
    $( "#tags_start" ).autocomplete({
      source: availableTags
    });
    $( "#tags_end" ).autocomplete({
      source: availableTags
    });
    
    //回到顶部
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
    
    //更换验证码
    $("#vimg").click(function(){
    	$("#vimg").attr("src", path+"/vcode?random=" + Math.random());
    });
    
    //提示信息
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
    
    //注册
    $("#regBtn").click(function(){
    	getTip("你好");
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
    
    /************搜索后的提示信息****************/
    if(buses_size <= 1){
    	getTip("不存在该车次信息！");
    }
    
    /*****************预定车票**********************/
    $("#ticketsTable").find("tr #bookTicket").click(function(){
    	var busIds = $(this).parent().parent().find("#busIds").text();
    	if (login_user == "") {
    		getTip("亲，你还未登陆！");
		}else{
			$.ajax({
				type : "post",
				url : path+"/bus/order",
				dataType : "json",
				data : {busIds : busIds},
				success : function(json){
					if(json.status == "notLogin"){
						getTip("亲，你还未登陆！");
					}else if(json.status == "notExist"){
						getTip("不存在该车次！");
						window.location.reload();
					}else if(json.status == "notEnough"){
						getTip("没票啦！你可以进行抢票！");
						setTimeout(function(){
			                window.location.reload();
			            },900);
					}else{
						getTip("余票充足，可以购票，正在跳转！");
						setTimeout(function(){
							$("#hiddenBusIds").val(busIds);
							$("#hiddenDate").val($("#datepicker").val());
							$("#riderForm").submit();
			            },900);
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
		}
    });
});
