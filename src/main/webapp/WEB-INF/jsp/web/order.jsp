<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head>
    <title>我的订单-四川农业大学校车购票系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
    <!-- ********************个人中心的几个页面全部使用zone的css、js********************** -->
    <!-- 引入样式 -->
    <!-- less css -->
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resource/less/less-zone.less" />
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/js-zone.js"></script>
       <!-- 自定义js -->
    <script type="text/javascript">
    	var path = "${pageContext.request.contextPath}";
	</script>
</head>

<body>
    <div class="container_zone">
        <!-- 头部信息 -->
        <div class="zone_header">
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
        <!-- 个人中心 -->
        <div class="zone_pc zone_order">
            <div class="location">
                <i class="icon iconfont icon-llcouponmapmark"></i> 当前位置 > 个人中心 > 我的订单
            </div>
            <div class="order">
            </div>
        </div>
        <!-- 页面尾部信息 -->
        <div class="zone_footer">
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
        <!-- 固定在左边的菜单 -->
        <div class="zone_menu">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}">
                        <i class="icon iconfont icon-shouyeshouye"></i><span>回到首页</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/message" style="position: relative;">
                        <i class="icon iconfont icon-xiaoxitongzhi"></i><span>消息通知</span>
                        <c:if test="${isRead==1}">
                        	<span style="width='10px';height='10px';border: 1px solid #F90E65;display: block;height: 4px;width: 4px;/* float: right; */position: absolute;top: 14px;right: 46px;border-radius: 2px;background-color: #F90E65;" id="leftMenuIsRead"></span>
                        </c:if>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/info">
                        <i class="icon iconfont icon-gerenziliao"></i><span>个人资料</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/order">
                        <i class="icon iconfont icon-dingdan"></i><span>我的订单</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="icon iconfont icon-yuliu"></i><span>预留位置</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="icon iconfont icon-yuliu"></i><span>预留位置</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="icon iconfont icon-yuliu"></i><span>预留位置</span>
                    </a>
                </li>
            </ul>
            <i class="icon iconfont icon-xiangzuo" id="xiangzuo" style="display: none"></i>
            <i class="icon iconfont icon-xiangyou" id="xiangyou"></i>
        </div>
    </div>
</body>

</html>
