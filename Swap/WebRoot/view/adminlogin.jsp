<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="no-transform"/>
        <title>Swap</title>
        <meta property="wb:webmaster" content="c65b073df2ffe5a1"/>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-switch.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admincss/adminLogin.css">
        
        <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <!--<加载bootstrap.min.js之前先加载jquery.min.s-->
        <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/bootstrap-switch.js"></script>
        <script>
            function ok5(id) {
                document.getElementById(id).style.borderColor = "orange";
            }
            function ok6(id) {
                document.getElementById(id).style.borderColor = "";
            }
        </script>
    </head>

    <body>
        <form action="${pageContext.request.contextPath}/adminLogin.action" method="post">
            <div style=" width:100%;height:400px; background-color: orange;margin:-10px 0px;">
                <div class="spinner"></div>
                <img alt="" style="margin-left: 100px" src="${pageContext.request.contextPath}/img/logo.png">
            </div>
            <a href="${pageContext.request.contextPath }/view/index.jsp" class="demo">
                <div class="img" style="background-image:url('${pageContext.request.contextPath}/img/photo2.png')"></div>
                <div class="mask">
                    <div class="info">
                        <h1>Swap</h1>
                        <h2>Swap管理系统v1.0</h2>
                    </div>
                </div>
                <div class="border"></div>
            </a>
    
            <div style="margin-left: 50%;margin-top:20px;">
                <!-- 显示错误信息 -->
                <div style="width: 40%;min-height:50px;padding-top:10px;text-align:center;color: red">
                    <c:if test="${allErrors!=null}">
                         <c:forEach items="${allErrors}" var="error">
                             ${error.defaultMessage }<br>
                         </c:forEach>
                    </c:if>
                    <c:if test="${loginError!=null}">
                        ${loginError}<br>
                    </c:if>
                </div>
                <div class="form-group">
                     <div class="has-feedback form-group-lg" style="width:300px;">
                         <input type="text" name="adminname" class="form-control" placeholder="用户名/email" />
                     </div>
                </div>
                <div class="form-group">
                    <div class="form-group-lg" style="width:300px;">
                        <input type="password" name="password" class="form-control" placeholder="密码" />
                    </div>
                </div>
                <div class="form-group">
                    <div style="width: 300px;height:46px;">
                        <div style="padding-left:20px;">
                            <input type="checkbox" name="isUseCookie" checked="checked"/> 
                            <span style="color: #555;margin-right: 100px;">记住密码</span> 
                            <a href="#" class="forget-a">忘记密码</a>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div style="width:300px;" align="center">
                        <span
                            class="button-dropdown  button-dropdown-primary   button-raised">
                            <input type="submit" class="button  button-rounded button-large"
                                style="background-color: #F58400;color: white;width: 200px;"
                                value="登入">
                        </span>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

