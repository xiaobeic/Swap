<%@ page language="java" import="java.util.*,java.net.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrapValidator.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-confirm.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fileinput.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/indexStyle.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/personCenter.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-switch.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrapValidator.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fileinput.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/myjs-home.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/myValidator.js"></script>
<script type="text/javascript">
	new WOW().init();
	getTop();
	/*定位personaCenter1 ： tab选项卡*/
	$(function() {
		var text_tab=$("#title_tab").html().trim();
		if(text_tab=="person2"){
			$("#person2_tab").click();
		}
		else if(text_tab=="person3"){
			$("#person3_tab").click();
		}
	});
</script>
</head>

<body style="background-color:#eee;">
	<%
		//设置当前地址
		session.setAttribute("adress","personaCenter1");
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
				<li><a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth">商店</a></li>
				<li class="active"><a
					href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">个人中心</a></li>
				<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
			</ul>
			<div id="login-area"
				style="float: right;margin-right: 15px;margin-top: 5px;">
				<ul class="clearfix logined">

					<li class="set_btn user-card-box"><a id="header-avator"
						class="user-card-item"
						href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">
							<img src="/path/${shopsCustom.headimg }" width="35" height="35" />
							<i class="myspace_remind" style="display: none;"></i>
					</a>
						<div class="g-user-card">
							<div class="card-inner">
								<div class="card-top">
									<img src="/path/${shopsCustom.headimg }"
										alt="${shopsCustom.username }" class="l"> <span
										class="name text-ellipsis">${shopsCustom.username }</span>
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
    	时间：2016-01-21
    	描述：个人中心 ---我的店铺
    -->

	<div class="container" style="width: 1245px;">
		<div class="personCenter_left">
			<div class="personCenter_left_top">
				<img src="/path/${shopsCustom.headimg }" />
				<div class="divspan1">
					<span>${shopsCustom.username }</span>
				</div>
				<div style="margin-top: 0;margin-bottom: 10px;">
					<a href="#" style="margin-left: 10px;margin-right: 40px;">信誉:<b
						id="js-user-credit">${shopsCustom.reputationvalue }</b></a> <a
						href="${pageContext.request.contextPath}/goods/goodsCollectionSelect.do"
						title="宝贝收藏"><span class="icon-heart icon-large"></span></a> <a
						href="${pageContext.request.contextPath}/shopsMessage/selectshopsMessage.do"
						title="我的消息"><span class="icon-envelope-alt icon-large"></span></a>
					<a
						href="${pageContext.request.contextPath}/users/userAndShopQuery.do"
						title="账户设置"><span class="icon-cog icon-large"></span></a>
				</div>
			</div>
			<div class="personCenter_left_bottom">
				<div class="bottom_div" style="background-color: #F58400;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-home">&nbsp;我的店铺</span></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
							class="icon-chevron-right"></span>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a
							href="${pageContext.request.contextPath}/goods/goodsCollectionSelect.do"><span
							class="icon-bookmark">&nbsp;&nbsp;宝贝收藏</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a
							href="${pageContext.request.contextPath}/shops/shopsCollectionSelect.do"><span
							class="icon-tags">&nbsp;店铺收藏</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a
							href="${pageContext.request.contextPath}/shopsMessage/selectshopsMessage.do"><span
							class="icon-envelope">&nbsp;我的消息</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a
							href="${pageContext.request.contextPath}/users/userAndShopQuery.do"><span
							class="icon-cog">&nbsp;账户设置</span></a>
					</p>
				</div>
			</div>
		</div>

		<div class="personCenter_right01">
			<ul id="mytab" class="nav nav-tabs">
				<li class="active"><a  href='#person1' data-toggle='tab'>我的店铺</a>
				</li>
				<li><a id="person2_tab" href='#person2' data-toggle='tab'>上传宝贝</a></li>
				<li><a id="person3_tab" href='#person3' data-toggle='tab'>店铺设置</a></li>
			</ul>
			<!-- 定位tab选项卡,myjs-home中进行操作-->
			<span id="title_tab" style="display: none;">
				<c:if test="${titleTab!=null}">
					${titleTab}
				</c:if>
			</span>
			<div class="tab-content">
				<div class="tab-pane  in active" id="person1">

					<span style="color:blue;text-align: center;" class="col-md-12">
						<c:if test="${deleteSuccess!=null}">
							${deleteSuccess}<br>
						</c:if>
					</span>
					<c:if test="${goods!=null}">
						<c:forEach items="${goods}" var="GoodsCustom">
							<div class="shoop_info_div0 wow fadeIn" id="shoop_info_${GoodsCustom.id }">
								<a
									href="${pageContext.request.contextPath}/blurb/blurbQuery.action?goods_id=${GoodsCustom.id}"
									style="color: #000000;">
									<div class="goods_info_imgs">
										<img src="/path/${GoodsCustom.goodsimg1 }"
											style="width: 230px;height: 200px;" />
									</div>
									<div class="goods_info_div1">
										<p>
											<span>名&nbsp;&nbsp;称:</span> <span>${GoodsCustom.goodsname }</span>
										</p>
										<p>
											<span>成&nbsp;&nbsp;色:</span> <span style="color: #FE6500;">${GoodsCustom.quality }</span>
										</p>
										<p>
											<span>我想换:</span> <span style="color: #FE6500;">${GoodsCustom.intention }</span>
										</p>
										<p>
											<span>类&nbsp;&nbsp;别:</span> <span>${GoodsCustom.bigclassify }-${GoodsCustom.smallclassify }</span>
										</p>
										<div class="goods_info_div2">
											<span class="glyphicon glyphicon-time span1" title="发布时间">
												<i style="margin-left: -13px"> <fmt:formatDate
														value="${GoodsCustom.uploadtime }" pattern="yyyy-MM-dd" />
											</i>
											</span> <span class="glyphicon glyphicon-eye-open span2" title="浏览量"><i>${GoodsCustom.viewnumber }</i></span>
											<span> 
												<a href="${pageContext.request.contextPath}/goods/goodsDelete.do?id=${GoodsCustom.id }"  id="${GoodsCustom.id }"></a>
												<span class="glyphicon glyphicon-trash delete_goods" style="color:#0088CC;cursor:hand" title="永久删除"></span>
											</span>

										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:if>

				</div>
				<div class="tab-pane" id="person2" style="padding-top: 40px;">
					<form id="shopUpdate"
						action="${pageContext.request.contextPath}/goods/goodsUpload.do"
						class="form-horizontal" method="post"
						enctype="multipart/form-data" style="width: 741px;">
						<div class="form-group">
							<span style="color:blue;text-align: center;" class="col-md-12">
								<c:if test="${uploadSuccess!=null}">
										${uploadSuccess}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel"><b
								style="color: red">* </b>商品名称</label>
							<div class="col-md-7">
								<input type="text" name="goodsname"
									class="form-control input-lg" value="${goodsCustom.goodsname }"
									placeholder="请输入商品名称" />
							</div>
							<span style="color: red"> <c:if
									test="${goodsnameError!=null}">
										${goodsnameError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel"><b
								style="color: red">* </b>分 类</label>
							<div class="col-md-7">
								<select id="s_bigclassify" class="input-lg" name="bigclassify"></select>
								<select id="s_smallclassify" class="input-lg"
									name="smallclassify"></select>
							</div>
							<script class="resources library"
								src="${pageContext.request.contextPath}/js/classify.js"
								type="text/javascript"></script>
							<script type="text/javascript">
								_init_area();
							</script>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">我想换</label>
							<div class="col-md-7">
								<input type="text" name="intention"
									class="form-control input-lg" value="${goodsCustom.intention }"
									placeholder="请输入你想要.." />
							</div>
							<span style="color: red"> <c:if
									test="${intentionError!=null}">
										${intentionError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">成 色</label>
							<div class="col-md-3">
								<select class="form-control input-lg" name="quality">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8" selected="selected">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">原 价</label>
							<div class="col-md-3">
								<input type="text" name="originalprice_1"
									class="form-control input-lg"
									value="${goodsCustom.originalprice_1 }" placeholder="请输入原价" />
							</div>
							<label class="control-label formLabel">￥</label> <span
								style="color: red"> <c:if
									test="${originalprice_1Error!=null}">
										${originalprice_1Error}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">估 价</label>
							<div class="col-md-3">
								<input type="text" name="evaluation_1"
									class="form-control input-lg"
									value="${goodsCustom.evaluation_1 }" placeholder="请输入估价" />
							</div>
							<label class="control-label formLabel">￥</label> <span
								style="color: red"> <c:if
									test="${evaluation_1Error!=null}">
										${evaluation_1Error}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">宝贝介绍</label>
							<div class="col-md-7">
								<textarea name="goodsmessage" rows="4" style="resize: none;"
									class="form-control" placeholder="请输入宝贝的详细信息">${goodsCustom.goodsmessage }</textarea>
							</div>
							<span style="color: red"> <c:if
									test="${goodsmessageError!=null}">
										${goodsmessageError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">卖方一言</label>
							<div class="col-md-7">
								<textarea name="sellerspeak" rows="4" style="resize: none;"
									class="form-control" placeholder="你想对顾客说些什么？">${goodsCustom.sellerspeak }</textarea>
							</div>
							<span style="color: red"> <c:if
									test="${sellerspeakError!=null}">
										${sellerspeakError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel"><b
								style="color: red">* </b>图片展示1</label>
							<div class="col-md-7">
								<input id="file1" name="goodsimgs" type="file" class="file"
									data-show-upload="false" data-show-remove="true"
									data-show-preview="false">
							</div>
							<span style="color: red"> <c:if
									test="${goodsimgsError0!=null}">
										${goodsimgsError0}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel"><b
								style="color: red">* </b>图片展示2</label>
							<div class="col-md-7">
								<input id="file2" name="goodsimgs" type="file" class="file"
									data-show-upload="false" data-show-remove="true"
									data-show-preview="false">
							</div>
							<span style="color: red"> <c:if
									test="${goodsimgsError1!=null}">
										${goodsimgsError1}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel"><b
								style="color: red">* </b>图片展示3</label>
							<div class="col-md-7">
								<input id="file3" name="goodsimgs" type="file" class="file"
									data-show-upload="false" data-show-remove="true"
									data-show-preview="false">
							</div>
							<span style="color: red"> <c:if
									test="${goodsimgsError2!=null}">
										${goodsimgsError2}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<div class="col-md-12 col-lg-offset-5">
								<button type="submit"
									class="button button-raised button-glow button-primary button-rounded">上
									传</button>
							</div>
						</div>
					</form>
				</div>

				<div class="tab-pane" id="person3" style="padding-top: 40px;">
					<div style="padding-left: 240px;margin-bottom: 20px;">
						<span style="color: #F58400;">温馨提示:</span> <span>以下信息将在店铺展示，请谨慎填写！</span>
					</div>
					<form id="shopInfo" action="${pageContext.request.contextPath}/shops/updateshops.do"
						class="form-horizontal" method="post">
						<div class="form-group">
							<span style="color:blue;text-align: center;" class="col-md-12">
								<c:if test="${updateSuccess!=null}">
									${updateSuccess}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<input type="hidden" value="${shopsCustom.id}" name="id">
							<label class="col-md-3 control-label formLabel">店铺名称</label>
							<div class="col-md-7">
								<input type="text" name="shopname" class="form-control input-lg"
									value="${shopsCustom.shopname}" placeholder="请输入店铺名称" />
							</div>
							<span style="color:red;"> <c:if
									test="${shopnameError!=null}">
									${shopnameError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">手机号</label>
							<div class="col-md-7">
								<input type="text" name="telephone"
									class="form-control input-lg" value="${shopsCustom.telephone}"
									placeholder="请输入手机号" />
							</div>
							<span style="color:red;"> <c:if
									test="${telephoneError!=null}">
									${telephoneError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">邮箱</label>
							<div class="col-md-7">
								<input type="text" name="email" class="form-control input-lg"
									value="${shopsCustom.email}" placeholder="请输入邮箱" />
							</div>
							<span style="color:red;"> <c:if test="${emailError!=null}">
									${emailError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">QQ</label>
							<div class="col-md-7">
								<input type="text" name="qqnumber" class="form-control input-lg"
									value="${shopsCustom.qqnumber}" placeholder="请输入QQ号" />
							</div>
							<span style="color:red;"> <c:if
									test="${qqnumberError!=null}">
									${qqnumberError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">地址</label>
							<div class="col-md-7">
								<input type="text" name="adress" class="form-control input-lg"
									value="${shopsCustom.adress}" placeholder="请输入地址" />
							</div>
							<span style="color:red;"> <c:if
									test="${adressError!=null}">
									${adressError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label formLabel">公告</label>
							<div class="col-md-7">
								<textarea name="announcement" rows="4" style="resize: none;"
									class="col-md-7 form-control" placeholder="请输入店铺公告">${shopsCustom.announcement}</textarea>
							</div>
							<span style="color:red;"> <c:if
									test="${announcementError!=null}">
									${announcementError}<br>
								</c:if>
							</span>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-lg-offset-5">
								<button type="submit" 
									class="button button-raised button-glow button-primary button-rounded">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
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
