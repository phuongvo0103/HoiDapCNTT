<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Quản lý Account</title>
<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />

      <link rel="stylesheet" href="css/font-awesome.min.css"/>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<script>
function changeTYPELOCK() {
	var STT=document.getElementById("STT");
	var TYPELOCK=document.getElementById("TYPELOCK");
	var v=TYPELOCK.value;
	if(v=="-1" || v=="1")
		STT.value="0";
	else if(v=="0")
		STT.value="7";
	
}



  /*
  $(document).ready(function(){
	$("#showAccountInfo").click(function(){
		showpopup();
	});
});

  function showpopup(){
	$("#editAccountForm").fadeIn();
	$("#editAccountForm").css({"visibility":"visible","display":"block"});
  }
*/
	/*
	function show(){
		document.getElementById("editAccountForm").style.display="block";	
}
	*/

  /*
  $("#button1").click(function(e) {
      openPopup();
  });
  
  function openPopup(){
	  var $popup1=$("#popup1");
	  $popup1.fadeIn();
  }
  
  function onload()
  {
	  var STT=document.getElementById("STT");
	  if(STT.value=="0") 
		  STT.disabled=true;
	  else 
		  STT.disabled=false;
  }
  
  function clickSTT()
  {
 	 var STT=document.getElementById("STT");
 	 var TYPELOCK=document.getElementById("TYPELOCK");
 	 var v=TYPELOCK.value;
      if(v=="KVV")
     	 STT.value="0";
      else if(v=="MK")
     	 STT.value="0";
      else if(v=="KSD")
     	 STT.value="0";
      if(STT.value=="0") 
     	 STT.disabled=true;
      else 
     	 STT.disabled=false;
  } 
  */
</script>

<style> 
	
	/*
	#editAccountForm{
		display:none;
	}
	*/
	
	
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
		
		<logic:notEmpty name="accountForm" property="account">
		<html:link action="/dangxuat">ĐĂNG XUẤT</html:link>
		</logic:notEmpty>
		<logic:empty name="accountForm" property="account">
		<a href="/WebQuestionAnswer/dangNhap.jsp">ĐĂNG NHẬP</a>
		</logic:empty>
		</li>
      </ul>
    </div>
  </div>
</nav>
<!-- ---end menu -->
<bean:define name="accountForm" id="pages" property="page"></bean:define>
    <bean:define name="accountForm" id="pagestart" property="pageStart"></bean:define>
    <bean:define name="accountForm" id="pageend" property="pageEnd"></bean:define>
    <bean:define name="accountForm" id="numpage" property="numPage"></bean:define>
    <bean:define id="ord" name="accountForm" property="order"></bean:define>
    <bean:define id="types" name="accountForm" property="type"></bean:define>
    <bean:define id="search" name="accountForm" property="txtSearch"></bean:define>
    <bean:define id="typesearch" name="accountForm" property="typeSearch"></bean:define>
 <!-- form tìm kiếm --> 
<div class="jumbotron">
    <div class="container">
      <div class="navbar-header">
        <html:form action="/listaccount" method="get">
        		<input type="hidden" name="typeExe" value="0" />
                 <input type="hidden" name="order" value="${ord}" />
                 <input type="hidden" name="page" value="${pages}" />
                 <input type="hidden" name="type" value="${types}" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                   
	     <ul class="nav navbar-nav navbar-right">
	      <!-- ô nhập thông tin tìm kiếm -->
	       <li style="padding-right: 40px;padding-top: 10px;">
	        <html:text styleId="search" name="accountForm" property="txtSearch"></html:text>
	       </li>
	       <!-- tùy chọn điều kiện sắp xếp --> 
	       <li style="padding-right: 40px;width:220px;padding-top: 10px;">
	        <html:select name="accountForm" property="typeSearch" styleClass="w3-select w3-border">
			 <html:option value="0">Tìm theo tên đăng nhập</html:option>
	         <html:option value="1">Tìm theo tên hiển thị</html:option>
	         <html:option value="2">Tìm theo tên email</html:option>
	        </html:select>
	       </li>
	       <li style="padding-top: 10px;"><html:submit property ="submit" value ="Search" styleClass="w3-btn w3-large w3-teal"></html:submit></li>
	      </ul>
         </html:form>
         
      </div>
   </div>
</div>
<!-- end tìm kiếm -->
<!-- bảng kết quả tìm kiếm -->
<p></p>
<div class="w3-container">
  <div class="w3-left">Bảng danh sách tài khoản:</div>
  <!-- phân trang -->
  <div class="w3-right">
   <p>
    <div class="w3-bar">
	    <logic:notEqual name="pagestart" value="1">
	    <a href="/WebQuestionAnswer/listaccount.do?order=${ord }&type=${types}&page=${pages}&o=1&txtSearch=${search}&c=0&typeSearch=${typesearch}" class="w3-bar-item w3-button glyphicon glyphicon-backward"></a>
	    </logic:notEqual>
	    <logic:iterate name="accountForm" property="listPage" id="ipage">
	    <logic:equal name="ipage" value="${pages }">
	    <a href="/WebQuestionAnswer/listaccount.do?order=${ord }&type=${types}&page=${ipage}&o=2&txtSearch=${search}&c=0&typeSearch=${typesearch}" class="w3-button w3-green"><bean:write name="ipage"/></a>
	    </logic:equal>
	    <logic:notEqual name="ipage" value="${pages}">
	    <a href="/WebQuestionAnswer/listaccount.do?order=${ord }&type=${types}&page=${ipage}&o=2&txtSearch=${search}&c=0&typeSearch=${typesearch}" class="w3-button"><bean:write name="ipage"/></a>
	    </logic:notEqual>
	    
	    </logic:iterate>
	    <logic:lessThan name="pageend" value="${numpage}">
	    <a href="/WebQuestionAnswer/listaccount.do?order=${ord }&type=${types}&page=${pages}&o=0&txtSearch=${search}&c=0&typeSearch=${typesearch}" class="w3-button glyphicon glyphicon-forward"></a>
	    </logic:lessThan>
    </div>
   </p>
 </div>
  <!-- hết phân trang -->
<html:form action="/listaccount" method="post">
  <table class="w3-table-all"> <!-- bảng thông tin-->
  	<thead>
	    <tr class="w3-green">
	    	<!-- tiều đề một cột trong bảng --> 
	      <th>ID</th>
	      <th>
				<div class="input-group">
					Tên đăng nhập
					<html:link action="/listaccount?order=${ord}&type=0&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
		  </th>
	      <th>
	      	<div class="input-group">
					Tên hiển thị
					<html:link action="/listaccount?order=${ord}&type=1&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
	      </th>
	      <th>
	      	<div class="input-group">
					Email
					<html:link action="/listaccount?order=${ord}&type=2&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
	      </th>
	      <th>
	      	<div class="input-group">
					Answer
					<html:link action="/listaccount?order=${ord}&type=3&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
	      </th>
	      <th>
	      	<div class="input-group">
					Question
					<html:link action="/listaccount?order=${ord}&type=4&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
	      </th>
		  <th>
				<div class="input-group">
					Point
					<html:link action="/listaccount?order=${ord}&type=5&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
		  </th>
		  <th>
				<div class="input-group">
					LastSeen
					<html:link action="/listaccount?order=${ord}&type=6&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
		  </th>
		  <th>
				<div class="input-group">
					StartDate
					<html:link action="/listaccount?order=${ord}&type=7&page=${pages}&o=2&txtSearch=${search}&c=1&typeSearch=${typesearch }" style="color:#000000;">
                		<span class="glyphicon glyphicon-sort"></span>
                </html:link>
				</div>
		  </th>
	      <th>Trạng thái</th>
	      <th>Action</th>
	   </tr>
   </thead>
   <tbody>
   	<logic:iterate name="accountForm" property="listAccount" id="account">
   	 <tr>
   		<th scope="row">
   			<bean:write name="account" property ="accountID"/>
   		</th>
   		<td>
   			<bean:write name="account" property="userName"/>
   		</td>
   		<td>
   			<bean:write name="account" property="displayName"/>
   		</td>
   		<td>
   			<bean:write name="account" property="email"/>
   		</td>
   		<td>
   			<bean:write name="account" property="totalAnswer"/>
   		</td>
   		<td>
   			<bean:write name="account" property="totalQuestion"/>
   		</td>
   		<td>
   			<bean:write name="account" property="reputationPoint"/>
   		</td>
   		<td>
   			<bean:write name="account" property="lastSeen"/>
   		</td>
   		<td>
   			<bean:write name="account" property="startDate"/>
   		</td>
   		
   		<td>
   			
   			<bean:define id="status" name="account" property="stt"></bean:define>
					
					<logic:equal name="status" value="1">
					 <div>Mở</div>
					</logic:equal>
					
					<logic:greaterThan name="status" value="1">
					 		<div>Khóa</div>
					</logic:greaterThan>
					
					<logic:lessThan name="status" value="0">
					<div>Đã xóa</div>
					</logic:lessThan>
					
   		</td>
	   	<td>
	   		<bean:define id="accountID" name="account" property="accountID"></bean:define>
	   		<bean:define id="stt" name="account" property="stt"></bean:define>
	   		<html:link action="/listaccount?accountID=${accountID}&order=${ord}&type=${types }&page=${pages}&o=2&txtSearch=${search}&c=0&typeSearch=${typesearch }&typeExe=3">
	   			<span class="glyphicon glyphicon-trash" style="padding-right: 10px;"></span>
	   		</html:link>
	   		<html:link  action="/listaccount?accountID=${accountID}&order=${ord}&type=${types }&page=${pages}&o=2&txtSearch=${search}&c=0&typeSearch=${typesearch}&typeExe=2">
	   			<span class="glyphicon glyphicon-lock" style="padding-right: 10px;"></span>
	   		</html:link>
	   		<html:link action="/listaccount?accountID=${accountID}&order=${ord}&type=${types }&page=${pages}&o=2&txtSearch=${search}&c=0&typeSearch=${typesearch }">
	   			<span class="glyphicon glyphicon-pencil"></span> 
	   		</html:link>
	   		
	    </td>
	  </tr>
	 </logic:iterate>
   </tbody>
  </table>
</div>
</html:form>
<!--  -->
<p style="padding: 10px;"></p>
<div class="w3-container"><!-- thông tin tài khoản-->
        <div class="w3-col w3-card-4 w3-right" id="editAccountForm" style="width:50%">
            <div class="w3-row w3-green" style="padding: 5px;">
                <p>Tình trạng tài khoản</p>
            </div>
            <p></p>
            <div class="w3-row">
               <html:form onsubmit="return confirm('Do you really want to edit this Account?');" action="/listaccount" method="post" styleClass="form-horizontal">
               <input type="hidden" name="typeExe" value="1" />
                 <input type="hidden" name="order" value="${ord}" />
                 <input type="hidden" name="page" value="${pages}" />
                 <input type="hidden" name="type" value="${types}" />
                 <input type="hidden" name="txtSearch" value="${search}" />
                 <input type="hidden" name="typeSearch" value="${typesearch}" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
               <div class="form-group">
                        <label class="control-label col-sm-3" for="email">AccountID:</label>
                        <div class="col-sm-8">
                        	<html:text property="accountID" styleClass="form-control" readonly="true"></html:text>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Tên đăng nhập:</label>
                        <div class="col-sm-8">
                        	<html:text property="userName" styleClass="form-control" readonly="true"></html:text>
                        </div>
                      
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Tên hiển thị:</label>
                        <div class="col-sm-8">
                        	<html:text property="displayName" styleClass="form-control" readonly="true"></html:text>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <div class="col-sm-8">
                        	<html:text property="email" styleClass="form-control" readonly="true"></html:text>
                        </div>
                    </div>
                   
	                    <div class="form-group">
	                        <label class="control-label col-sm-3" for="pwd">Trạng thái:</label>
	                        <div class="col-sm-5"> 
	                        <html:select styleId="TYPELOCK" name="accountForm" property="status" onchange="changeTYPELOCK();" styleClass="form-control" ><!-- tùy chọn khóa-->
	                        	<html:option value="-1">Khóa vĩnh viễn</html:option>
	                        	<html:option value="0">Khóa tạm thời</html:option>
	                        	<html:option value="1" >Mở</html:option>
	                        </html:select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="control-label col-sm-3" for="pwd">Số ngày khóa:</label>
	                        <div class="col-sm-5"> 
	                        <html:select styleId="STT" name="accountForm" property="stt" onmousemove="moveOnSTT();" styleClass="w3-select w3-border"><!-- tùy chọn khóa-->
	                           <html:option value="0">---Chọn---</html:option>
	                           <html:option value="7">7 ngày</html:option>
	                           <html:option value="15">15 ngày</html:option>
	                           <html:option value="30">30 ngày</html:option>
	                           <html:option value="60">60 ngày</html:option>
	                        </html:select>
	                        </div>
	                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-8 col-sm-10">
                        	<html:submit styleClass="w3-btn w3-large w3-teal" property="submit" >Lưu</html:submit>
                        </div>
                    </div>
                </html:form>
            </div>
            </div>
            <p></p>
 </div>
<!-- end bảng kết quả tìm kiếm -->
     <!-- footer của trang-->
    <div style="min-height: 100px;">
    </div>
    <!-- hết footer của trang-->
   <script type="text/javascript">
   changeTYPELOCK();
   </script>
</body>
</html>