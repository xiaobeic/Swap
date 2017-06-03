<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="no-transform"/>
        <title>Swap</title>
        <meta property="wb:webmaster" content="c65b073df2ffe5a1"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/admincss/common_style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admincss/management_style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css"/>
        <!--<加载bootstrap.min.js之前先加载jquery.min.js-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/adminjs/man_script.js"></script>
    </head>
    <body>
        <c:if test="${not empty sessionScope.opeMessage}">
            <c:if test="${fn:contains(sessionScope.opeMessage, '成功')}">
                <div id="message_title">${sessionScope.opeMessage }</div>
            </c:if>
            <c:if test="${fn:contains(sessionScope.opeMessage, '失败')}">
                <div id="message_title" style="background-color: red">${sessionScope.opeMessage }</div>
            </c:if>
            <c:remove var="opeMessage" scope="session"/>
            <script type="text/javascript">
                setTimeout(function(){
                    $("#message_title").fadeOut(1000);
                }, 2000);
            </script>
        </c:if>
    
        <div align="center">
            <div id="head_container">
                <div id="head" align="left">
                    <%-- <div id="head_logo">
                        <img alt="logo" src="${pageContext.request.contextPath}/img/logo.png" width="200" height="60">
                    </div> --%>
                    <div id="head_title">
                        <span >Swap管理系统</span>
                    </div>
                    <div id="head_info">
                        <span class="head_myinfo">欢迎,${sessionScope.adminname }</span>
                        <a href="${pageContext.request.contextPath}/adminlogout.action">退出</a>
                    </div>
                </div>
            </div>

            <div id="content"  align="left">
                <div id="content_head">
                    <a href="${pageContext.request.contextPath}/users/adminQueryUsers.action"><div class="content_title content_title_active">用户管理</div></a>
                    <a href="${pageContext.request.contextPath}/shops/adminQueryShops.action"><div class="content_title">店铺管理</div></a>
                    <a href="${pageContext.request.contextPath}/goods/adminQueryGoods.action"><div class="content_title">物品管理</div></a>
                </div>

                <div style="background-color: #D2DAE3;width :100%;padding: 30px 80px 0;">
                <div class="content_body" align="center">
                    <div id="content_body_left">
                        <a href="${pageContext.request.contextPath}/users/adminQueryUsers.action"><div class="content_opertion content_opertion_active">用户列表</div></a>
                        <a href=""><div class="content_opertion">用户创建</div></a>
                    </div>

                    <!-- Recording information start -->
                    <div id="content_body_right">
                        <form id="exam_form" action="${pageContext.request.contextPath}/users/adminSearchUsers.action" method="post">
                            <div id="content_keyword_search">
                                <input placeholder="请输入关键词" id="search_keyword" name="keyword" maxlength="30" value="${keyword }"/>
                                <button id="admin_search" type="submit" class="button button-primary button-rounded button-small" style="height: 35px;line-height: 35px;">搜索</button>
                            </div>
                        </form>

                            <div id="content_list">
                                <div id="content_list_head">
                                    <span class="exam_title_id" style="width: 20%;">编号</span>
                                    <span class="exam_title_id" style="width: 29%;">用户ID</span>
                                    <span class="exam_title_name" style="width: 29%;">用户名称</span>
                                    <span class="exam_title_edit" style="width: 20%;">编辑</span>
                                </div>
                                
                                <div style="margin-top: 20px;min-height: 590px;">
                                    <c:if test="${users.size()==0 }">
                                        <div class="rest"><span>暂无用户信息..</span></div>
                                    </c:if>
                                    <c:if test="${users.size()!=0 }">
                                        <c:forEach items="${users }" var="user" varStatus="stat">
                                            <span class="exam_title_id" style="width: 20%;display: inline-block;">${stat.count }</span>
                                            <span class="exam_title_id" style="width: 29%;display: inline-block;">${user.id }</span>
                                            <span class="exam_title_name" style="width: 29%;display: inline-block;">${user.username }</span>
                                            <span class="exam_title_edit" style="width: 20%;display: inline-block;">
                                                <a>更新</a>
                                                <a href="${pageContext.request.contextPath }/users/adminDeleteUser.action?userId=${user.id }" class="admin_delete">删除</a>
                                            </span>
                                            <hr style="border-top: 1px solid #9D9D9D">
                                        </c:forEach>
                                    </c:if>
                                </div>

                                <div id="content_list_footer">
                                    <c:if test="${users.size()==0 || not empty keyword }">
                                        <div id="paging" class="container"  style="width: 1245px;display: block;text-align: center;height:30px;display: none">
                                    </c:if>
                                    <c:if test="${users.size()!=0 }">
                                        <div id="paging" class="container"  style="width: 1245px;display: block;text-align: center;height:30px;">
                                    </c:if>
                                    <a id="homePage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=1" 
                                        class="button button-border button-rounded  button-primary page_query_a" style="width: 60px;padding: 0px;">首页</a>
                                    <c:choose>
                                        <c:when test="${page.pageNow - 1 > 0}">
                                            <a id="prvePage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=${page.pageNow - 1}"
                                                class="button   button-border button-rounded button-primary page_query_a">&lt;上一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNow - 1 <= 0}">
                                            <a id="prvePage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=1"
                                                class="button   button-border button-rounded button-primary page_query_a">&lt;上一页</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${page.totalPageCount==0}">
                                            <a id="nextPage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=${page.pageNow}"
                                             class="button   button-border button-rounded button-primary page_query_a">下一页&gt;</a>
                                        </c:when>
                                        <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                                            <a id="nextPage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=${page.pageNow + 1}"
                                             class="button   button-border button-rounded button-primary page_query_a">下一页&gt;</a>
                                        </c:when>
                                        <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                                            <a id="nextPage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=${page.totalPageCount}" 
                                             class="button   button-border button-rounded button-primary page_query_a">下一页&gt;</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${page.totalPageCount==0}">
                                            <a id="lastPage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=${page.pageNow}"
                                             class="button   button-border button-rounded button-primary page_query_a" style="width: 60px;padding: 0px;">尾页</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a id="lastPage" href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=${page.totalPageCount}"
                                             class="button   button-border button-rounded button-primary page_query_a" style="width: 60px;padding: 0px;">尾页</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: #1B9AF7">
                                        <span id="totalPage_Count" size="3">共 ${page.totalPageCount} 页</span> 
                                        <span size="3">第 <input value="${page.pageNow}" id="pageNumTo" size="1">页
                                            <a href="${pageContext.request.contextPath}/users/adminQueryUsers.action?pageNow=" id="paging_go" class="button  button-border button-rounded button-primary">确定</a>
                                        </span>
                                        <a href="${page.totalPageCount}" id="pageTotla" style="display: none"></a>
                                    </span>
                                    </div>
                                </div>

                            </div>
                    </div>
                    </div>
                    <!-- Recording information end -->

                </div>
            </div>
        </div>
        
         <div id="footer">
             <span>@2016 Swap开发团队</span>
         </div>

         <div id="page_dialog">
         </div>
         <div class="dialog_info" id="delete_button">
             <i alt="btn_close" class="btn_no icon-remove"></i>
             <p>确定删除？</p>
             <a href="" id="admin_del_id" class="display: none"><button id="btn_yes_exam">是</button></a>
             <button class="btn_no">否</button>
         </div>

         <div class="dialog_info" id="dialog_title">
             <i alt="btn_close" class="btn_no icon-remove"></i>
             <p id="dialog_title_p" style="text-align: center"></p>
             <button class="btn_no">确定</button>
         </div>
    </body>
</html>