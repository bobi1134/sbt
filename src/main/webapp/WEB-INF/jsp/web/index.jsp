<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <title>首页-四川农业大学校车购票系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
    <!-- 引入样式 -->
    <!-- 动画样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/animate.min.css" />
    <!-- less css -->
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resource/less/less-index.less" />
    <!-- 引入js -->
    <!-- jQuery插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script>
    <!--less编译插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/less2.5.3.js"></script>
    <!--数字滚动插件(带自定义js)-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/animateBackground-plugin.js"></script>
    <!--滚动条插件(带自定义js)-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.nicescroll.js"></script>
	<!-- vue.js -->    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/vue.js"></script>
    <!--自定义页面效果js-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/js-index.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript">
    	var path = "${pageContext.request.contextPath}";
    </script>
</head>

<body>
    <div class="container_index">
        <!-- 页面第一个部分 -->
        <div class="page-one animated bounceInDown">
            <!-- 导航 -->
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
            <!-- 中部信息 -->
            <div class="center-info">
                <span>The system has been sold</span>
                <span class="num"></span>
                <span>Trips!</span>
            </div>
            <!-- 查看车次 -->
            <div class="bus-info">
                <a href="${pageContext.request.contextPath}/bus">查看车次</a>
            </div>
        </div>
        <!-- 页面第二个部分 -->
        <div class="page-two">
            <div class="content_top">
                <div class="h1">告别线下购票&nbsp;·&nbsp;1步进行网上运营</div>
                <div class="content">
                    <div class="app">
                        <span class="title">配套APP</span>
                        <p class="description">
                            使用标准WEB技术开发iOS、Android原生应用，各类功能一站聚合、一键接入
                        </p>
                    </div>
                    <div class="web">
                        <span class="title">网站管理</span>
                        <p class="description">
                            涵盖推送、云修复、版本更新、大数据统计分析等全面运维功能
                        </p>
                    </div>
                    <div class="app">
                        <span class="title">配套APP</span>
                        <p class="description">
                            使用标准WEB技术开发iOS、Android原生应用，各类功能一站聚合、一键接入
                        </p>
                    </div>
                    <div class="web">
                        <span class="title">网站管理</span>
                        <p class="description">
                            涵盖推送、云修复、版本更新、大数据统计分析等全面运维功能
                        </p>
                    </div>
                </div>
            </div>
            <div class="content_center">
                <div class="content_1"></div>
                <div class="content_2"></div>
                <div class="content_3">
                    <div class="top">川农校车购票系统</div>
                    <div class="tit"> 不止于开发，不止于创新，服务于川农人的购票系统，我们一直在努力！
                    </div>
                    <div class="three">
                        <div class="left">APP平台</div>
                        <div class="middle">网站运营</div>
                        <div class="right">定制服务</div>
                    </div>
                </div>
            </div>
            <div class="content_bottom">
                <div class="h1">从线下到线上，服务于川农学子！</div>
                <div class="tit">简单、快捷、方便、安全</div>
                <div class="href">
                    <div class="left">
                        <a href="javascript:void(0);">APP使用</a>
                    </div>
                    <div class="right">
                        <a href="javascript:void(0);">专属定制</a>
                    </div>
                </div>
                <div class="href_intr">
                    <div class="left">手机电脑一体化，任何一个在手上后可以方便使用</div>
                    <div class="right">线上线下为您排忧解难，技术和服务一起加油</div>
                </div>
                <div class="href">
                    <div class="left">
                        <a href="javascript:void(0);">APP使用</a>
                    </div>
                    <div class="right">
                        <a href="javascript:void(0);">专属定制</a>
                    </div>
                </div>
                <div class="href_intr">
                    <div class="left">手机电脑一体化，任何一个在手上后可以方便使用</div>
                    <div class="right">线上线下为您排忧解难，技术和服务一起加油</div>
                </div>
            </div>
        </div>
        <!-- 页面尾部信息 -->
        <div class="page-footer">
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
    
    <!-- **************************************************** -->
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
                 <img src="${pageContext.request.contextPath}/vcode" width="100" height="38" id="vimg" v-on:click="changeVImg"/>
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
