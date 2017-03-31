<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.ArrayList"%>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="thien"%>
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<title>SE20</title>
<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />
    <!--  <link rel="stylesheet" href="css/font-awesome.min.css"/> -->
      <link rel="stylesheet" href="css/font-awesome.min.css"/>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
      <style> 
#search {
    width: 300px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 7px; 
    background-repeat: no-repeat;
    padding: 5px 10px 5px 10px;
    padding-left: 40px;
}

.textbold{
    font-weight: bold;
}
.menuclicked{
    background: #aabbcc;
}
.jumbotron {
      padding: 60px 20px 20px 20px;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #f4511e;
      font-size: 50px;
  }
  .logo {
      color: #f4511e;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #f4511e;
  }
  .carousel-indicators li {
      border-color: #f4511e;
  }
  .carousel-indicators li.active {
      background-color: #f4511e;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid #f4511e; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #f4511e;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #f4511e !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #f4511e;
      color: #fff;
  }
  .navbar {
      margin-bottom: 0;
      background-color: #333;
      z-index: 9999;
      border: 0;
      font-weight: bold;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      border-radius: 0;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #f4511e !important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
  }
</style>
</head>
<body>
    
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding-8 w3-card-2">
    <a class="w3-bar-item w3-button w3-hid	e-medium w3-hide-large w3-opennav w3-right w3-hover-black w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
    <a href="/WebQuestionAnswer/visitor.do" class="w3-margin-left w3-bar-item w3-button w3-border-bottom"><b>Simple</b> Solved</a>
    <!-- Float links to the left. Hide them on small screens -->
    <div id="tabs" class="w3-left w3-hide-small">
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=2&o=2&page=1" class="w3-bar-item w3-button">Câu hỏi</a>
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=0&o=2&page=1" class="w3-bar-item w3-button">Tags</a>
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=1&o=2&page=1" class="w3-bar-item w3-button w3-margin-right">Thành viên</a>
    </div>
    <!-- Float to the right-->
    <div class="w3-right w3-hide-small">
      <html:link action="/dangnhap" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng nhập</html:link>
    </div>
    <!-- Float to the rest-->
    <div class="w3-rest w3-hide-small btn-search w3-padding-small  w3-margin-right" >
      <html:form action="/visitor">
      		<input type="hidden" name="order" value="1" />
                 <input type="hidden" name="page" value="1" />
                 <input type="hidden" name="type" value="${types}" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                    <input type="hidden" name="typePage" value="2" />
                     <input type="hidden" name="typeSearch" value="3" />
          <div class="col-sm-8">
           <html:text property="txtSearch" styleClass="form-control" styleId="search" ></html:text>
           </div>
      </html:form>
    </div>

  </div>

   <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=2&o=2&page=1" class="w3-bar-item w3-button">Câu hỏi</a>
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=0&o=2&page=1" class="w3-bar-item w3-button">Tags</a>
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=1&o=2&page=1" class="w3-bar-item w3-button w3-margin-right">Thành viên</a>

      <html:link action="/dangnhap" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng nhập</html:link>
      <input class="w3-bar-item" type="text" name="search" placeholder="Search..">

  </div>

</div>


<div class="jumbotron">
                <div class="container">
                        <ul class="nav nav-tabs">
                        <li class="active">
                        <html:link action="/danhsachTTCN">Profile</html:link>
                        </li>
                        <li>
                         <html:link action="/suaTTCN"> Edit Profile</html:link>
                        </li>                       
                        </ul>
             </div>
        </div>
        

<div class="container">
<div class="row">
<html:form action="/suaTTCN" method="post" styleClass="form-horizontal" enctype="multipart/form-data">
    
    <div class="col-sm-3">   
	 <h4>Sửa thông tin cá nhân :</h4>
    <img src="<bean:write name="thongTinCaNhanForm" property="img"></bean:write>" class="img-rounded"  width="200" height="200">
   	<hr>
    	<div class="form-group">
                    
            <div class="col-sm-6">                        
                  <html:file property="file" title="chọn ảnh" />
                  
            </div>
      </div>   
        
    </div>

      <div class="col-sm-9">
          <div class="row">
         
          <!-- Sửa danh sach thông tin cá nhân -->
          

                <div class="form-group">
                    <label class="col-sm-2 control-label">Tên hiển thị :</label>
                    <div class="col-sm-6">                        
                        <html:text property="displayName" styleClass="form-control" styleId="focusedInput"></html:text>
                    </div>
                </div>
                
                
                
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Ngày sinh :</label>
                    <div class="col-sm-6">                    
                        <html:text property="birthDate" styleClass="form-control" styleId="focusedInput"></html:text>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Email :</label>
                    <div class="col-sm-6">                    
                        <html:text property="email" styleClass="form-control" styleId="focusedInput"></html:text>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-2 control-label">Địa chỉ :</label>
                    <div class="col-sm-6">                    
                        <html:text property="location" styleClass="form-control" styleId="focusedInput"></html:text>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 control-label"> <label for="comment">Comment:</label></div>
                    <div class="col-sm-8">                 
                    <html:textarea property="aboutMe" styleClass="form-control" rows="5" styleId="comment"></html:textarea>
                    </div>
                </div>

          <hr>
            
                 <div class="row">
                  
                    <div class="form-group">
                    <div class="col-xs-2">
                       
                    </div>
                    <div class="col-xs-3">
       					<label for="sel1">Nghề nghiệp</label>                       
                        <html:select property="career" styleClass="form-control" styleId="sel1" >                       
                        <html:option value="0">Sinh viên</html:option>
                        <html:option value="1">Đi làm</html:option>
                        </html:select>  
                    </div>
                    <div class="col-xs-3">
                        <label for="ex3">Tên công ty</label>
                        
                        <html:text property="companyName" styleClass="form-control" styleId="ex3"></html:text>
                    </div>
                    </div>
                 
    			</div>
          <hr>
		</div>
        <div class="w3-row ">
       

        
	        <div class="w3-col s2  w3-right">            
	             <button class="btn btn-success" onclick="history.go(-1);">Quay lại</button>
	        </div>
	        <div class="w3-col s2 w3-right">           
	            <html:submit styleClass="btn btn-success" property="submit" value="submit">Lưu</html:submit>
	        </div>
         
        </div>

         
           <!-- End Sửa danh sach thông tin cá nhân -->
           
          </div> 
        
 </html:form>

</div>
</div>

<!-- hết tabs của trang-->       

     <!-- footer của trang-->
    <footer style="min-height: 100px;">
        
    </footer>
    <!-- hết footer của trang-->
</body>
</html>