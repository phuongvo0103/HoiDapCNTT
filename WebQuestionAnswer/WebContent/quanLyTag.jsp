<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<title>Quản lý Tags</title>
<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />
    <!--  <link rel="stylesheet" href="css/font-awesome.min.css"/> -->
      <link rel="stylesheet" href="css/font-awesome.min.css"/>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script>
  var xhttp;
  function initTransfer()
  {
      if(xhttp==null||xhttp.readyState==0){
          if(window.XMLHttpRequest){
              xhttp=new XMLHttpRequest();
              xhttp.onreadystatechange=function(){callback(xhttp);};
          }
              else{xhttp=new ActiveXObject("Microsoft.XMLHTTP");
              xhttp.onreadystatechange=function(){callback(xhttp);};
          }}
  }
  function callback(xhttpRequest){
      if(xhttpRequest.readyState==4&&xhttpRequest.status==200){
      alert(xhttpRequest.responseText);
     }
  }
  //value : gia tri can gui : iD=01&tagName=java&totalUse=10&description=java la thong tin
  //url: dia chi action
  //phuong thuc gui:GET hoac POST
  function send(value,url,method){
      initTransfer();
      if(xhttp!=null){
      xhttp.open(method,url,true);if(method=="GET")
      xhttp.send();else if(method=="POST"){
          xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
          xhttp.send(value);}
      }
  }
  function showDialog()
  {
	  document.getElementById("suathongtintag").style.display="block";
  }
  
  function hideDialog()
  {
	  document.getElementById("suathongtintag").style.display="none";
  }
  </script>
      <style> 
      #suathongtintag{
      display:none;
      }
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
       <html:link action="/visitor"><h3>Logo</h3></html:link>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><html:link action="/listpost">QUẢN LÝ BÀI VIẾT</html:link></li>
        <li ><html:link action="/listtag">QUẢN LÝ TAGS</html:link></li> 
        <li><html:link action="/listaccount">QUẢN LÝ ACCOUNT</html:link></li><!-- menu quản lý bài viết --> 
		<li>
		
		<logic:notEmpty name="tagForm" property="account">
		<html:link action="/dangxuat">ĐĂNG XUẤT</html:link>
		</logic:notEmpty>
		<logic:empty name="tagForm" property="account">
		<a href="/WebQuestionAnswer/dangNhap.jsp">ĐĂNG NHẬP</a>
		</logic:empty>
		</li>
      </ul>
    </div>
  </div>
</nav>
<!-- End Menu -->
   <bean:define name="tagForm" id="pages" property="page"></bean:define>
    <bean:define name="tagForm" id="pagestart" property="pageStart"></bean:define>
    <bean:define name="tagForm" id="pageend" property="pageEnd"></bean:define>
    <bean:define name="tagForm" id="numpage" property="numPage"></bean:define>
    <bean:define id="ord" name="tagForm" property="order"></bean:define>
    <bean:define id="types" name="tagForm" property="type"></bean:define>
    <bean:define id="search" name="tagForm" property="txtSearch"></bean:define>
       <!-- form tìm kiếm --> 
           <div class="jumbotron">
                <div class="container">
                <div class="navbar-header">
                <html:form action="/listtag" method="get">
                <input type="hidden" name="typeExe" value="0" />
                 <input type="hidden" name="order" value="${ord}" />
                 <input type="hidden" name="page" value="${pages}" />
                 <input type="hidden" name="type" value="${types}" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                <ul class="nav navbar-nav navbar-right">
                                <li style="padding-right: 40px;padding-top: 10px;">
                                <html:text styleId="search" name="tagForm" property="txtSearch"></html:text><!-- ô nhập thông tin tìm kiếm-->                         
                                </li>
                                 <li style="padding-right: 40px;width:50px;padding-top: 10px;">
                                                                  
                                <li  style="padding-top: 10px;">                            
                                <html:submit property="submit" styleClass="w3-btn w3-large w3-teal"> Tìm kiếm </html:submit>                                
                                </li>
                    </ul>
                   </html:form>                        
                </div>
             </div>
        </div>
<!-- end tìm kiếm -->

<!-- bảng kết quả tìm kiếm -->
<p></p>
<div class="w3-container">
  <div class="w3-left">Bảng danh sách tag:</div>
  
  <!-- phân trang -->
  <div class="w3-right">
      <p></p>
    <div class="w3-bar">
    
    <logic:notEqual name="pagestart" value="1">
    <a href="/WebQuestionAnswer/listtag.do?order=${ord }&type=${types}&page=${pages}&o=1&txtSearch=${search}&c=0" class="w3-bar-item w3-button glyphicon glyphicon-backward"></a>
    </logic:notEqual>
    <logic:iterate name="tagForm" property="listPage" id="ipage">
    <logic:equal name="ipage" value="${pages }">
    <a href="/WebQuestionAnswer/listtag.do?order=${ord }&type=${types}&page=${ipage}&o=2&txtSearch=${search}&c=0" class="w3-button w3-green"><bean:write name="ipage"/></a>
    </logic:equal>
    <logic:notEqual name="ipage" value="${pages}">
    <a href="/WebQuestionAnswer/listtag.do?order=${ord }&type=${types}&page=${ipage}&o=2&txtSearch=${search}&c=0" class="w3-button"><bean:write name="ipage"/></a>
    </logic:notEqual>
    
    </logic:iterate>
    <logic:lessThan name="pageend" value="${numpage}">
    <a href="/WebQuestionAnswer/listtag.do?order=${ord }&type=${types}&page=${pages}&o=0&txtSearch=${search}&c=0" class="w3-button glyphicon glyphicon-forward"></a>
    </logic:lessThan>
    </div>    
     
</div>
    <!-- hết phân trang -->
  
 <!-- Bảng danh sách -->
  <table class="w3-table-all"> <!-- bảng thông tin-->
 		 <thead>
            <tr class="w3-green" >
                <th>Mã tags</th><!-- tiều đề một cột trong bảng -->               
                <th>
                <html:link action="/listtag?order=${ord}&type=0&page=${pages}&o=2&txtSearch=${search}&c=1" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>              
                Tên tags
                </th>
                <th>
                <html:link action="/listtag?order=${ord}&type=2&page=${pages}&o=2&txtSearch=${search}&c=1"  style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>  
                Điểm của tags
                </th>
                <th>
                <html:link action="/listtag?order=${ord}&type=3&page=${pages}&o=2&txtSearch=${search}&c=1"  style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>  
                Sử dụng
                </th>
                <th>Mô tả</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
          </thead>
            <tbody>
            <logic:iterate name="tagForm" property="tagList" id="tag">
            	<tr>
                <th>
                	<bean:write name="tag" property="tagID"/>
				</th>
				<td>
                	<bean:write name="tag" property="tagName"/>
                </td>
                <td>
                	<bean:write name="tag" property="tagPoint"/>
                </td>
                <td>
                	<bean:write name="tag" property="totalUse"/>
                </td>
                <td style="width:40%;word-wrap: break-word;">
                	<bean:write name="tag" property="descriptionDetails"/>
				</td>
				<td>
					<bean:define id="status" name="tag" property="stt"></bean:define>
					
					<logic:equal name="status" value="1">
					 <div>Mở</div>
					</logic:equal>
					<logic:equal name="status" value="0">
					 <div>Khóa</div>
					</logic:equal>
					<logic:equal name="status" value="-1">
					 <div>Đã xóa</div>
					</logic:equal>
                </td>
                <td>
                
                <div class="w3-container w3-large w3-text-orange"> <!-- control trên mỗi dòng của bảng-->
                	<bean:define id="iD" name="tag" property="tagID"></bean:define>
                	
                	<html:link action="/listtag?tagID=${iD}&typeExe=0&order=${ord }&type=${types}&page=${pages}&o=2&txtSearch=${search}&c=0" onclick="showDialog();">
                	<span class="glyphicon glyphicon-pencil"></span>
                	</html:link>
                	
                	<html:link action="/listtag?tagID=${iD}&typeExe=2&submit=0&order=${ord }&type=${types}&page=${pages}&o=2&txtSearch=${search}&c=0" style="margin-left: 30px;">
                		<span class="glyphicon glyphicon-trash"></span>
                	</html:link>
               	</div>
                </td>
            </tr>
            </logic:iterate>
            </tbody>   
  </table>

  <!-- End bảng danh sách -->
</div>

<!-- Bảng sửa thông tin tag -->
<p style="padding: 10px;"></p>
<!-- id="suathongtintag" -->
<div class="w3-container"  ><!-- thông tin tài khoản-->
        
        <div class="w3-col w3-card-4 w3-right" style="width:50%">
            <div class="w3-row w3-green" style="padding: 5px;">
                <div class="w3-col">Thông tin Tags</div>
                
            </div>
            <p></p>
            
            <div class="w3-row">
               <html:form action="/listtag" styleClass="form-horizontal" method="post" enctype="application/x-www-form-urlencoded">
               <input type="hidden" name="typeExe" value="1" />
               <input type="hidden" name="order" value="${ord}" />
               <input type="hidden" name="page" value="${pages}" />
               <input type="hidden" name="type" value="${types}" />
               <input type="hidden" name="o" value="2" />
               <input type="hidden" name="c" value="0" />
               <input type="hidden" name="txtSearch" value="${search}" />
					<div class="form-group">
                        <label class="control-label col-sm-3" for="email">Mã Tags:</label>
                        <div class="col-sm-8">
                        <html:text property="tagID" styleClass="form-control" readonly="true" ></html:text>                   
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Tên Tags:</label>
                        <div class="col-sm-8">                      
                        <html:text property="tagName" styleClass="form-control"></html:text>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Điểm của Tag:</label>
                        <div class="col-sm-8">
                        <html:text property="tagPoint" styleClass="form-control" ></html:text>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="comment">Mô tả:</label>
                        <div class="col-sm-8">
                        <html:textarea property="descriptionDetails" styleClass="form-control"></html:textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="comment">Trạng thái:</label>
                        <div class="col-sm-8">
					<html:select onchange="selectoption();" name="tagForm" styleClass="w3-select w3-border" property="stt" ><!-- tùy chọn điều kiện tìm kiếm-->                                   
                            <html:option value="-1">Xóa</html:option>
                            <html:option value="0">Khóa</html:option>
                            <html:option value="1">Mở</html:option>
                    </html:select>
                    </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-8 col-sm-10">                       
                        <html:submit property="submit" styleClass="w3-btn w3-large w3-teal">Lưu</html:submit><!-- nút lưu thông tin-->                         
                        </div>
                    </div>
			</html:form>
            </div>
            
            </div>
            <p></p>
        </div>
<!-- End sửa thông tin tag -->        
             
<!-- end bảng kết quả tìm kiếm -->
     <!-- footer của trang-->
    <footer style="min-height: 100px;">
        
    </footer>
    <!-- hết footer của trang-->
</body>
</html>