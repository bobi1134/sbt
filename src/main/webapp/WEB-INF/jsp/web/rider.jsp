<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
    <title>添加乘客-四川农业大学校车购票系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
    <!-- 引入样式 -->
    <!-- 动画样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/animate.min.css" />
    <!-- less css -->
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resource/less/less-rider.less" />
    <!-- 引入js -->
    <!-- jQuery插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script>
    <!--less编译插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/less2.5.3.js"></script>
    <!--滚动条插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.nicescroll.js"></script>
    <!-- 自定义 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/js-rider.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript">
    	var path = "${pageContext.request.contextPath}";
    	var login_user = "${login_user}";
    	var price = "${bus.price}";
    	var busId = "${bus.id}";
	</script>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/resource/imgs/logo.png" width="100" height="100">
                <span class="logo-title">四川农业大学校车购票系统</span>
            </div>
            <c:choose>
               	<c:when test="${login_user == null}">
	                <div class="button">
	                    <a href="javascript:void(0);" class="sign-in" id="SignIn">Sign In</a>
	                    <!-- 登陆-->
	                    <a href="javascript:void(0);" class="sign-up" id="SignUp">Sign Up</a>
	                    <!-- 注册-->
	                </div>
               	</c:when>
               	<c:otherwise>
	                <div class="session_user">
	                	<a href="${pageContext.request.contextPath}/user/logout" class="logout" id="LogOut" title="退出">LogOut</a>
	                    <a href="${pageContext.request.contextPath}/user/zone"><img src="${pageContext.request.contextPath}/resource/${login_user.img}" width="50" height="50" title="${login_user.username}" /></a>
	                </div>
               	</c:otherwise>
             </c:choose>
        </div>
        <div class="table">
        	<div class="start_end">
        		${bus.start} <span class="to">To</span> ${bus.end}  &nbsp;&nbsp;<span class="time">${bus.type} </span>&nbsp;&nbsp;<span id="date">${date} <fmt:formatDate value="${bus.time}" type="time" pattern="HH:mm:ss"/></span>
        	</div>
        	<div class="rider">
        		乘车人：<c:forEach items="${riders}" var="c">
        			<span>&nbsp;&nbsp;<label><input type="checkbox" value="clickInfo_${c.id}"><i>✓</i><span class="name">${c.name}</span></label></span>
        			</c:forEach>
        			  <span id="insertBefore"></span>&nbsp;&nbsp;<a href="javascript:void(0);" id="addRiderBtn">添加乘车人</a>
        	</div>
        	<div class="left">
        		<div class="info addRider">
	        		<div class="box">
	        			<div class="name"><label>乘客姓名：</label><input type="text" id="addRiderName"/></div>
	        			<div class="id">
	        				<label>身份证号：</label><input type="text" id="addIdCard"/>
	        				<a href="javascript:void(0);" class="update" id="addRiderBtnOk">添 加</a>	
	        				<a href="javascript:void(0);" class="update" id="cancelAddBtn">取 消</a>	
	        			</div>
	        		</div>
	        	</div>
        		<c:forEach items="${riders}" var="c" varStatus="status">
	        		<div class="info" id="clickInfo_${c.id}">
		        		<div class="box">
		        			<div class="order">第&nbsp;&nbsp;<span class="num">${status.index+1}</span>&nbsp;&nbsp;位乘客</div>
		        			<div class="name"><label>乘客姓名：</label><input type="text" value="${c.name }" readonly="true" id="name"/></div>
		        			<div class="id">
		        				<label>身份证号：</label><input type="text" value="${c.idcard }" readonly="true" id="idcard"/>
		        				<a href="javascript:void(0);" class="update" id="updateRider">更 改</a>	
		        				<a href="javascript:void(0);" class="update" id="updateRiderOk" style="display:none">确 定</a>	
		        				<a href="javascript:void(0);" class="update" id="deleteRiderBtn">删 除</a>	
				        		<input type="hidden" value="${c.id}" id="riderId"/>
		        			</div>
		        		</div>
		        	</div>
        		</c:forEach>
	        	<div class="buy">
	        		<a href="#" class="btn" id="buyBtn">确认购买</a>
	        	</div>
        	</div>
        	<div class="right">
        		<div class="info">
        			<span>去程总价：</span>..............................................<span>￥${bus.price} * </span><span id="ticketNum">1</span>
        		</div>
        		<div class="info money">
        			<span>应付金额：</span>..............................................￥<span class="jine" id="ticketPrice">${bus.price}</span>
        		</div>
         	</div>
        	
        </div>
         <!-- 页面尾部信息 -->
        
        <div class="footer">
            <div class="container">
                <div class="link">
                    <span>友情链接</span>
                    <ul>
                    	<c:forEach items="${configures}" var="c">
                    		<c:if test="${c.type==1}">
	                       		<li><a href="${c.linkurl}">${c.linkname}</a></li>
                    		</c:if>
                    	</c:forEach>
                    </ul>
                </div>
                <div class="source">
                    <span>资源下载</span>
                    <ul>
                        <c:forEach items="${configures}" var="c">
                    		<c:if test="${c.type==2}">
	                       		<li><a href="${c.linkurl}">${c.linkname}</a></li>
                    		</c:if>
                    	</c:forEach>
                    </ul>
                </div>
                <div class="go">
                    <span>站点导航</span>
                    <ul>
                        <c:forEach items="${configures}" var="c">
                    		<c:if test="${c.type==3}">
	                       		<li><a href="${c.linkurl}">${c.linkname}</a></li>
                    		</c:if>
                    	</c:forEach>
                    </ul>
                </div>
                <div class="qq">
                    <img src="${pageContext.request.contextPath}/resource/imgs/qq.png" width="140" height="210">
                    <p>企鹅</p>
                </div>
                <div class="wechat">
                    <img src="${pageContext.request.contextPath}/resource/imgs/qq.png" width="140" height="210">
                    <p>微信</p>
                </div>
            </div>
            <div class="copyright">
                <div class="info">
                	<c:forEach items="${configures}" var="c">
                   		<c:if test="${c.type==4}">
                       		${c.copyright}
                   		</c:if>
                   	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- ******************************************************** -->
    <!-- 回到顶部 -->
    <div class="scroll_top">
        <span class="s_cursor" title="回到顶部"></span>
    </div>
    <!-- Sign In & Sign Up -->
       <div class="yy" style="display:none"></div>
       <div class="login_box" style="display:none">
           <div>
               <div class="title">
                   <a href="javascript:void(0);" class="a_1">登陆</a>
                   <a href="javascript:void(0);" class="a_2">x</a>
               </div>
               <form id="loginForm">
                <div class="username">
                    <div class="logo"></div>
                    <input type="text" name="username" class="txt" placeholder="请输入账号" id="login_username" />
                </div>
                 <div class="password">
                    <div class="logo"></div>
                    <input type="password" name="password" class="txt" placeholder="请输入密码" id="login_password" />
                </div>
                <div class="loginbtn">
                    <input type="button" class="btn" value="登 陆" id="loginBtn"/>
                </div>
               </form>
           </div>
       </div>
       <div class="reg_box" style="display:none">
           <div>
               <div class="title">
                   <a href="javascript:void(0);" href="#" class="a_1">注册</a>
                   <a href="javascript:void(0);" href="#" class="a_2">x</a>
               </div>
               <form id="regForm">
               	<div class="username">
                    <div class="logo"></div>
                    <input type="text" name="username" class="txt" placeholder="请输入账号" id="reg_username" />
                </div>
                 <div class="password">
                    <div class="logo"></div>
                    <input type="password" name="password" class="txt" placeholder="请输入密码" id="reg_password" />
                </div>
                <div class="email">
                    <div class="logo"></div>
                    <input type="text" name="email" class="txt" placeholder="请输入邮箱" id="reg_email" />
                </div>
                <div class="vcode">
                    <img src="${pageContext.request.contextPath}/vcode" width="100" height="38" id="vimg"/>
                    <input type="text" name="vcode" class="txt" placeholder="验证码" id="reg_vcode" />
                </div>
                <div class="loginbtn">
                    <input type="button" class="btn" value="注 册" id="regBtn"/>
                </div>
               </form>
           </div>
       </div>
   	   <!-- tip info -->
       <div class="tip" style="display:none;">
           <div class="loading">
               <img src="${pageContext.request.contextPath}/resource/imgs/loading.gif" width="28" height="28" />
           </div>
           <div class="text" id="tipText">
               	{{ message }}
           </div>
       </div>
</body>

</html>
