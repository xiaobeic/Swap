<%@ page language="java" import="java.util.*,java.net.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/indexStyle.css"></link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/sellerCenter.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!--<加载bootstrap.min.js之前先加载jquery.min.s-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-switch.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Chart.js"></script>
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
		session.setAttribute("adress","sellerCenter");
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
				<li><a href="#">首页</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth">商店</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">个人中心</a></li>
				<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
			</ul>
			<%
				/* session身份为空的时候  显示登入界面   否则显示登入后状态 */
						if(session.getAttribute("username")!=null){
			%>
			<div id="login-area"
				style="float: right;margin-right: 15px;margin-top: 5px;">
				<ul class="clearfix logined">

					<li class="set_btn user-card-box"><a id="header-avator"
						class="user-card-item"
						href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">
							<img src='/path/${user.headimg }' id="${user.headimg }" class="userHeadimg" width='35' height='35' /> 
							<i class="myspace_remind" style="display: none;"></i>
					</a>
						<div class="g-user-card">
							<div class="card-inner">
								<div class="card-top">
									<img src="/path/${user.headimg }" alt="${user.username }"
										class="l"> <span class="name text-ellipsis">${user.username }</span>
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
				}
						else{
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
	<div class="modal fade " id="about-modal ">
		<div class="modal-dialog ">
			<div class="modal-content ">
				<div class="modal-header ">
					<button type="button " class="close " data-dismiss="modal ">
						<span aria-hidden="true ">&times;</span> <span class="sr-only ">关闭</span>
					</button>
					<h4 class="modal-title " id="modal-label ">关于</h4>
				</div>
				<div class="modal-body ">
					<p>@2016 Swap开发团队</p>
				</div>
				<div class="modal-footer ">
					<button type="button " class="btn btn-default "
						data-dismiss="modal ">了解了</button>
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
									<input name="adress" value="sellerCenter" type="hidden" />
									<div class="form-group">
										<div class="has-feedback form-group-lg" style="width:300px;">
											<input type="text" name="username" class="form-control"
												value="<%=username%>" placeholder="用户名/email" />
										</div>
									</div>
									<div class="form-group">
										<div class="form-group-lg" style="width:300px;">
											<input type="password" name="password" class="form-control"
												value="<%=password%>" placeholder="密码" /> <input
												type="checkbox" />
										</div>
									</div>
									<div class="form-group">
										<div style="width: 300px;">
											<div style="padding-left:20px;">
												<input type="checkbox" name="isUseCookie" checked="checked" />
												<span style="color: #555;margin-right: 100px;">记住密码</span> <a
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
									<input name="adress" value="sellerCenter" type="hidden" />
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
       	时间：2015-12-22
       	描述：留言模态框
      -->
	<div class="modal fade" id="respone-modal">
		<div class="modal-dialog modal-content" style="width: 695px;">
			<div class="modal-header" style="background-color: #eee;border-radius: 5px;padding: 7px 10px;">
				<span style="font-size: 16px;font-weight: 800;">给ta留言</span>
				<span data-dismiss="modal" class="icon-remove" style="float: right;"></span>
			</div>
			<div id="respone_mess" style="width: 690px;height:300px;overflow-y: scroll;padding: 20px 10px;">
				<div id="respone_none" style="width: 100%;line-height: 300px;text-align: center;">
					<span style="font-size: 18px;color:#aaa">还没有留言..</span>
				</div>
			</div>
			<div style="width:690px;">
				<form id="resFrom" method="post" action="#" class="form-horizontal">
					<input id="resUserid" value="" name="userId"  type="hidden"/>
					<div class="form-group" style="margin-left: 5px;">
						<div>
							<textarea id="textMess"  name="message" placeholder="编辑回复内容" style="width: 660px;resize:none" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<span id="resMessSpan" style="display:inline-block;width: 465px;margin-left:5px; ;text-align: left;color:red;"></span>
							<button type="button" class="button button-rounded button-raised  button-small" data-dismiss="modal">取消</button>
							<button id="texta"  type="submit" class="button button-rounded button-raised button-primary button-small" style="margin-left: 10px;">留言</button>
						</div>
					</div>
				</form>
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
	
	<!-- 存取session，以便验证登入权限 -->
	<div style="display: none">
		<span id="<%=session.getAttribute("id") %>" class="sessionText"></span>
	</div>

	<!--
        	作者：756048962@qq.com
        	时间：2016-03-25
        	描述：店铺信息
        -->
	<div class="container" style="width: 1020px;min-height: 400px;">
		<!--
            	作者：756048962@qq.com
            	时间：2016-03-25
            	描述：店主信息
            -->
		<div class="shopman_info">
			<div class="shopman_info_head">${shopsCustom.shopname }</div>
			<div class="shopman_info_div1">
				<div class="peopledata11">
					<img src="/path/${shopsCustom.headimg }" title="商户照片" />
				</div>
				<div class="peopledata12">
					<p>
						<a href="#">${shopsCustom.username }</a>
					</p>
					<p>
						<span>信誉:</span> <span style="color: #F58400;font-size: 16px;">${shopsCustom.reputationvalue }</span>
					</p>
					<p>
						<span>
							<a style="display: none" href="${shopsCustom.id }" id="shopsColl_textA"></a>
							<c:if test="${shopsCollection==null }">
								<a href="#" id="${shopsCustom.id }"></a>
								<span title="收藏店铺" class="icon-star icon-large sellCen_click shopman_span1 shopman_span2" style="cursor:hand">
									<span style="color: #5E5E5E;">收藏店铺</span>
								</span>	
							</c:if>
							<c:if test="${shopsCollection!=null }">
								<a href="#" id="${shopsCollection.id }"></a>
								<span title="取消收藏" class="icon-star icon-large sellCen_click shopman_span1 shopman_span3" style="cursor:hand">
									<span style="color: #5E5E5E;">取消收藏</span>
								</span>	
							</c:if>
							
						</span>
					</p>
				</div>
				<div class="peopledata13">
					<p class="icon-bullhorn pubInfo">
						<marquee scrollamount="3" onmouseover="this.stop()"
							onmouseout="this.start()">${shopsCustom.announcement }</marquee>
					</p>
					<br />
					<p>
						<span>入店时间:</span> 
						<span><fmt:formatDate value="${shopsCustom.createdate }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;&nbsp;
						<a  href="#" data-toggle="modal" data-target="#respone-modal" id="${shopsCustom.userId }"
							class="button button-primary button-rounded button-tiny respone_a">留言</a>
					</p>
				</div>
			</div>
			<div class="shopman_info_div2">
				<p>
					<span class="icon-phone icon-large goodsspan"></span> <span>${shopsCustom.telephone }</span>
				</p>
				<p>
					<span class="icon-envelope icon-large goodsspan"></span> <span>${shopsCustom.email }</span>
				</p>
				<p>
					<span class="goodsspan"> <img
						src="${pageContext.request.contextPath}/img/photo-04.png"
						style="border-radius: 50%;width: 35px;height: 30px;margin-top: -5px;" />
					</span> <span>${shopsCustom.qqnumber }</span>
				</p>
				<p>
					<span class="icon-map-marker icon-large goodsspan"></span> <span>${shopsCustom.adress }</span>
				</p>
			</div>
			<div class="shopman_info_div3">
				<span style="color: #F58400;"> 温馨提示： </span> <span>
					本信息为网友自行发布，请核实信息后进行交易。 </span>
			</div>
		</div>
		<div class="shopcredit_info">
			<ul class="nav nav-tabs shopcredit_info_head">
				<li class="active"><a href="#credit-tab1" data-toggle="tab">最近一周</a></li>
				<li><a href="#credit-tab2" data-toggle="tab">最近一月</a></li>
				<li><a href="#credit-tab3" data-toggle="tab">最近半年</a></li>
				<li><a href="#credit-tab4" data-toggle="tab">半年以上</a></li>
			</ul>
			<div class="tab-content">
				<script>
					var pieData1 = [ {
						value : ${goodsClickTotals.clickUp1 },
						color : "#F7464A",
						highlight : "#FF5A5E",
						label : "赞"
					}, {
						value : ${goodsClickTotals.clickDown1 },
						color : "#46BFBD",
						highlight : "#5AD3D1",
						label : "踩"
					}, ];
					var pieData2 = [ {
						value : ${goodsClickTotals.clickUp2 },
						color : "#F7464A",
						highlight : "#FF5A5E",
						label : "赞"
					}, {
						value : ${goodsClickTotals.clickDown2 },
						color : "#46BFBD",
						highlight : "#5AD3D1",
						label : "踩"
					}, ];
					var pieData3 = [ {
						value : ${goodsClickTotals.clickUp3 },
						color : "#F7464A",
						highlight : "#FF5A5E",
						label : "赞"
					}, {
						value : ${goodsClickTotals.clickDown3 },
						color : "#46BFBD",
						highlight : "#5AD3D1",
						label : "踩"
					}, ];
					var pieData4 = [ {
						value : ${goodsClickTotals.clickUp4 },
						color : "#F7464A",
						highlight : "#FF5A5E",
						label : "赞"
					}, {
						value : ${goodsClickTotals.clickDown4 },
						color : "#46BFBD",
						highlight : "#5AD3D1",
						label : "踩"
					}, ];
					window.onload = function() {
						var ctx1 = document.getElementById("chart-area1")
								.getContext("2d");
						window.myPie1 = new Chart(ctx1).Pie(pieData1);
						var ctx2 = document.getElementById("chart-area2")
								.getContext("2d");
						window.myPie2 = new Chart(ctx2).Pie(pieData2);
						var ctx3 = document.getElementById("chart-area3")
								.getContext("2d");
						window.myPie3 = new Chart(ctx3).Pie(pieData3);
						var ctx4 = document.getElementById("chart-area4")
								.getContext("2d");
						window.myPie4 = new Chart(ctx4).Pie(pieData4);
					};
				</script>
				<div class="tab-pane active" id="credit-tab1">
					<div id="canvas-holder" style="float: left;">
						<canvas id="chart-area1" width="160" height="160"
							style="margin:22px 40px;" />
					</div>
					<div class="shopcredit_info_div1">
						<p>
							<span>赞:</span> <span style="color: #F58400;">${goodsClickTotals.clickUp1 }</span>
						</p>
						<p>
							<span>踩:</span> <span style="color: #F58400;"> ${goodsClickTotals.clickDown1 }</span>
						</p>
					</div>
				</div>
				<div class="tab-pane" id="credit-tab2">
					<div id="canvas-holder" style="float: left;">
						<canvas id="chart-area2" width="160" height="160"
							style="margin:22px 40px;" />
					</div>
					<div class="shopcredit_info_div1">
						<p>
							<span>赞:</span> <span style="color: #F58400;">${goodsClickTotals.clickUp2 }</span>
						</p>
						<p>
							<span>踩:</span> <span style="color: #F58400;"> ${goodsClickTotals.clickDown2 }</span>
						</p>
					</div>
				</div>
				<div class="tab-pane" id="credit-tab3">
					<div id="canvas-holder" style="float: left;">
						<canvas id="chart-area3" width="160" height="160"
							style="margin:22px 40px;" />
					</div>
					<div class="shopcredit_info_div1">
						<p>
							<span>赞:</span> <span style="color: #F58400;">${goodsClickTotals.clickUp3 }</span>
						</p>
						<p>
							<span>踩:</span> <span style="color: #F58400;">${goodsClickTotals.clickDown3 }</span>
						</p>
					</div>
				</div>
				<div class="tab-pane" id="credit-tab4">
					<div id="canvas-holder" style="float: left;">
						<canvas id="chart-area4" width="160" height="160"
							style="margin:22px 40px;" />
					</div>
					<div class="shopcredit_info_div1">
						<p>
							<span>赞:</span> <span style="color: #F58400;">${goodsClickTotals.clickUp4 }</span>
						</p>
						<p>
							<span>踩:</span> <span style="color: #F58400;">${goodsClickTotals.clickDown4 }</span>
						</p>
					</div>
				</div>
				<div
					style="float:left;width: 440px;margin-left: 20px;margin-bottom:5px;color: #666666;">
					<span style="color: #F58400;">温馨提示：</span> <span>以上数据为所有用户共同参与所得，非仅交换成功用户</span>
				</div>
			</div>
		</div>
	</div>

	<!--
        	作者：756048962@qq.com
        	时间：2016-03-26
        	描述：店铺上架商品
        -->
	<div class="container"
		style="width: 1020px;min-height: 300px;padding:0px;">
		<div class="goods_info_head">店铺物品</div>
		<div style="width: 1020px;padding:20px 0;">
			<c:if test="${goodsCustom!=null }">
				<c:forEach items="${goodsCustom }" var="goodCustom">
					<div class="goods_info_div0">
						<div class="goods_info_imgs">
							<a href="${pageContext.request.contextPath}/blurb/blurbQuery.action?goods_id=${goodCustom.id}">
								<img src="/path/${goodCustom.goodsimg1}" style="width: 200px;height: 200px;" />
							</a>
						</div>
						<div class="goods_info_div1">
							<p>
								<span>名&nbsp;&nbsp;称:</span> <span>${goodCustom.goodsname}</span>
							</p>
							<p>
								<span>成&nbsp;&nbsp;色:</span> <span style="color: #FE6500;">${goodCustom.quality}</span>
							</p>
							<p>
								<span>我想换:</span> <span style="color: #FE6500;">${goodCustom.intention}</span>
							</p>
							<p>
								<span>类&nbsp;&nbsp;别:</span> <span>${goodCustom.bigclassify}-${goodCustom.smallclassify}</span>
							</p>
							<div class="goods_info_div2">
								<span class="glyphicon glyphicon-time" title="发布时间">
									<i><fmt:formatDate value="${goodCustom.uploadtime}" pattern="yyyy-MM-dd"/></i>
								</span>
								<span class="glyphicon glyphicon-eye-open" title="浏览量"><i>${goodCustom.viewnumber}</i></span>
								<a href="${pageContext.request.contextPath}/blurb/blurbQuery.action?goods_id=${goodCustom.id}"
									class="button button-primary button-rounded button-tiny">查看</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

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
	<p align="center ">@2016 Swap开发团队</p>
	</footer>

	<!--
        	作者：756048962@qq.com
        	时间：2015-12-21
        	描述：右下角流动框
        -->
	<div id="getTop " class="fixed-btn "
		style="background: #d0d6d9;-webkit-border-radius: 10%;display: none; ">
		<a id="toTop "><span class="glyphicon glyphicon-chevron-up "></span></a>
	</div>

</body>

</html>
