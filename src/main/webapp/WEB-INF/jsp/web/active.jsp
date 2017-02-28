<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <title>账号激活-四川农业大学校车购票系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
    <!-- 引入样式 -->
    <!-- less css -->
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resource/less/less-active.less" />
    <!-- 引入阿里巴巴图标库 -->
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_u9tdxp8vjbvjkyb9.css">
    <!-- 引入js -->
    <!-- jQuery插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script>
    <!--less编译插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/less2.5.3.js"></script>
    <!--滚动条插件(带自定义js)-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.nicescroll.js"></script>
    <!-- 自定义 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/js-active.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript">
        /**********************倒计时跳往首页***************************/
        var miao = 10;
        var URL;
        function load(url){
            URL = url;
            for(var i = miao; i >= 0; i--){
                //10 9 8 7 6 5 4 3 2 1 0依次传给doUpdate(num)函数更新秒
                window.setTimeout('doUpdate('+ i +')', (miao - i) * 1000);
            }
        }

        //更新秒
        function doUpdate(num){
            document.getElementById("time").innerHTML = num;
            if(num == 0){
                window.location = URL;
            }
        }

        load("http://localhost:8080/sbt/index");
    </script>
</head>

<body>
    <div class="container_active">
        <!-- 头部信息 -->
        <div class="active_header">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/resource/imgs/logo.png" width="100" height="100">
                <span class="logo-title">四川农业大学校车购票系统</span>
            </div>
            <c:if test="${login_user != null}">
	            <div class="session_user">
	               	<a href="${pageContext.request.contextPath}/user/logout" class="logout" id="LogOut" title="退出">LogOut</a>
	                <a href="${pageContext.request.contextPath}/user/zone"><img src="${pageContext.request.contextPath}/resource/${login_user.img}" width="50" height="50" title="${login_user.username}" /></a>
	           	</div>
            </c:if>
        </div>
        <!-- 个人中心 -->
        <div class="active_pc">
            <div class="location">
                <i class="icon iconfont icon-llcouponmapmark"></i> 当前位置 > 账号激活
            </div>
            <div class="href">
                <p>账号激活成功！将在<span id="time">10</span>秒后自动转入<a href="http://localhost:8080/sbt/index">首页</a>，请稍后...</p>
            </div>
        </div>
        <!-- 页面尾部信息 -->
        <div class="active_footer">
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
        <!-- 回到顶部 -->
        <div class="scroll_top">
            <span class="s_cursor" title="回到顶部"></span>
        </div>
    </div>
</body>

</html>
