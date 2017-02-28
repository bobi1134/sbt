<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>图表类-四川农业大学校车购票系统</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
		<!-- 自定义css样式 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/css/style.css">
		<!-- js -->
	  	<!-- jQuery插件 -->
    	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/js/echarts.js"></script>
    	<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
	</head>
<body>

	<div class="tz_content">

		<!--t_left start-->
		<div class="t_left">
			<div class="l_logo">
                <img src="${pageContext.request.contextPath}/resource/admin/images/cn.png" width="80" height="80" style="margin:15px 0 0 0px;"/>
                <div class="text">
                	SYSTEM
                </div>
            </div>
			<div class="l_nav">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/user/chart">
							<i class="icon_1"></i>
							<span>图表类</span>
						</a>
					</li>

					<li>
						<a href="javascript:void(0);">
							<i class="icon_2"></i>
							<span>表格表单类</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="icon_3"></i>
							<span>标签按钮类</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="icon_4"></i>
							<span>日历类</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="icon_5"></i>
							<span>TAB轮换</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="icon_6"></i>
							<span>其他元素</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!--t_left end-->
		
		<!--t_header start-->
		<div class="t_header">
			<!--h_nav start-->
			<div class="h_nav">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/user/admin" class="h_sel">
							<i class="h_icon1"></i>
							<span>首页</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="h_icon2"></i>
							<span>界面管理</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="h_icon3"></i>
							<span>栏目管理</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="h_icon4"></i>
							<span>内容管理</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="h_icon5"></i>
							<span>用户管理</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="h_icon6"></i>
							<span>论坛中心</span>
						</a>
					</li>
 					<li>
						<a href="javascript:void(0);">
							<i class="h_icon7"></i>
							<span>应用中心</span>
						</a>
					</li>

					<li>
						<a href="javascript:void(0);">
							<i class="h_icon8"></i>
							<span>工具</span>
						</a>
					</li>
				</ul>				
			</div>
			<!--end h_nav-->

			<!--h_info start-->
			<div class="h_info">
				<div class="h_user">当前用户：${login_user.username} , 身份：系统管理员</div>
				<div class="h_out">
					<a href="${pageContext.request.contextPath}/user/logout">
						<span>退出</span>
						<i></i>
					</a>
				</div>
			</div>
			<!--end h_info-->
		
		</div>
		<!--end t_header-->

		<div class="t_right">

			<!--r_location start-->
			<div class="r_location">
				<i></i>
				<p>您当前所在位置：首页 > 图表类</p>
			</div>
			<!--end r_location-->
			
			<!-- ********************************图表类******************************** -->
			<div id="chart-1" style="height:360px;width:100%;"></div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/js/chart-1.js"></script>
			
			<div id="chart-2" style="height:360px;width:800px;margin:0 auto;display:none;"></div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/js/chart-2.js"></script>
			
			<div class="btn">
				<a href="javascript:void(0);" id="btn-1">图A</a>
				<a href="javascript:void(0);" id="btn-2">图B</a>
			</div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/js/chart.js"></script>
		</div>


	</div>


</body>
</html>