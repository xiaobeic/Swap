<%@ page language="java" import="java.util.*,java.net.*"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
    prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt"%>
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
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/jquery-confirm.css" />
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/indexStyle.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/Blurb.css" />
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!--<加载bootstrap.min.js之前先加载jquery.min.s-->
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/bootstrap-switch.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/blurb.js"></script>
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
        session.setAttribute("adress","Blurb");
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
                <li><a
                    href="${pageContext.request.contextPath}/users/userQuery.action">首页</a></li>
                <li class="active"><a
                    href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth">商店</a></li>
                <li><a
                    href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">个人中心</a></li>
                <li><a href="#" data-toggle="modal"
                    data-target="#about-modal">关于</a></li>
            </ul>
            <%
                /* session身份为空的时候  显示登入界面   否则显示登入后状态 */
                                if(session.getAttribute("username")!=null){
            %>
            <div id="login-area"
                style="float: right;margin-right: 15px;margin-top: 5px;">
                <ul class="clearfix logined">

                    <li class="set_btn user-card-box"><a
                        id="header-avator" class="user-card-item"
                        href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">
                            <img src='/path/${user.headimg }'  width='35'height='35' /> 
                            <i class="myspace_remind" style="display: none;"></i>
                    </a>
                        <div class="g-user-card">
                            <div class="card-inner">
                                <div class="card-top">
                                    <img id="${user.headimg }" class="userHeadimg" src="/path/${user.headimg }" alt="${user.username }" class="l"> 
                                    <span id="${user.username }" class="user_name" class="name text-ellipsis">${user.username }</span>
                                </div>
                                <div class="card-links">
                                    <a
                                        href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do"
                                        class="my-mooc l">我的店铺<i class="dot-update"></i></a>
                                    <span class="split l"></span> <a
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
                    <a href="#" id="my-login"
                        class="navbar-link active login-a" data-toggle="modal"
                        data-target="#login-modal">登入</a> <span
                        style="color:white;">|</span> <a href="#"
                        id="my-register" class="navbar-link login-a"
                        data-toggle="modal" data-target="#login-modal">注册</a>
                </div>
            </div>
            
            <div style="float: right;margin-right: 15px;margin-top: 5px;padding: 10px 0px;color: white;">
                <a id="adminlogin" href="${pageContext.request.contextPath}/view/adminlogin.jsp">管理员登入</a>
            </div>

            <%
                }
            %>
            

        </div>
    </div>
    </nav>


    <!--
            作者：756048962@qq.com
            时间：2015-12-22
            描述：登录注册模态框
        -->
    <div class="modal  fade" id="login-modal">
        <div class="modal-dialog" style="width:330px;">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close"
                        data-dismiss="modal">
                        <span aria-hidden="true" style="font-size:large;"
                            class="glyphicon glyphicon-remove"></span> <span
                            class="sr-only">关闭</span>
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
                                    <input name="adress" value="Blurb" type="hidden" />
                                    <div class="form-group">
                                        <div class="has-feedback form-group-lg"
                                            style="width:300px;">
                                            <input type="text" name="username"
                                                value="<%=username%>" class="form-control"
                                                placeholder="用户名/email" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group-lg" style="width:300px;">
                                            <input type="password" name="password"
                                                class="form-control" value=<%=password%>
                                                placeholder="密码" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div style="width: 300px;">
                                            <div style="padding-left:20px;">
                                                <input type="checkbox" name="isUseCookie"
                                                    checked="checked" /> <span
                                                    style="color: #555;margin-right: 100px;">记住密码</span>
                                                <a href="#" class="forget-a">忘记密码</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div style="width:300px;" align="center">
                                            <span
                                                class="button-dropdown  button-dropdown-primary  button-raised">
                                                <input type="submit"
                                                class="button  button-rounded button-large"
                                                style="background-color: #F58400;color: white;"
                                                value="登入">
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
                                    <input name="adress" value="Blurb" type="hidden" />
                                    <div class="form-group">
                                        <div class="has-feedback form-group-lg"
                                            style="width:300px;">
                                            <input type="text" name="username"
                                                class="form-control" placeholder="用户名/email" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group-lg" style="width:300px;">
                                            <input type="password" name="password"
                                                class="form-control" placeholder="密码" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group-lg">
                                            <div
                                                style="width:180px;float:left;padding-right:40px;">
                                                <input type="text" name="validatenum"
                                                    class="form-control" placeholder="验证码" />
                                            </div>

                                            <div
                                                style="width:70px;float:left;padding-right:40px;">
                                                <img
                                                    src="${pageContext.request.contextPath}/view/makeCertPic.jsp"
                                                    id="photo" alt="验证码" width="80px" height="40px" />
                                            </div>
                                            <div
                                                style="width:40px;float:left;padding:10px;padding-left:15px;">
                                                <span id="butimg"
                                                    class="glyphicon glyphicon-repeat"
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
                                        style="background-color: #F58400;color: white;"
                                        value="注册">
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
           时间：2015-12-22
           描述：留言模态框
      -->
    <div class="modal fade" id="respone-modal">
        <div class="modal-dialog modal-content"
            style="width: 695px;">
            <div class="modal-header"
                style="background-color: #eee;border-radius: 5px;padding: 7px 10px;">
                <span style="font-size: 16px;font-weight: 800;">给ta留言</span>
                <span data-dismiss="modal" class="icon-remove"
                    style="float: right;"></span>
            </div>
            <div id="respone_mess"
                style="width: 690px;height:300px;overflow-y: scroll;padding: 20px 10px;">
                <div id="respone_none"
                    style="width: 100%;line-height: 300px;text-align: center;">
                    <span style="font-size: 18px;color:#aaa">还没有留言..</span>
                </div>
            </div>
            <div style="width:690px;">
                <form id="resFrom" method="post" action="#"
                    class="form-horizontal">
                    <input id="resUserid" value="" name="userId"
                        type="hidden" />
                    <div class="form-group" style="margin-left: 5px;">
                        <div>
                            <textarea id="textMess" name="message"
                                placeholder="编辑回复内容"
                                style="width: 660px;resize:none" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <span id="resMessSpan"
                                style="display:inline-block;width: 465px;margin-left:5px; ;text-align: left;color:red;"></span>
                            <button type="button"
                                class="button button-rounded button-raised  button-small"
                                data-dismiss="modal">取消</button>
                            <button id="texta" type="submit"
                                class="button button-rounded button-raised button-primary button-small"
                                style="margin-left: 10px;">留言</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <!--
           作者：756048962@qq.com
           时间：2015-12-22
           描述：评论模态框
      -->
    <div class="modal fade" id="goodMess-modal">
        <div class="modal-dialog modal-content"
            style="width: 695px;">
            <div class="modal-header"
                style="background-color: #eee;border-radius: 5px;padding: 7px 10px;">
                <span style="font-size: 16px;font-weight: 800;">我想说</span>
                <span data-dismiss="modal" class="icon-remove"
                    style="float: right;"></span>
            </div>
            <div style="width:690px;">
                <form id="goodMessFrom" method="post" action="#"
                    class="form-horizontal">
                    <input id="goodsid" value="${goods.id }" name="goodsId"
                        type="hidden" />
                    <div class="form-group" style="margin-left: 5px;">
                        <div>
                            <textarea id="textgoodMess" name="message" placeholder="编辑评论内容" style="width: 683px;resize:none" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <span id="goodMessSpan"
                                style="display:inline-block;width: 465px;margin-left:5px; ;text-align: left;color:red;"></span>
                            <button type="button" id="goodsMessmiss"
                                class="button button-rounded button-raised  button-small"
                                data-dismiss="modal">取消</button>
                            <button id="goodMess_a" type="submit"
                                class="button button-rounded button-raised button-primary button-small"
                                style="margin-left: 10px;">评论</button>
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
            作者：1120551142@qq.com
            时间：2016-03-22
            描述：具体商品信息
        -->
    <div class="container oneblurbone">
        <!--商品图片-->
        <div class="oneblurb">
            <ul class="oneblurb1">
                <li><a href="javascript:"> <img
                        src="/path/${goods.goodsimg1 }" alt="商品图片" />
                </a></li>
                <li style="display: none"><a href="javascript:">
                        <img src="/path/${goods.goodsimg2 }" alt="商品图片" />
                </a></li>
                <li style="none"><a href="javascript:"> <img
                        src="/path/${goods.goodsimg3 }" alt="商品图片" />
                </a></li>
            </ul>
            <a href="javascript:;" class="ctrl-blurb oneblurb_1">上一张</a>
            <a href="javascript:;" class="ctrl-blurb oneblurb_2">下一张</a>
            <div class="oneblurb2">
                <ul class="oneblurb2_1">
                    <li class="current"><em>1</em></li>
                    <li><em>2</em></li>
                    <li><em>3</em></li>
                </ul>
            </div>
        </div>
        <script>
            $('.oneblurb').ckSlide({
                autoPlay : true, //默认为不自动播放，需要时请以此设置
                dir : 'x', //默认效果淡隐淡出，x为水平移动，y 为垂直滚动
                interval : 3000
            //默认间隔2000毫秒
            });
        </script>
        <!--商品介绍-->
        <div class="oneblurb_blurb">
            <div class="peopledata">
                <span>商品详情</span>
            </div>
            <div class="oneblurb_blurb_2">
                <p>
                    <span>名&nbsp;&nbsp;称:</span> <span>${goods.goodsname }</span>
                </p>
                <p>
                    <span>成&nbsp;&nbsp;色:</span> <span style="color: red;">${goods.quality }</span>
                </p>
                <p>
                    <span>原&nbsp;&nbsp;价:</span> <span> <c:if
                            test="${goods.originalprice!=null }">
                            ${goods.originalprice }￥
                        </c:if>
                    </span>
                </p>
                <p>
                    <span>估&nbsp;&nbsp;价:</span> <span> <c:if
                            test="${goods.evaluation!=null }">
                            ${goods.evaluation }￥
                        </c:if>
                    </span>
                </p>
                <p>
                    <span>我想换:</span> <span style="color: #FE6500;">${goods.intention }</span>
                </p>
                <p style="height: 35px;padding-left:10px">
                    <c:if test="${goodsClick==null }">
                        <span style="width:40px;font-size: 15px;float: left">
                            <a id="click_up"
                            href="${pageContext.request.contextPath}/goodsClick/goodsClickInsert.do?shop_id=${goods.shopId }&num=1"
                            title="赞,掌柜信用+1" class="oneblurb_click_a click_up">
                                <i id="dddd" class="icon-thumbs-up icon-large"
                                style="display: block;margin-top: 5px;"></i>
                        </a>
                        </span>
                        <span style="width:40px;font-size:15px;float: left">
                            <a id="click_down"
                            href="${pageContext.request.contextPath}/goodsClick/goodsClickInsert.do?shop_id=${goods.shopId }&num=-1"
                            title="踩,掌柜信用-1" class="oneblurb_click_a click_down">
                                <i class="icon-thumbs-down icon-large"
                                style="display: block;margin-top: 5px"></i>
                        </a>
                        </span>
                    </c:if>
                    <c:if test="${goodsClick!=null }">
                        <c:if test="${goodsClick.clickNum==1 }">
                            <span style="width:50px;font-size: 15px;float: left">
                                <a href="#" title="已赞"
                                class="oneblurb_click_a click_up"> <i
                                    class="icon-thumbs-up icon-large"
                                    style="display: block;margin-top: 5px;color:#337AB7"></i>
                            </a>
                            </span>
                        </c:if>
                        <c:if test="${goodsClick.clickNum==-1 }">
                            <span style="width:50px;font-size:15px;float: left">
                                <a href="#" title="已踩"
                                class="oneblurb_click_a click_down"> <i
                                    class="icon-thumbs-down icon-large"
                                    style="display: block;margin-top: 5px;color:#337AB7"></i>
                            </a>
                            </span>
                        </c:if>
                    </c:if>
                </p>
            </div>
            <div class="oneblurb_blurb_21">
                <span style="color: #F58400;">温馨提示：</span> <span>
                    本信息为网友自行发布，请核实信息后进行交易。 </span>
            </div>
            <div class="oneblurb_blurb_3">
                <span class="glyphicon glyphicon-time blurbGoods_1"
                    title="发布时间"> <i class="blurbGoods_i1"><fmt:formatDate
                            value="${goods.uploadtime }" pattern="yyyy-MM-dd" /></i>
                </span> <span> <a
                    href="${pageContext.request.contextPath}/goodsCollection/goodsCollDelete.do?goodsCollId=${goodsCollection.id }"
                    id="${goodsCollection.id }"></a> <a
                    href="${pageContext.request.contextPath}/goodsCollection/goodsCollAdd.do"
                    id="${goods.id }"></a> 
                    <c:if test="${goodsCollection!=null }">
                        <span title="收藏" class="icon-star icon-large lurb_click blurb_span1 blurb_span3"></span>
                    </c:if> <c:if test="${goodsCollection==null }">
                        <span title="收藏" class="icon-star icon-large lurb_click blurb_span1 blurb_span2"></span>
                    </c:if>
                </span> <span class="glyphicon glyphicon-edit  blurbGoods_2"
                    title="评论量"><i>${goodsMesstotal}</i></span> <span
                    class="glyphicon glyphicon-eye-open  blurbGoods_2"
                    title="浏览量"><i>${goods.viewnumber }</i></span>
            </div>
        </div>

        <!--商户信息-->
        <div class="oneblurb_blurb_blurb">
            <div class="peopledata11">掌柜资料</div>
            <div class="peopledata1">
                <div class="peopledata1_1">
                    <a
                        href="${pageContext.request.contextPath}/view/sellerCenter.jsp">
                        <img src="/path/${shopsCustom.headimg }" title="商户头像" />
                    </a>
                </div>
                <div class="peopledata1_2">
                    <p>
                        <a
                            href="${pageContext.request.contextPath}/view/sellerCenter.jsp">${shopsCustom.username }</a>
                    </p>
                    <p>
                        <span>信誉:</span> <span
                            style="color: #F58400;font-size: 16px;">${shopsCustom.reputationvalue }</span>
                    </p>
                    <p>
                        <a href="#" data-toggle="modal"
                            data-target="#respone-modal"
                            id="${shopsCustom.userId }"
                            class="button button-primary button-rounded button-tiny respone_Blua">留言</a>
                    </p>
                </div>
            </div>
            <div class="peopledata2">
                <p>
                    <span class="icon-phone icon-large goodsspan"></span> <span>${shopsCustom.telephone }</span>
                </p>
                <p>
                    <span class="icon-envelope icon-large goodsspan"></span>
                    <span>${shopsCustom.email }</span>
                </p>
                <p>
                    <span class="goodsspan"> <img
                        src="${pageContext.request.contextPath}/img/photo-04.png"
                        style="border-radius: 50%;width: 35px;height: 30px;margin-top: -5px;" />
                    </span> <span>${shopsCustom.qqnumber }</span>
                </p>
                <p>
                    <span class="icon-map-marker icon-large goodsspan"></span>
                    <span>${shopsCustom.adress }</span>
                </p>
                <p style="margin-left: 23px;">
                    <a
                        href="${pageContext.request.contextPath}/sellerCenter/sellerCenterSelect.action?shopId=${shopsCustom.id}"
                        class="button button-primary button-rounded button-tiny">
                        进入店铺 </a> <i id="${shopsCustom.id}" style="display: none">id</i>
                    <c:if test="${shopsCollection!=null }">
                        <a
                            href="${pageContext.request.contextPath}/shopsCollection/shopsCollDelete.do?shopsCollId=${shopsCollection.id}"
                            class="button button-primary button-rounded button-tiny collShop">取消收藏</a>
                    </c:if>
                    <c:if test="${shopsCollection==null }">
                        <a
                            href="${pageContext.request.contextPath}/shopsCollection/shopsCollAdd.do?shopId=${shopsCustom.id}"
                            class="button button-primary button-rounded button-tiny collShop">收藏店铺</a>
                    </c:if>
                </p>
            </div>
        </div>
    </div>
    <!--
            作者：1120551142@qq.com
            时间：2016-03-24
            描述：商品详情和卖方一言
        -->
    <div class="container situation">
        <ul class="nav nav-tabs" style="font-size: 20px;">
            <li class="active"><a href="#triba-tab"
                data-toggle="tab">商品补充</a></li>
            <li><a href="#info-tab" data-toggle="tab">卖方一言</a></li>
            <li><a href="#speak-tab" data-toggle="tab">全部评论</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active sidiv" id="triba-tab">
                <div>${goods.goodsmessage }</div>
                <div style="padding: 20px 40px;">
                    <img src="/path/${goods.goodsimg1 }"
                        class="post_img wow fadeInUp" /> <img
                        src="/path/${goods.goodsimg2 }"
                        class="post_img wow fadeInUp" /> <img
                        src="/path/${goods.goodsimg3 }"
                        class="post_img wow fadeInUp" />
                </div>
            </div>
            <div class="tab-pane sidiv" id="info-tab">
                <span> ${goods.sellerspeak } </span>
            </div>
            <div class="tab-pane sidiv" id="speak-tab">

                <div style="margin:0px 0 5px 40px;">
                    <a href="#" data-toggle="modal"
                        data-target="#goodMess-modal"
                        class="button button-rounded button-raised button-primary"
                        style="padding-top:10px"> <span title="发表评论"
                        class="icon-edit">&nbsp;评论</span>
                    </a>
                </div>
                <div id="goodsMessageText">
                    <c:if test="${goodsMessage!=null }">
                        <c:forEach items="${goodsMessage}" var="goodMessage">
                            <hr class="post_hr" />
                            <div class="row col-lg-12 post_div7">
                                <!--左部-->
                                <div class="col-lg-3" align="center">
                                    <img src="/path/${goodMessage.headimg}"
                                        class="post_img1" />
                                    <p class="post_p1">
                                        <a href="${goodMessage.userId}">${goodMessage.username}</a>
                                    </p>
                                </div>
                                <!--右部-->
                                <div class="col-lg-8 post_div8">${goodMessage.message}</div>
                                <!--下部-->
                                <div class="col-lg-12">
                                    <div class="post_div3">
                                        <span><fmt:formatDate
                                                value="${goodMessage.publishtime}" type="both" />
                                        </span>&nbsp;&nbsp; <span> 
                                        <a href="${pageContext.request.contextPath}/goodMesClick/goodMesClickInsert.do?gdMessId=${goodMessage.id}"
                                            class="post_spana" style="text-decoration: none;outline: none">
                                            <span
                                                class="icon-thumbs-up icon-large goodMeClick">&nbsp;(<span>${goodMessage.clickNumber}</span>)
                                            </span>
                                        </a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <hr class="post_hr" />
            </div>
        </div>
    </div>


    <!--
            作者：756048962@qq.com
            时间：2015-12-20
            描述：底部制作
        -->
    <footer
        style="padding: 15px;margin-top: 20px;background-color: white;">
    <p align="center">@2016 Swap开发团队</p>
    </footer>

    <!--
            作者：756048962@qq.com
            时间：2015-12-21
            描述：右下角流动框
        -->
    <div id="getTop" class="fixed-btn"
        style="background: #d0d6d9;-webkit-border-radius: 10%;display: none;">
        <a id="toTop"><span
            class="glyphicon glyphicon-chevron-up"></span></a>
    </div>
</body>


</html>
