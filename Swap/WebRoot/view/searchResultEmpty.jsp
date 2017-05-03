<%@page language="java" import="java.util.*,java.net.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
	prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Swap</title>
<meta property="wb:webmaster" content="c65b073df2ffe5a1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-switch.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/buttons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css"></link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/indexStyle.css">
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
							//后面需要加上随机数，以防浏览器缓存图片为同一地址（注册验证码）
							document.getElementById("photo").src = "${pageContext.request.contextPath}/view/makeCertPic.jsp?"
									+ Math.random();
						});
	});
</script>
</head>

<body style="background-color:white;">
	<%
		//设置默认地址
		session.setAttribute("adress","index");
		/* 获取cookie */
		request.setCharacterEncoding("utf-8");
		String username = "";
		String password = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("username")) {
					username = URLDecoder.decode(c.getValue(), "utf-8");
				}
				if (c.getName().equals("password")) {
					password = URLDecoder.decode(c.getValue(), "utf-8");
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
				<li><a
					href="${pageContext.request.contextPath}/users/userQuery.action">首页</a></li>
				<li class="active"><a
					href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth">商店</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">个人中心</a></li>
				<li><a href="#" data-toggle="modal"
					data-target="#about-modal">关于</a></li>
			</ul>
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
					<button type="button" class="close"
						data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span
							class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="modal-label">关于</h4>
				</div>
				<div class="modal-body">
					<p>@2016 Swap开发团队</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">了解了</button>
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

	
	<div class="container" style="width:100%;margin-top:50px;;min-height:370px;text-align: center;color: #aaa">
     	<img alt="" src="${pageContext.request.contextPath}/img/error.jpg" width="200" height="200">
     	<h3>无搜索结果，重新搜索吧！</h3>
     	
    </div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
		-->
	<br />
	<br />
	<footer
		style="padding: 15px;margin-top: 0px;background-color: #eee;">
	<p align="center">@2016 Swap开发团队</p>
	</footer>

</body>

</html>
