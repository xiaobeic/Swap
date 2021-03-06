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
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/jquery-confirm.css" />
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
    src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/myjs-home.js"></script>
<script type="text/javascript">
    new WOW().init();
    getTop();
</script>
</head>

<body style="background-color:#eee;">
    <%
        //设置当前地址
        session.setAttribute("adress","personaCenter4");
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
                <li><a href="${pageContext.request.contextPath}/users/userQuery.action">首页</a></li>
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
                            <img src="/path/${shopsCustom.headimg }" id="${shopsCustom.headimg }" class="userHeadimg" width="35" height="35" /> 
                            <i class="myspace_remind" style="display: none;"></i>
                    </a>
                        <div class="g-user-card">
                            <div class="card-inner">
                                <div class="card-top">
                                    <img src="/path/${shopsCustom.headimg}"
                                        alt="${shopsCustom.username}" class="l"> <span
                                        class="name text-ellipsis">${shopsCustom.username}</span>
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
           时间：2015-12-22
           描述：动态回复模态框
      -->
    <div class="modal fade" id="pcRespone-modal">
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

    <!--
        作者：756048962@qq.com
        时间：2016-01-21
        描述：个人中心 ---我的店铺
    -->
    <div class="container" style="width: 1245px;">
        <div class="personCenter_left">
            <div class="personCenter_left_top">
                <img src="/path/${shopsCustom.headimg}" />
                <div class="divspan1">
                    <span>${shopsCustom.username}</span>
                </div>
                <div style="margin-top: 0;margin-bottom: 10px;">
                    <a href="#" style="margin-left: 10px;margin-right: 40px;">信誉:<b
                        id="js-user-credit">${shopsCustom.reputationvalue}</b></a> <a
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
                <div class="bottom_div">
                    <p>
                        <a
                            href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do"><span
                            class="icon-home">&nbsp;&nbsp;我的店铺</span></a>
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
                <div class="bottom_div" style="background-color: #F58400;">
                    <p style="color: white;">
                        <a href="#" style="color: white;"><span class="icon-envelope">&nbsp;我的消息</span></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
                            class="icon-chevron-right"></span>
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

        <div class="personCenter_right03">
            <ul id="mytab" class="nav nav-tabs">
                <li class="active"><a href='#message1' data-toggle='tab'>我的私信</a>
                </li>
                <li><a href='#message2' data-toggle='tab'>系统消息</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane in active" id="message1">
                    <c:if test="${shopsMessage!=null}">
                        <c:forEach items="${shopsMessage}" var="shopMessage">
                            <div class="message_info_div0 mymessage_div" id="shoop_info_${shopMessage.id }">
                                <div class="message_info_div1">
                                    <a href="${shopMessage.userId}"><img src="/path/${shopMessage.headimg}" /></a>
                                </div>
                                <div class="message_info_div2">
                                    <a href="${shopMessage.userId}"> <span class="message_info_span0">${shopMessage.username}</span></a> 
                                    <span style="float: right;color:#aaa">
                                        <fmt:formatDate type="both" value="${shopMessage.publishtime}"/>
                                    </span> <br/><br/> 
                                    <span class="message_info_span1">${shopMessage.message}</span>
                                </div>
                                <div class="message_info_div3">
                                    <a href="${pageContext.request.contextPath}/shopsMessage/shopsMessageDelete.do?id=${shopMessage.id }" id="${shopMessage.id }"></a>
                                    <span class="icon-remove-sign icon-large delete_sMes" style="color:#337ab7;cursor:hand" title="删除"></span> <br/><br/> 
                                    <a data-toggle="modal" data-target="#pcRespone-modal" href="#" id="${shopMessage.userId}" class="respone_a" title="回复"><span class="icon-comment icon-large"></span></a>
                                </div>
                            </div>
                            <hr class="message_info_hr0">
                        </c:forEach>
                    </c:if>
                    

                </div>
                <div class="tab-pane" id="message2">
                    <div>
                        <div class="SysMess_info_div0">
                            <span><a class="icon-bell-alt"></a>&nbsp;系统通知</span> <span><a
                                href="#" class="icon-chevron-down"
                                style="margin:5px 10px;float: right;"></a></span> <span
                                class="SysMess_info_span0">2015-10-30 10:58:55</span>
                        </div>
                        <div class="SysMess_info_div1 wow">
                            新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。 <br /> <br /> <a
                                class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
                        </div>
                    </div>
                    <div>
                        <div class="SysMess_info_div0">
                            <span><a class="icon-bell-alt"></a>&nbsp;系统通知</span> <span><a
                                href="#" class="icon-chevron-down"
                                style="margin:5px 10px;float: right;"></a></span> <span
                                class="SysMess_info_span0">2016-11-20 00:28:34</span>
                        </div>
                        <div class="SysMess_info_div1 wow">
                            新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。 <br /> <br /> <a
                                class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
                        </div>
                    </div>
                    <div>
                        <div class="SysMess_info_div0">
                            <span><a class="icon-bell-alt"></a>&nbsp;系统通知</span> <span><a
                                href="#" class="icon-chevron-down"
                                style="margin:5px 10px;float: right;"></a></span> <span
                                class="SysMess_info_span0">2025-12-10 04:02:15</span>
                        </div>
                        <div class="SysMess_info_div1 wow">
                            新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。 <br /> <br /> <a
                                class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
                        </div>
                    </div>
                    <div>
                        <div class="SysMess_info_div0">
                            <span><a class="icon-bell-alt"></a>&nbsp;系统通知</span> <span><a
                                href="#" class="icon-chevron-down"
                                style="margin:5px 10px;float: right;"></a></span> <span
                                class="SysMess_info_span0">2012-11-31 10:55:55</span>
                        </div>
                        <div class="SysMess_info_div1 wow">
                            新处罚：您被吧务封禁，封禁理由为：发布广告帖、交易帖、等违规信息，给予封禁处罚。 <br /> <br /> <a
                                class="icon-trash icon-large" style="margin: 10px;float: right;"></a>
                        </div>
                    </div>
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
