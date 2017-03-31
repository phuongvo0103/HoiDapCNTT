<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/w3.css" />
          <link rel="stylesheet" href="css/w3-theme-black.css" />
          <meta name="viewport" content="width=device-width, initial-scale=1">
              <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
          <title>Login</title>
          
</head>
<body>
    
<header class="w3-container w3-teal">
  <h1>Register</h1>
</header>

<div class="w3-container w3-half w3-margin-top">
<html:form action="/themTTCN" method="post" styleClass="w3-container w3-card-4">
	<p>
<html:text property="userName" styleClass="w3-input" style="width:90%" ></html:text>
<label class="w3-label w3-validate">Tên đăng nhập</label></p>
<p>
<html:password property="pass" styleClass="w3-input" style="width:90%" ></html:password>
<label class="w3-label w3-validate">mật khẩu</label></p>
<p>
<html:text property="email" styleClass="w3-input" style="width:90%" ></html:text>
<label class="w3-label w3-validate">Email</label></p>
<p>
<input id="milk" class="w3-check" type="checkbox" checked="checked">
<label class="w3-validate">Stay logged in</label></p>

<p>

<html:submit styleClass="btn btn-primary" property="submit" value="submit">Thêm mới</html:submit>
</html:form>


</div>

        
    </body>

</html>