<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="common.StringProcess"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		<h3>Đăng nhập hệ thống</h3>
		<br>
		<html:form action="/dangnhap" method="post">
			<div class="row form-group">
				<label class="col-lg-2">Tên đăng nhập</label>
				<div class="col-lg-3">
					<html:text property="userName" styleClass="form-control" ></html:text>
					<div style="color:red;"><html:errors property="tenDangNhapError"/></div>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-lg-2">Mật khẩu</label>
				<div class="col-lg-3">
					<html:password property="pass" styleClass="form-control" ></html:password>
				<div style="color:red;">	<html:errors property="matKhauError"/></div>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-lg-3 col-lg-offset-2">
					<p style="color: red;">
						<bean:write name="nguoiDungForm" property="thongBao"/>
					</p>
				</div>
			</div>
			
			
			
                	
			
			<div class="row form-group">
				<div class="col-lg-3 col-lg-offset-2">
					<html:submit styleClass="btn btn-primary">Đăng nhập</html:submit>
					<button class="btn btn-primary" type="reset">Hủy</button>
				</div>
			</div>
			
			
		</html:form>
		<div class="row form-group">
				<label class="col-lg-2"></label>
				<div class="col-lg-3">
					<html:link action="/dangKy"> Đăng ký </html:link>
				</div>
			</div>
	</div>
</body>
</html>