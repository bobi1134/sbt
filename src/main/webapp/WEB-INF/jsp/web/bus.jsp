<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
    <title>车次查询-四川农业大学校车购票系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
    <!-- 引入样式 -->
    <!-- 动画样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/animate.min.css" />
    <!-- 日期样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.css" />
    <!-- less css -->
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resource/less/less-bus.less" />
    <!-- 引入js -->
    <!-- jQuery插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script>
    <!--less编译插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/less2.5.3.js"></script>
    <!-- jquery-ui js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <!--滚动条插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.nicescroll.js"></script>
    <!-- 自定义 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/js-bus.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript">
    	var days = "${days}";
    	var path = "${pageContext.request.contextPath}";
    	var buses_size = "${buses_size}";
    	var login_user = "${login_user}";
	</script>
</head>

<body>
    <div class="container_choose">
        <div class="choose_header">
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
        <div class="choose_search">
            <div class="search">
            	<form action="${pageContext.request.contextPath}/bus/search" method="post">
	                <label>出发地点:&nbsp;</label>
	                <input type="text" name="start" id="tags_start" value="${bus.start}"/>&nbsp;&nbsp;
	                <label>到达地点:&nbsp;</label>
	                <input type="text" name="end" id="tags_end" value="${bus.end}"/>&nbsp;&nbsp;
	                <label>出发日期:&nbsp;</label>
	                <input type="text" name="chooseDate" id="datepicker" readonly="true" value="${chooseDate}"/>&nbsp;&nbsp;
	                <button>搜 索</button>
            	</form>
            </div>
        </div>
        <div class="choose_table">
            <table width="96%" border="1" id="ticketsTable">
                <tr>
                    <th>发车时间</th>
                    <th>发站</th>
                    <th>到站</th>
                    <th>车型</th>
                    <th>运行时长</th>
                    <th>票价</th>
                    <th>余票</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${buses}" var="c"> 
	                <tr>
	                    <td>${chooseDate} <fmt:formatDate value="${c.time}" type="time" pattern="HH:mm:ss"/></td>
	                    <td>${c.start}</td>
	                    <td>${c.end}</td>
	                    <td>${c.type}</td>
	                    <td>${c.runtime}</td>
	                    <td>￥${c.price}</td>
	                    <td>${c.surplus}</td>
	                    <td style="display:none" id="busIds">${c.ids}</td>
	                    <c:choose>
	                    	<c:when test="${c.surplus < 1}">
			                    <td><a href="javascript:void(0);" class="book">抢票</a></td>
	                    	</c:when>
	                    	<c:otherwise>
			                    <td><a href="javascript:void(0);" class="book" id="bookTicket">预定</a></td>
	                    	</c:otherwise>
	                    </c:choose>
	                </tr>
                </c:forEach>
            </table>
            <form action="${pageContext.request.contextPath}/rider" id="riderForm" method="post">
            	<input type="hidden" name="hiddenBusIds" id="hiddenBusIds"/>
            	<input type="hidden" name="hiddenDate" id="hiddenDate"/>
            </form>
        </div>
         <!-- 页面尾部信息 -->
        <div class="choose_footer">
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
