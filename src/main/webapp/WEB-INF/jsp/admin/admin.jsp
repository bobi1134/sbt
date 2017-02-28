<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>后台管理系统-四川农业大学校车购票系统</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resource/imgs/logo.png" />
		<!-- 自定义css样式 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/css/style.css">
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
				<p>您当前所在位置：首页 > 后台中心</p>
			</div>
			<!--end r_location-->
			
			<!--r_message start-->
			<div class="r_message">
				<div class="m_list m_1">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>
				</div>
				<div class="m_list m_2">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_3">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_4">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_5">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_6">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_7">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_8">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_9">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="m_list m_10">
					<div class="m_pic"></div>
					<div class="m_desc">
						<span>2450</span>
						<p>所有用户数</p>
					</div>				
				</div>
				<div class="clear"></div>
			</div>
			<!--end r_message-->
			
			<!--r_table start-->
			<div class="r_table">
				<div class="r_title">
					<i></i>
					<p>表格表单类</p>
				</div>
				<div class="r_label">
					<ul>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon1"></i>
								<span>添加</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon2"></i>
								<span>编辑</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon3"></i>
								<span>添加章节</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon4"></i>
								<span>上传资料</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon5"></i>
								<span>置顶</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon6"></i>
								<span>取消置顶</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon7"></i>
								<span>生成静态页面</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon8"></i>
								<span>删除</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon9"></i>
								<span>审核信息</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon10"></i>
								<span>刷新数据</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<i class="l_icon11"></i>
								<span>标记</span>
							</a>
						</li>

					</ul>
				</div>
				<div class="r_search">
					<input type="button" value="GO" class="r_btn"/>
					<input type="text" class="r_text"/>
				</div>
				<div class="clear"></div>

				<div class="r_table_list">
					<table class="t_tab">	
						<thead>
							<tr>
								<th>11</th>
								<th>ID</th>
								<th>标题</th>
								<th>发布者</th>
								<th>点击数</th>
								<th>类型</th>
								<th>发布时间</th>
								<th>置顶</th>
								<th>静态化</th>
								<th>评论</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>111</td>
								<td>232</td>
								<td>波波老师的成长之路</td>
								<td>Mr.x</td>
								<td>11223</td>
								<td>文章</td>
								<td>2016/10/06</td>
								<td>已置顶</td>
								<td>已静态化</td>
								<td>是</td>
								<td>已发布</td>
								<td>
									<div class="t_action">
										<a href="javascript:void(0);" class="a_see" title="查看详情"></a>
										<a href="javascript:void(0);" class="a_edit" title="编辑"></a>
										<a href="javascript:void(0);" class="a_save" title="保存"></a>
										<a href="javascript:void(0);" class="a_del" title="删除"></a>
									</div>
								</td>
							</tr>
							<tr>
								<td>111</td>
								<td>232</td>
								<td>波波老师的成长之路</td>
								<td>Mr.x</td>
								<td>11223</td>
								<td>文章</td>
								<td>2016/10/06</td>
								<td>已置顶</td>
								<td>已静态化</td>
								<td>是</td>
								<td>已发布</td>
								<td>
									<div class="t_action">
										<a href="javascript:void(0);" class="a_see" title="查看详情"></a>
										<a href="javascript:void(0);" class="a_edit" title="编辑"></a>
										<a href="javascript:void(0);" class="a_save" title="保存"></a>
										<a href="javascript:void(0);" class="a_del" title="删除"></a>
									</div>
								</td>
							</tr>
							<tr>
								<td>111</td>
								<td>232</td>
								<td>波波老师的成长之路</td>
								<td>Mr.x</td>
								<td>11223</td>
								<td>文章</td>
								<td>2016/10/06</td>
								<td>已置顶</td>
								<td>已静态化</td>
								<td>是</td>
								<td>已发布</td>
								<td>
									<div class="t_action">
										<a href="javascript:void(0);" class="a_see" title="查看详情"></a>
										<a href="javascript:void(0);" class="a_edit" title="编辑"></a>
										<a href="javascript:void(0);" class="a_save" title="保存"></a>
										<a href="javascript:void(0);" class="a_del" title="删除"></a>
									</div>								
								</td>
							</tr>
							<tr>
								<td>111</td>
								<td>232</td>
								<td>波波老师的成长之路</td>
								<td>Mr.x</td>
								<td>11223</td>
								<td>文章</td>
								<td>2016/10/06</td>
								<td>已置顶</td>
								<td>已静态化</td>
								<td>是</td>
								<td>已发布</td>
								<td>
									<div class="t_action">
										<a href="javascript:void(0);" class="a_see" title="查看详情"></a>
										<a href="javascript:void(0);" class="a_edit" title="编辑"></a>
										<a href="javascript:void(0);" class="a_save" title="保存"></a>
										<a href="javascript:void(0);" class="a_del" title="删除"></a>
									</div>								
								</td>
							</tr>
						</tbody>


					</table>
				
				</div>
			
			</div>
			<!--end r_table-->


		</div>


	</div>


</body>
</html>