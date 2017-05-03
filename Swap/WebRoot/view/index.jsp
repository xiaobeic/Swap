<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-transform" />
<title>Swap</title>
<meta property="wb:webmaster" content="c65b073df2ffe5a1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-switch.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/buttons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css"></link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/indexStyle.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!--<加载bootstrap.min.js之前先加载jquery.min.s-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-switch.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/myjs-home.js"></script>
<script type="text/javascript">
	new WOW().init();
	getTop();
	$(function() {
		$("#butimg")
				.click(
						function() {
							//后面需要加上随机数，以防浏览器缓存图片为同一地址
							document.getElementById("photo").src = "${pageContext.request.contextPath}/view/makeCertPic.jsp?"
									+ Math.random();
						});
	});
</script>
</head>
<body style="background-color:#eee;">
		<%
		//设置当前地址
		session.setAttribute("adress","index");
			/* 获取cookie */
			request.setCharacterEncoding("utf-8");
	    	String username="";
	    	String password="";
	    	Cookie[] cookies=request.getCookies();
	    	if(cookies!=null&&cookies.length>0)
	    	{
	    		for(Cookie c:cookies)
	    		{
	    			if(c.getName().equals("username"))
	    			{
	    				username=URLDecoder.decode(c.getValue(),"utf-8");
	    			}
	    			if(c.getName().equals("password"))
	    			{
	    				password=URLDecoder.decode(c.getValue(),"utf-8");
	    			}
	    		}
	    	}
	     %>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：导航栏
		-->
	<nav class="nav navbar-inverse navbar-fixed-top my-nav"
		role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="#" class="navbar-brand"> <img
				src="${pageContext.request.contextPath}/img/logo.png"
				style="height: 45px;margin-top: -10px;" />
			</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">首页</a></li>
				<li><a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth">商店</a></li>
				<li><a href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">个人中心</a></li>
				<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
			</ul>
			<%
				/* session身份为空的时候  显示登入界面   否则显示登入后状态 */
				if (session.getAttribute("username") != null) {
			%>
			<div id="login-area"
				style="float: right;margin-right: 15px;margin-top: 5px;">
				<ul class="clearfix logined">

					<li class="set_btn user-card-box"><a id="header-avator"
						class="user-card-item"
						href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">
							<img src='/path/${shopsCustom.headimg }'
							width='35' height='35' /> <i class="myspace_remind"
							style="display: none;"></i>
					</a>
						<div class="g-user-card">
							<div class="card-inner">
								<div class="card-top">
									<img src="/path/${shopsCustom.headimg }"
										alt="${shopsCustom.username }" class="l"> <span class="name text-ellipsis">${shopsCustom.username }</span>
								</div>
								<div class="card-links">
									<a
										href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do"
										class="my-mooc l">我的店铺<i class="dot-update"></i></a> <span
										class="split l"></span> <a
										href="${pageContext.request.contextPath}/goods/goodsCollectionSelect.do"
										class="my-sns l">宝贝收藏</a>
								</div>
								<div class="card-sets clearfix">
									<a
										href="${pageContext.request.contextPath}/users/userAndShopQuery.do"
										class="l">账号设置</a> <a
										href="${pageContext.request.contextPath}/logout.action"
										class="r">退出</a>
								</div>
							</div>
							<i class="card-arr"></i>
						</div></li>
				</ul>
			</div>
			<%
				} else {
			%>
			<div class="navbar-form navbar-right">
				<div class="input-group"
					style="overflow:hidden;margin-top: 5px;padding-right:10px;">
					<a href="#" id="my-login" class="navbar-link active login-a"
						data-toggle="modal" data-target="#login-modal">登入</a> <span
						style="color:white;">|</span> <a href="#" id="my-register"
						class="navbar-link login-a" data-toggle="modal"
						data-target="#login-modal">注册</a>
				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>
	</nav>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：关于模态框
		-->
	<div class="modal fade" id="about-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="modal-label">关于</h4>
				</div>
				<div class="modal-body">
					<p>@2016 Swap开发团队</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
				</div>
			</div>
		</div>
	</div>

	<!--
        	作者：756048962@qq.com
        	时间：2015-12-22
        	描述：登录注册模态框
        -->
	<div class="modal  fade" id="login-modal">
		<div class="modal-dialog" style="width:330px;">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true" style="font-size:large;"
							class="glyphicon glyphicon-remove"></span> <span class="sr-only">关闭</span>
					</button>
					<!--tab标签-->
					<ul id="mytab" class="nav nav-tabs">
						<li id="mytab_li1"><a id="login_a1" href='#xw1'
							data-toggle='tab'>登录</a></li>
						<li id="mytab_li2"><a id="login_a2" href='#xw2'
							data-toggle='tab'>注册</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade" id="xw1">
							<br> <br>
							<div class="container">
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/login.action"
									method="post">
									<input name="adress" value="index" type="hidden"/> 
									<div class="form-group">
										<div class="has-feedback form-group-lg" style="width:300px;">
											<input type="text" name="username" class="form-control" value="<%=username %>"
												placeholder="用户名/email" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg" style="width:300px;">
											<input type="password" name="password" class="form-control" value="<%=password %>"
												placeholder="密码" />
										</div>
									</div>
									<div class="form-group">
										<div style="width: 300px;">
											<div style="padding-left:20px;">
												<input type="checkbox" name="isUseCookie" checked="checked"/>  <span
													style="color: #555;margin-right: 100px;">记住密码</span> <a
													href="#" class="forget-a">忘记密码</a>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div style="width:300px;" align="center">
											<span
												class="button-dropdown  button-dropdown-primary  button-raised">
												<input type="submit"
												class="button  button-rounded button-large"
												style="background-color: #F58400;color: white;" value="登入">
											</span>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="tab-pane fade" id="xw2">
							<br> <br>
							<div class="container">
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/register.action"
									method="post">
									<input name="adress" value="index"  type="hidden"/>
									<div class="form-group">
										<div class="has-feedback form-group-lg" style="width:300px;">
											<input type="text" name="username" class="form-control"
												placeholder="用户名/email" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg" style="width:300px;">
											<input type="password" name="password" class="form-control"
												placeholder="密码" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg">
											<div style="width:180px;float:left;padding-right:40px;">
												<input type="text" name="validatenum" class="form-control"
													placeholder="验证码" />
											</div>

											<div style="width:70px;float:left;padding-right:40px;">
												<img
													src="${pageContext.request.contextPath}/view/makeCertPic.jsp"
													id="photo" alt="验证码" width="80px" height="40px" />
											</div>
											<div
												style="width:40px;float:left;padding:10px;padding-left:15px;">
												<span id="butimg" class="glyphicon glyphicon-repeat"
													style="font-size:larger;"></span>
											</div>
										</div>
									</div>
							</div>
							<div class="form-group">
								<div style="width:300px;" align="center">
									<span
										class="button-dropdown  button-dropdown-primary  button-raised">
										<input type="submit"
										class="button  button-rounded button-large"
										style="background-color: #F58400;color: white;" value="注册">
									</span>
								</div>
							</div>
							</form>
						</div>
					</div>
					<script>
						$('#mytab a[href="#xw1"]').tab('show');
					</script>

				</div>

			</div>
		</div>
	</div>

	<!--
    	作者：756048962@qq.com
    	时间：2016-03-22
    	描述：搜索框
    -->
	<div class="container" style="margin-top: 60px;width: 1245px;">
		<div style="float: left;margin-left: 100px;" class="wow swing">
			<img src="${pageContext.request.contextPath}/img/logo.png"
				style="float: left;width: 200px;height: 150px;" />
		</div>
		<div class="searchbox">
			<ul>
				<li><a href="#" class="style1">宝贝</a></li>
				<li><a href="#">店铺</a></li>
			</ul>
			<img src="${pageContext.request.contextPath}/img/photo-02.png"
				style="float: right;margin-right:150px;margin-top: -40px;width: 120px;height: 40px;" />
			<div class="searchbodys">
				<form name="searchform" method="post" action="${pageContext.request.contextPath }/search/searchGoods.action">
					<p>
						<input id="searchGoods_input" type="text" name="goodsInfo" value="" class="inp" placeholder="输入宝贝内容" />
					</p>
					<p>
						<input id="searchShops_input" type="text" name="shopsInfo" value="" class="inp" placeholder="输入商店名称" />
					</p>
					<input type="submit"  name="submit" class="searchBut" value="搜索" />
				</form>
			</div>
		</div>
	</div>


	<!--
    	作者：756048962@qq.com
    	时间：2016-03-27
    	描述：首页大分类
    -->
	<div class="container"
		style="min-height: 400px;width: 1240px;margin-top: 50px;padding-left: 60px;">
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth"
				title="男装"> <img class="img-rounded"
				src="${pageContext.request.contextPath}/img/home-01.jpg" /> <span
				title="男装">男装</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=女装&address=womancloth"
				title="女装"> <img
				src="${pageContext.request.contextPath}/img/home-02.jpg"
				class="img-rounded" /> <span title="女装">女装</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=箱包&address=cases"
				title="箱包"> <img
				src="${pageContext.request.contextPath}/img/home-11.jpg"
				class="img-rounded" /> <span title="箱包">箱包</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=美妆&address=beauty"
				title="美妆"> <img
				src="${pageContext.request.contextPath}/img/home-03.jpg"
				class="img-rounded" /> <span title="美妆">美妆</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=汽车&address=subpage"
				title="汽车"> <img
				src="${pageContext.request.contextPath}/img/home-04.jpg"
				class="img-rounded" /> <span title="汽车">汽车</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=家居&address=house"
				title="家居"> <img
				src="${pageContext.request.contextPath}/img/home-05.jpg"
				class="img-rounded" /> <span title="家居">家居</span>
			</a>
		</div>

		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=图书&address=book" title="图书">
				<img src="${pageContext.request.contextPath}/img/home-09.jpg"
				class="img-rounded" /> <span title="图书">图书</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=手机&address=cellphone"
				title="手机"> <img
				src="${pageContext.request.contextPath}/img/home-06.jpg"
				class="img-rounded" /> <span title="手机">手机</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=电脑&address=computer"
				title="电脑"> <img
				src="${pageContext.request.contextPath}/img/home-10.jpg"
				class="img-rounded" /> <span title="电脑">电脑</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=户外&address=outdoors"
				title="户外"> <img
				src="${pageContext.request.contextPath}/img/home-07.jpg"
				class="img-rounded" /> <span title="户外">户外</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=食品&address=eatdrink"
				title="食品"> <img
				src="${pageContext.request.contextPath}/img/home-08.jpg"
				class="img-rounded" /> <span title="食品">食品</span>
			</a>
		</div>
		<div class="wow bounceIn thumbnail  home_goods">
			<a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=其他&address=rest" title="其他">
				<img src="${pageContext.request.contextPath}/img/home-12.jpg"
				class="img-rounded" /> <span title="其他">其他</span>
			</a>
		</div>
	</div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
		-->
	<br />
	<br />
	<footer style="padding: 15px;margin-top: 20px;background-color: white;">
	<p align="center">@2016 Swap开发团队</p>
	</footer>

	<!--
        	作者：756048962@qq.com
        	时间：2015-12-21
        	描述：右下角流动框
        -->
	<div id="getTop" class="fixed-btn"
		style="background: #d0d6d9;-webkit-border-radius: 10%;display: none;">
		<a id="toTop"><span class="glyphicon glyphicon-chevron-up"></span></a>
	</div>
</body>



</html>
