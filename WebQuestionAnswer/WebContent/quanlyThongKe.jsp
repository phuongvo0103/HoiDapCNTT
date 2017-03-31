<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<title>Thống kê</title>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />
    <!--  <link rel="stylesheet" href="css/font-awesome.min.css"/> -->
      <link rel="stylesheet" href="css/font-awesome.min.css"/>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

<!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
  <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
      <style> 
input[type=text] {
    width: 200px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 5px 10px 5px 20px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 100%;
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
 <!-- Menu -->
<nav class="navbar navbar-default navbar-fixed-top"> <!-- menu của trang --> 
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">QUẢN LÝ BÀI VIẾT</a></li>
        <li ><a href="#services">QUẢN LÝ TAGS</a></li> 
        <li><a href="#portfolio">QUẢN LÝ ACCOUNT</a></li><!-- menu quản lý bài viết --> 
        <li><a href="#pricing">THỐNG KÊ</a></li>
		<li><a href="#pricing">ĐĂNG XUẤT</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- End Menu -->
       <!-- form điều kiện thống kê --> 
           <div class="jumbotron">
                <div class="container">
                <div class="navbar-header">               
                <html:form action="/thong-ke">
                	 <ul class="nav navbar-nav navbar-right">
                                 <li style="padding-right: 40px;width:220px;padding-top: 10px;">
                                <html:select property="" styleClass="w3-select w3-border"><!-- tùy chọn điều kiện tìm kiếm-->
                                 	<html:option value="0">Thống kê bài viết</html:option>
                                 	<html:option value="1">Thống kê tài khoản</html:option>
                                 	<html:option value="2">Thống kê tags</html:option>
                                 </html:select> 
                                </li>
                                
                                <li  style="padding-top: 10px;">                           
                                <html:button property="submit" styleClass="w3-btn w3-large w3-teal">Thống kê</html:button>
                                </li>
                    </ul>
                </html:form>             
                </div>
             </div>
        </div>
<!-- end điều kiện thống kê-->

<!-- bảng kết quả tìm kiếm -->
<p></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Biểu Đồ</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-area-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
<p></p>

<div class="w3-container">
  <!-- phân trang -->
  <div class="w3-right">
      <p>
    <div class="w3-bar">
    <a href="#" class="w3-bar-item w3-button glyphicon glyphicon-backward"></a>
    <a href="#" class="w3-button w3-green">1</a>
    <a href="#" class="w3-button">2</a>
    <a href="#" class="w3-button">3</a>
    <a href="#" class="w3-button">4</a>
    <a href="#" class="w3-button glyphicon glyphicon-forward"></a>
    </div>
      </p>
</div>
    <!-- hết phân trang -->
    
    <!-- DS thống kê -->
  <table class="w3-table-all"> <!-- bảng thông tin-->
  <thead>
    <tr class="w3-green">
      <th>STT</th><!-- tiều đề một cột trong bảng --> 
      <th>Tên tài khoản</th>
      <th>Tiêu đề</th>
       <th>Nội dung</th>
      <th>
			<div class="input-group">
			Ngày đăng
			<html:button property="ngayDang" styleClass="glyphicon glyphicon-chevron-up" style="color:#000000;"></html:button>		
		</div>
	  </th>
      <th>
			<div class="input-group">
			Votes
			<html:button property="votes" styleClass="glyphicon glyphicon-chevron-up" style="color:#000000;"></html:button>			
		</div>
	  </th>
      <th>
			<div class="input-group">
			Trả lời
			<html:button property="traLoi" styleClass="glyphicon glyphicon-chevron-up" style="color:#000000;"></html:button>
		</div>
	  </th>
      <th>
			<div class="input-group">
			Lượt xem
			<html:button property="luotXem" styleClass="glyphicon glyphicon-chevron-up" style="color:#000000;"></html:button>
		</div>
	  </th>
    </tr>
    </thead>
    <!-- Gọi thuộc tính của các danh sách question, account, tag -->
    <tbody>
            <logic:iterate name="ThongKeForm" property="listThongKe" id="thongke">
            	<tr>
                <th scope="row">
                	<bean:write name="thongke" property="stt"/>
				</th>
                <td>
                	<bean:write name="thongke" property="userName"/>
                </td>
                 <td>
                	<bean:write name="thongke" property="title"/>
                </td>
                 <td style="width:40%;word-wrap: break-word;"> 
                	<bean:write name="thongke" property="questionBody"/>
                </td>
                 <td>
                	<bean:write name="thongke" property="postDate"/>
                </td>
                 <td>
                	<bean:write name="thongke" property="totalVote"/>
                </td>
                 <td>
                	<bean:write name="thongke" property="totalAnswer"/>
                </td>
                 <td>
                	<bean:write name="thongke" property="totalView"/>
                </td>    
            	</tr>
            </logic:iterate>
             </tbody>   
             
  </table>
  
</div>

<p style="padding: 10px;"></p>

<!-- end bảng kết quả tìm kiếm -->
     <!-- footer của trang-->
    <footer style="min-height: 100px;">
        
    </footer>
    <!-- hết footer của trang-->
</body>
</html>