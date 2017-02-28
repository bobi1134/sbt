$(function() {
     //滚动条样式
    $("body").niceScroll();
    
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
    
    //点击选择乘客复选框，在下面显示相应的信息，以及右边的信息
    $(document).on("click", ".container .table .rider label input[type='checkbox']", function(){
    	var t_this = $(this);
    	t_this.attr("disabled",true);//禁止选择
    	var nowId = $(this).val();
    	var css = $("#"+nowId).css("display");
    	var size = $(".container .table .rider label input[type='checkbox']:checked").size();
    	if (css == "none") {
    		$("#"+nowId).show().addClass("animated rotateInDownLeft");
    		$("#ticketNum").text(size);//票数
    		$("#ticketPrice").text(size*price);//总价
    		setTimeout(function(){
    			t_this.attr("disabled",false);//效果显示完之后可以选择
	       },800);
		}else{
			size = $(".container .table .rider label input[type='checkbox']:checked").size();
			if (size == "0") {
				$("#ticketNum").text(1);//票数
				$("#ticketPrice").text(1*price);//总价
			}else{
				$("#ticketNum").text(size);//票数
				$("#ticketPrice").text(size*price);//总价
			}
			$("#"+nowId+"").addClass("animated rotateOutUpLeft");
			t_this.attr("disabled",true);//禁止选择
			setTimeout(function(){
				$("#"+nowId+"").removeClass("animated rotateInDownLeft rotateOutUpLeft").hide();
				t_this.attr("disabled",false);//效果显示完之后可以选择
	       },800);
		}
    	//确认购买按钮是否显示
    	if(size > 0){
    		$(".container .table .left .buy .btn").show().addClass("animated zoomIn");
    	}else{
    		$(".container .table .left .buy .btn").addClass("animated zoomOut");
    		setTimeout(function(){
    			$(".container .table .left .buy .btn").removeClass("animated zoomIn zoomOut").hide();
	       },800);
    	}
    });
//    $(".container .table .rider label input[type='checkbox']").click(function(){
//    	var nowId = $(this).val();
//    	var css = $("#"+nowId).css("display");
//    	var size = $(".container .table .rider label input[type='checkbox']:checked").size();
//    	if (css == "none") {
//    		$("#"+nowId).show().addClass("animated rotateInDownLeft");
//    		$("#ticketNum").text(size);//票数
//    		$("#ticketPrice").text(size*price);//总价
//		}else{
//			size = $(".container .table .rider label input[type='checkbox']:checked").size();
//			if (size == "0") {
//				$("#ticketNum").text(1);//票数
//				$("#ticketPrice").text(1*price);//总价
//			}else{
//				$("#ticketNum").text(size);//票数
//				$("#ticketPrice").text(size*price);//总价
//			}
//			$("#"+nowId+"").addClass("animated rotateOutUpLeft");
//			setTimeout(function(){
//				$("#"+nowId+"").removeClass("animated rotateInDownLeft rotateOutUpLeft").hide();
//	       },800);
//		}
//    	//确认购买按钮
//    	if(size > 0){
//    		$(".container .table .left .buy .btn").show().addClass("animated zoomIn");
//    	}else{
//    		$(".container .table .left .buy .btn").addClass("animated zoomOut");
//    		setTimeout(function(){
//    			$(".container .table .left .buy .btn").removeClass("animated zoomIn zoomOut").hide();
//	       },800);
//    	}
//    });
    
    //点击更改按钮
    $(document).on("click", ".container .table .left .info #updateRider", function(){
    	$(this).parent().parent().find("#name").removeAttr("readonly").focus();
    	$(this).parent().find("#idcard").removeAttr("readonly");
    	$(this).hide();
    	$(this).parent().find("#updateRiderOk").show();
    });
//    //点击更改按钮
//    $(".container .table .left .info").find("#updateRider").click(function(){
//    	$(this).parent().parent().find("#name").removeAttr("readonly").focus();
//    	$(this).parent().find("#idcard").removeAttr("readonly");
//    	$(this).hide();
//    	$(this).parent().find("#updateRiderOk").show();
//    });
    
    //点击确定修改按钮
    $(document).on("click", ".container .table .left .info #updateRiderOk", function(){
    	//异步修改
    	var riderId = $(this).parent().find("#riderId");
    	var name = $(this).parent().parent().find("#name");
    	var idcard = $(this).parent().parent().find("#idcard");
    	var t_this = $(this); 
    	var idChoose = $(this).parent().parent().parent().attr("id");
    	//校验
    	if($.trim(riderId.val()) == ""){
    		getTip("乘车人唯一表示符不能为空！");
    	}else if($.trim(name.val()) == ""){
    		getTip("姓名不能为空！");
    		name.focus();
    	}else if($.trim(name.val()).length > 4 || $.trim(name.val()).length < 2){
    		getTip("姓名格式不正确！");
    		name.focus();
    	}else if($.trim(idcard.val()) == ""){
    		getTip("身份证不能为空！");
    		idcard.focus();
    	}else if(!/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test($.trim(idcard.val()))){
    		getTip("身份证格式不正确！");
    		idcard.focus();
    	}else{
    		$.ajax({
				type : "post",
				url : path+"/rider/update",
				dataType : "json",
				data : {riderId:riderId.val(),name:name.val(),idcard:idcard.val()},
				success : function(json){
					if(json.status == "notLogin"){
						getTip("用户未登录！");
						window.location = path+"/bus";
					}else if(json.status == "null_riderId"){
						getTip("乘车人唯一表示符不能为空！");
					}else if(json.status == "null_name"){
						getTip("姓名不能为空！");
					}else if(json.status == "null_idcard"){
						getTip("身份证不能为空！");
					}else if(json.status == "update_ok"){
						name.attr("readonly", true);
						idcard.attr("readonly", true);
						t_this.hide();
						t_this.parent().find("#updateRider").show();
						$(".container .table .rider label input[value="+idChoose+"]").parent().find(".name").text(name.val());
						getTip("修改成功！");
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
    	}
    });
    
//    //点击确定按钮
//    $(".container .table .left .info").find("#updateRiderOk").click(function(){
//    	//异步修改
//    	var riderId = $(this).parent().find("#riderId");
//    	var name = $(this).parent().parent().find("#name");
//    	var idcard = $(this).parent().parent().find("#idcard");
//    	var t_this = $(this); 
//    	var idChoose = $(this).parent().parent().parent().attr("id");
//    	//校验
//    	if($.trim(riderId.val()) == ""){
//    		getTip("乘车人唯一表示符不能为空！");
//    	}else if($.trim(name.val()) == ""){
//    		getTip("姓名不能为空！");
//    		name.focus();
//    	}else if($.trim(name.val()).length > 4 || $.trim(name.val()).length < 2){
//    		getTip("姓名格式不正确！");
//    		name.focus();
//    	}else if($.trim(idcard.val()) == ""){
//    		getTip("身份证不能为空！");
//    		idcard.focus();
//    	}else if(!/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test($.trim(idcard.val()))){
//    		getTip("身份证格式不正确！");
//    		idcard.focus();
//    	}else{
//    		$.ajax({
//				type : "post",
//				url : path+"/rider/update",
//				dataType : "json",
//				data : {riderId:riderId.val(),name:name.val(),idcard:idcard.val()},
//				success : function(json){
//					if(json.status == "notLogin"){
//						getTip("用户未登录！");
//						window.location = path+"/bus";
//					}else if(json.status == "null_riderId"){
//						getTip("乘车人唯一表示符不能为空！");
//					}else if(json.status == "null_name"){
//						getTip("姓名不能为空！");
//					}else if(json.status == "null_idcard"){
//						getTip("身份证不能为空！");
//					}else if(json.status == "update_ok"){
//						name.attr("readonly", true);
//						idcard.attr("readonly", true);
//						t_this.hide();
//						t_this.parent().find("#updateRider").show();
//						$(".container .table .rider label input[value="+idChoose+"]").parent().find(".name").text(name.val());
//						getTip("修改成功！");
//					}
//				},
//				error : function(){
//					getTip("抱歉，系统错误！");
//				}
//			});
//    	}
//    });
    
    //点击添加乘车人
    var flag = false;
    $("#addRiderBtn").click(function(){
    	if(flag == false){
    		$(".container .table .left .addRider").show().addClass("animated zoomIn");
    		flag = true;
    	}else{
    		$(".container .table .left .addRider").addClass("animated zoomOut");
    		setTimeout(function(){
    			$(".container .table .left .addRider").removeClass("animated zoomIn zoomOut").hide();
    		},800);
    	    flag = false;
    	}
    });
    //点击取消
    $("#cancelAddBtn").click(function(){
    	$(".container .table .left .addRider").addClass("animated zoomOut");
		setTimeout(function(){
			$(".container .table .left .addRider").removeClass("animated zoomIn zoomOut").hide();
		},800);
	    flag = false;
    });
    
    //确认添加乘车人
    $("#addRiderBtnOk").click(function(){
    	var name = $("#addRiderName");
    	var idcard = $("#addIdCard");
    	if($.trim(name.val()) == ""){
    		getTip("姓名不能为空！");
    		name.focus();
    	}else if($.trim(name.val()).length > 4 || $.trim(name.val()).length < 2){
    		getTip("姓名格式不正确！");
    		name.focus();
    	}else if($.trim(idcard.val()) == ""){
    		getTip("身份证不能为空！");
    		idcard.focus();
    	}else if(!/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test($.trim(idcard.val()))){
    		getTip("身份证格式不正确！");
    		idcard.focus();
    	}else{
    		$.ajax({
				type : "post",
				url : path+"/rider/add",
				dataType : "json",
				data : {name:name.val(),idcard:idcard.val()},
				success : function(json){
					if(json.status == "notLogin"){
						getTip("用户未登录！");
						window.location = path+"/bus";
					}else if(json.status == "null_name"){
						getTip("姓名不能为空！");
					}else if(json.status == "null_idcard"){
						getTip("身份证不能为空！");
					}else if(json.status == "add_ok"){
						getTip("添加成功！");
						//乘客人姓名
						$("#insertBefore").before("<span>&nbsp;&nbsp;<label><input type='checkbox' value='clickInfo_"+json.key+"'><i>✓</i><span class='name'>"+name.val()+"</span></label></span>");
						//乘客人信息
						var size = $(".container .table .rider label input[type='checkbox']:checked").size();
						$(".container .table .left .buy").before(
							"<div class='info' id='clickInfo_"+json.key+"'>"+
				        		"<div class='box'>"+
				        			"<div class='order'>第&nbsp;&nbsp;<span class='num'>"+size+"</span>&nbsp;&nbsp;位乘客</div>"+
				        			"<div class='name'><label>乘客姓名：</label><input type='text' value="+name.val()+" readonly='true' id='name'/></div>"+
				        			"<div class='id'>"+
				        				"<label>身份证号：</label><input type='text' value="+idcard.val()+" readonly='true' id='idcard'/>"+
				        				"<a href='javascript:void(0);' class='update' id='updateRider'>更 改</a>"+
				        				"<a href='javascript:void(0);' class='update' id='updateRiderOk' style='display:none'>确 定</a>"+	
				        				"<a href='javascript:void(0);' class='update' id='deleteRiderBtn'>删 除</a>"+
						        		"<input type='hidden' value="+json.key+" id='riderId'/>"+
				        			"</div>"+
				        		"</div>"+
				        	"</div>"
						);
						
						//添加框清除内容并消失
						name.val("");
						idcard.val("");
						$(".container .table .left .addRider").addClass("animated zoomOut");
			    		setTimeout(function(){
			    			$(".container .table .left .addRider").removeClass("animated zoomIn zoomOut").hide();
			    		},800);
			    	    flag = false;
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
    	}
    });
    
    //点击删除乘客人信息按钮
    $(document).on("click", ".container .table .left .info #deleteRiderBtn", function(){
    	var riderId = $(this).parent().find("#riderId").val();
    	if($.trim(riderId) == ""){
    		getTip("乘车人唯一表示符不能为空！");
    	}else{
    		$.ajax({
				type : "post",
				url : path+"/rider/delete",
				dataType : "json",
				data : {riderId:riderId},
				success : function(json){
					if(json.status == "notLogin"){
						getTip("用户未登录！");
						window.location = path+"/bus";
					}else if(json.status == "null_id"){
						getTip("乘车人唯一表示符不能为空！");
					}else if(json.status == "delete_ok"){
						getTip("删除成功！");
						//删除乘车人、乘车人信息
						$(".container .table .rider label input[value='clickInfo_"+riderId+"']:checked").parent().parent().remove();
						$("#clickInfo_"+riderId).remove();
						var size = $(".container .table .rider label input[type='checkbox']:checked").size();
						if (size == "0") {
							$("#ticketNum").text(1);//票数
							$("#ticketPrice").text(1*price);//总价
						}else{
							$("#ticketNum").text(size);//票数
							$("#ticketPrice").text(size*price);//总价
						}
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
    	}
    });
    
    //点击确认购买
    $("#buyBtn").click(function(){
    	var riderIds = new Array();
    	$(".container .table .rider label input[type='checkbox']:checked").each(function(){
    		riderIds.push($(this).val());
    	});
    	if(riderIds == ""){
    		getTip("乘车人信息不能为空！");
    	}else{
    		$.ajax({
				type : "post",
				url : path+"/order/add",
				dataType : "json",
				data : {riderIds:riderIds, busId:busId, date:$("#date").text()},
				traditional:true,//ajax传数组必须要写这个
				success : function(json){
					if(json.status == "notLogin"){
						getTip("用户未登录！");
						window.location = path+"/bus";
					}else if(json.status == "null_date"){
						getTip("乘车日期不能为空！");
					}else if(json.status == "notEnough"){
						getTip("手慢了，票数不够！");
						window.location = path+"/bus";
					}else if(json.status == "null_riderIds"){
						getTip("乘车人信息不能为空！");
					}else if(json.status == "add_ok"){
						getTip("购票成功！！！！！！！跳往支付页面，这里======================，，，，");
						window.location = path+"/bus";
					}
				},
				error : function(){
					getTip("抱歉，系统错误！");
				}
			});
    	}
    });
});
