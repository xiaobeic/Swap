<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-switch.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fileinput.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyle.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personCenter.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/fileinput.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/cropbox.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs-home.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myValidator.js"></script>
    <script type="text/javascript">
        new WOW().init();
        getTop();
        $(function() {
        var text_tab=$("#account_tab").html().trim();
        if(text_tab=="account2"){
            $("#account2_tab").click();
        }
    });
    </script>
</head>

<body style="background-color:#eee;">
    <%
        //设置当前地址
        session.setAttribute("adress","personaCenter5");
     %>
    <!--
            作者：756048962@qq.com
            时间：2015-12-20
            描述：导航栏
        -->
    <nav class="nav navbar-inverse navbar-fixed-top my-nav" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">
                    <img src="${pageContext.request.contextPath}/img/logo.png" style="height: 45px;margin-top: -10px;" />
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/users/userQuery.action">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/allgoods/selectallgoodss.action?bigclassify=男装&address=mancloth">商店</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">个人中心</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
                </ul>
                    <div id="login-area" style="float: right;margin-right: 15px;margin-top: 5px;">
                    <ul class="clearfix logined">

                        <li class="set_btn user-card-box">
                            <a id="header-avator" class="user-card-item" href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do">
                                <img src='/path/${shopsCustom.headimg }' width='35' height='35' />
                                <i class="myspace_remind" style="display: none;"></i>
                            </a>
                            <div class="g-user-card">
                                <div class="card-inner">
                                    <div class="card-top">
                                        <img src="/path/${shopsCustom.headimg }" alt="${shopsCustom.username }" class="l">
                                        <span class="name text-ellipsis">${shopsCustom.username }</span>
                                    </div>
                                    <div class="card-links">
                                        <a href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do" class="my-mooc l">我的店铺<i class="dot-update"></i></a>
                                        <span class="split l"></span>
                                        <a href="${pageContext.request.contextPath}/goods/goodsCollectionSelect.do" class="my-sns l">宝贝收藏</a>
                                    </div>
                                    <div class="card-sets clearfix">
                                        <a href="${pageContext.request.contextPath}/users/userAndShopQuery.do" class="l">账号设置</a>
                                        <a href="${pageContext.request.contextPath}/logout.action" class="r">退出</a>
                                    </div>
                                </div>
                                <i class="card-arr"></i>
                            </div>
                        </li>
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
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">关于</h4>
                </div>
                <div class="modal-body">
                    <p>@2016 Swap开发团队
                    </p>
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
                    <a href="#" style="margin-left: 10px;margin-right: 40px;">信誉:<b id="js-user-credit">${shopsCustom.reputationvalue }</b></a>
                    <a href="${pageContext.request.contextPath}/goods/goodsCollectionSelect.do" title="宝贝收藏"><span class="icon-heart icon-large"></span></a>
                    <a href="${pageContext.request.contextPath}/shopsMessage/selectshopsMessage.do" title="我的消息"><span class="icon-envelope-alt icon-large"></span></a>
                    <a href="${pageContext.request.contextPath}/users/userAndShopQuery.do" title="账户设置"><span class="icon-cog icon-large"></span></a>
                </div>
            </div>
            <div class="personCenter_left_bottom">
                <div class="bottom_div">
                    <p>
                        <a href="${pageContext.request.contextPath}/shops/queryPsersonCenter1.do"><span class="icon-home">&nbsp;&nbsp;我的店铺</span></a>
                    </p>
                </div>
                <div class="bottom_div">
                    <p>
                        <a href="${pageContext.request.contextPath}/goods/goodsCollectionSelect.do"><span class="icon-bookmark">&nbsp;&nbsp;宝贝收藏</span></a>
                    </p>
                </div>
                <div class="bottom_div">
                    <p>
                        <a href="${pageContext.request.contextPath}/shops/shopsCollectionSelect.do"><span class="icon-tags">&nbsp;店铺收藏</span></a>
                    </p>
                </div>
                <div class="bottom_div">
                    <p>
                        <a href="${pageContext.request.contextPath}/shopsMessage/selectshopsMessage.do"><span class="icon-envelope">&nbsp;我的消息</span></a>
                    </p>
                </div>
                <div class="bottom_div" style="background-color: #F58400;">
                    <p style="color: white;">
                        <a href="${pageContext.request.contextPath}/users/userAndShopQuery.do" style="color: white;"><span class="icon-cog">&nbsp;账户设置</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="icon-chevron-right"></span>
                    </p>
                </div>
            </div>
        </div>

        <div class="personCenter_right01">
            <ul id="mytab" class="nav nav-tabs">
                <li class="active">
                    <a href='#account1' data-toggle='tab'>修改密码</a>
                </li>
                <li>
                    <a id="account2_tab" href='#account2' data-toggle='tab'>头像设置</a>
                </li>
            </ul>
            <!-- 定位tab选项卡,myjs-home中进行操作-->
            <span id="account_tab" style="display: none;">
                <c:if test="${accountTab!=null}">
                    ${accountTab}
                </c:if>
            </span>
            <div class="tab-content">
                <div class="tab-pane fade in active" style="padding-top: 20px;" id="account1">
                    <form id="passwordInfo" action="${pageContext.request.contextPath}/users/ChangePassword.do" class="form-horizontal" method="post">
                        <span style="color: blue;text-align: center;" class="col-md-12">
                            <c:if test="${passSuccess!=null}">
                                ${passSuccess}<br><br>
                            </c:if>
                        </span>
                        <div class="form-group">
                            <label class="col-md-3 control-label formLabel">当前密码</label>
                            <div class="col-md-6">
                                <input type="password" name="password" class="form-control input-lg" placeholder="请输入当前密码" value="${usersCustom.password}" />
                            </div>
                            <span style="color: red">
                                <c:if test="${passwordError!=null}">
                                    ${passwordError}<br>
                                </c:if>
                                <c:if test="${passwordIsError!=null}">
                                    ${passwordIsError}<br>
                                </c:if>
                            </span>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label formLabel">新密码</label>
                            <div class="col-md-6">
                                <input type="password" name="newPassword" class="form-control input-lg" placeholder="请输入新密码" value="${usersCustom.newPassword}"/>
                            </div>
                            <span style="color: red">
                                <c:if test="${newPasswordError!=null}">
                                    ${newPasswordError}<br>
                                </c:if>
                            </span>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label formLabel">确认密码</label>
                            <div class="col-md-6">
                                <input type="password" name="confirmPassword" class="form-control input-lg" placeholder="请再次输入密码" value="${usersCustom.confirmPassword}"/>
                            </div>
                            <span style="color: red;">
                                <c:if test="${confirmPasswordError!=null}">
                                    ${confirmPasswordError}<br>
                                </c:if>
                                <c:if test="${ocPasswordError!=null}">
                                    ${ocPasswordError}<br>
                                </c:if>
                            </span>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 col-lg-offset-4">
                                <button type="submit" class="button button-raised button-glow button-primary button-rounded">保 存</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" style="padding-top: 20px;padding-left: 70px" id="account2">
                    <span style="color: blue;text-align: center;" class="col-md-8">
                            <c:if test="${updateHeadSuc!=null}">
                                ${updateHeadSuc}<br><br>
                            </c:if>
                        </span>
                    <form id="updateheadimg"  action="${pageContext.request.contextPath}/users/Uploadhead.do" class="form-horizontal" method="post" enctype="multipart/form-data">
                        <div style="width: 550px;margin-bottom: 20px;">
                            <input id="file" type="file" name="user_pic" class="file" data-show-upload="false" data-show-remove="false" data-show-preview="false">
                        </div>
                    </form>
                        <div>
                            <div style="float: left;">
                                <div class="imageBox">
                                    <div class="thumbBox"></div>
                                    <div class="spinner" style="display: none">Loading..</div>
                                </div>
                                <div style="margin-left: 130px;">
                                    <button class="button button-small button-circle button-glow  button-primary" id="btnZoomOut">
                                        <i class="icon-zoom-out icon-large" title="缩小"></i>
                                    </button>
                                    <button class="button button-small button-circle button-glow  button-primary" id="btnZoomIn">
                                        <i class="icon-zoom-in icon-large" title="放大"></i>
                                    </button>
                                    <button class="button button-primary button-pill button-small" id="btnCrop">
                                        <i class="icon-cut icon-large" title="剪切">剪切</i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div>
                        <!--上传操作在myjs-home.js里-->
                        <div class="cropped" style="width:198px;height:198px;margin-left: 350px;background-color: #aaa;">
                                <div style="padding-left:40px;padding-top: 80px;color: white;">选择、剪切、上传..</div>
                        </div>
                        <div style="margin-left: 400px;margin-top: 40px;">
                            <button id="uploadHeadImg" class="button button-raised button-glow button-primary button-rounded" title="上传"><i class=" icon-upload-alt icon-large"></i></button>
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
    <br/>
    <br/>
    <footer style="padding: 15px;margin-top: 20px;background-color: white;">
        <p align="center">@2016 Swap开发团队</p>
    </footer>

    <!--
            作者：756048962@qq.com
            时间：2015-12-21
            描述：右下角流动框
        -->
    <div id="getTop" class="fixed-btn" style="background: #d0d6d9;-webkit-border-radius: 10%;display: none;">
        <a id="toTop"><span class="glyphicon glyphicon-chevron-up"></span></a>
    </div>
</body>

</html>
