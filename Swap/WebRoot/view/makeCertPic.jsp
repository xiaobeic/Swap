<%@page contentType="image/jpeg" pageEncoding="UTF-8"%>  
<jsp:useBean id="image" scope="session"  class="com.swap.validate.MakeCertPic" />  
<%  
    String str = image.getCertPic(0, 0, response.getOutputStream()); 
    // 将验证码保存到Session中  
    try {  
        session.setAttribute("certCode", str);  
        //以下两行必加
        out.clear();  
        out = pageContext.pushBody();  
    } catch (Exception e) {  
        System.out.println("服务器错误");  
    }  
%>  