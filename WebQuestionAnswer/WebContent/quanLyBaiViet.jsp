<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Quản lý bài viết</title>
<head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />
    
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
   <bean:define name="quanLyBaiVietForm" id="pages" property="page"></bean:define>
    <bean:define name="quanLyBaiVietForm" id="pagestart" property="pageStart"></bean:define>
    <bean:define name="quanLyBaiVietForm" id="pageend" property="pageEnd"></bean:define>
    <bean:define name="quanLyBaiVietForm" id="numpage" property="numPage"></bean:define>
    <bean:define id="ord" name="quanLyBaiVietForm" property="order"></bean:define>
    <bean:define id="types" name="quanLyBaiVietForm" property="type"></bean:define>
    <bean:define id="typesearch" name="quanLyBaiVietForm" property="typeSearch"></bean:define>
    <bean:define id="txtsearch" name="quanLyBaiVietForm" property="txtSearch"></bean:define>
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
		
		<logic:notEmpty name="quanLyBaiVietForm" property="account">
		<html:link action="/dangxuat">ĐĂNG XUẤT</html:link>
		</logic:notEmpty>
		<logic:empty name="quanLyBaiVietForm" property="account">
		<a href="/WebQuestionAnswer/dangNhap.jsp">ĐĂNG NHẬP</a>
		</logic:empty>
		</li>
		
      </ul>
    </div>
  </div>
</nav>
       <!-- form tìm kiếm --> 
           <div class="jumbotron">
                <div class="container">
                <div class="navbar-header">
                <html:form action="/listpost" method="get">
                 <input type="hidden" name="order" value="${ord}" />
                 <input type="hidden" name="page" value="${pages}" />
                 <input type="hidden" name="type" value="${types}" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                    <ul class="nav navbar-nav navbar-right">
                                <li style="padding-right: 40px;padding-top: 10px;">
                               
                                <html:text name="quanLyBaiVietForm" property="txtSearch" styleId="search"></html:text><!-- ô nhập thông tin tìm kiếm--> 
                                
                                </li> <!-- ô nhập thông tin tìm kiếm-->
                                 <li style="padding-right: 40px;width:220px;padding-top: 10px;">
                                 
	                                <html:select name="quanLyBaiVietForm" property="typeSearch" styleClass="w3-select w3-border">
				 						<html:option value="0">Tìm kiếm theo tiêu đề</html:option>
		         						<html:option value="1">Tìm theo nội dung</html:option>
		         						<html:option value="2">Tìm theo tags</html:option>
		       						 </html:select>
                                </li>
                                <li  style="padding-top: 10px;"><button class="w3-btn w3-large w3-teal">Tìm kiếm</button></li>
                    </ul>
               </html:form>
                </div>
             </div>
        </div>
<!-- end tìm kiếm -->
<!-- bảng kết quả tìm kiếm -->
<p></p>
<div class="w3-container">
  <div class="w3-left">Bảng bài viết:</div>
  <!-- phân trang -->
  <div class="w3-right">
      <p> </p>
    <div class="w3-bar">
 
    <logic:notEqual name="pagestart" value="1">
    <a href="/WebQuestionAnswer/listpost.do?order=${ord }&type=${types}&page=${pages}&c=0&o=0&txtSearch=${txtsearch}&typeSearch=${typesearch}" class="w3-bar-item w3-button glyphicon glyphicon-backward"></a>
    </logic:notEqual>
    <logic:iterate name="quanLyBaiVietForm" property="listPage" id="ipage">
    <logic:equal name="ipage" value="${pages }">
    <a href="/WebQuestionAnswer/listpost.do?order=${ord }&type=${types}&page=${ipage}&c=0&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}" class="w3-button w3-green"><bean:write name="ipage"/></a>
    </logic:equal>
    <logic:notEqual name="ipage" value="${pages }">
    <a href="/WebQuestionAnswer/listpost.do?order=${ord }&type=${types}&page=${ipage}&c=0&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}" class="w3-button"><bean:write name="ipage"/></a>
    </logic:notEqual>
    
    </logic:iterate>
    <logic:lessThan name="pageend" value="${numpage}">
    <a href="/WebQuestionAnswer/listpost.do?order=${ord }&type=${types}&page=${pages}&c=0&o=1&txtSearch=${txtsearch}&typeSearch=${typesearch}" class="w3-button glyphicon glyphicon-forward"></a>
    </logic:lessThan>
    </div>
     
</div>
    <!-- hết phân trang -->
   
  <table class="w3-table-all"> <!-- bảng thông tin-->
  <thead>
   
    <tr class="w3-green">
    <!-- tiều đề một cột trong bảng --> 
      <th>ID</th>
      <th>AccountID</th>
      <th>Tiêu đề</th>
       <th>Nội dung</th>
	   <th>Tags</th>
      <th>  
      
		<div class="input-group">
			Ngày đăng
		<html:link action="/listpost?order=${ord }&type=0&page=${pages}&c=1&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}" style="color:#000000;">
                <span class="glyphicon glyphicon-sort"></span>
         </html:link> 
          </div>
	  </th>
      <th>
			<div class="input-group">
			Votes
		<html:link action="/listpost?order=${ord }&type=1&page=${ipages}&c=1&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}" style="color:#000000;">
                <span class="glyphicon glyphicon-sort"></span>
         </html:link> 
          </div>
	  </th>
      <th>
			<div class="input-group">
			Trả lời
		<html:link action="/listpost?order=${ord }&type=2&page=${pages}&c=1&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}" style="color:#000000;">
                <span class="glyphicon glyphicon-sort"></span>
         </html:link> 
          </div>
	  </th>
      <th>
			<div class="input-group">
			Lượt xem
		<html:link action="/listpost?order=${ord }&type=3&page=${pages}&c=1&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}" style="color:#000000;">
                <span class="glyphicon glyphicon-sort"></span>
         </html:link> 
          </div>
	  </th>
	  <th>Trạng thái</th>
      <th>Thao tác</th>
    </tr>
   </thead>
   <tbody>  
   	<logic:iterate name="quanLyBaiVietForm" property="listQuestion" id="bv">
   	 <tr>
   		<th scope="row">
   			<bean:write name="bv" format="0" property ="questionID"/>
   		</th>
   		<td>
   			<bean:write name="bv" format="0" property="accountID"/>
   		</td>
   		<td>
   			<bean:write name="bv" property="title"/>
   		</td>
   		<td>
   			<bean:write name="bv" property="questionBody"/>
   		</td>
   		<td>
   			<logic:iterate name="bv" property="listTag" id="tag">
   				<bean:write name="tag" property="tagName"/>,
   			</logic:iterate>
   		</td>
   		<td>
   			<bean:write name="bv" format="dd/MM/yyyy" property="creationDate"/>
   		</td>
   		<td>
   			<bean:write name="bv" format="0" property="totalVote"/>
   		</td>
   		<td>
   			<bean:write name="bv" format="0" property="totalAnswer"/>
   		</td>
   		<td>
   			<bean:write name="bv" format="0" property="totalView"/>
   		</td>
   		<td>
   			
   			
   			
   			<bean:define id="status" name="bv" property="isLock"></bean:define>
					
					<logic:equal name="status" value="0">
					 <div>Mở</div>
					</logic:equal>
					<logic:equal name="status" value="1">
					 <div>Khóa</div>
					</logic:equal>
					<logic:equal name="status" value="-1">
					 <div>Đã xóa</div>
					</logic:equal>
   		</td>
	   	<td>
	   		<bean:define id="questionID" name="bv" property="questionID"></bean:define>
	   		<html:link action="/listpost?questionID=${questionID}&order=${ord }&type=${types}&page=${pages}&c=0&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}&typeExe=1&isLock=-1">
	   			<span class="glyphicon glyphicon-trash" style="padding-right: 10px;"></span>
	   		</html:link>
	   		<html:link action="/listpost?questionID=${questionID}&order=${ord }&type=${types}&page=${pages}&c=0&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}&typeExe=2&isLock=1">
	   			<span class="glyphicon glyphicon-lock" style="padding-right: 10px;"></span>
	   		</html:link>
	   		<html:link action="/listpost?questionID=${questionID}&order=${ord }&type=${types}&page=${pages}&c=0&o=2&txtSearch=${txtsearch}&typeSearch=${typesearch}&typeExe=3">
	   			<span class="glyphicon glyphicon-pencil"></span> 
	   		</html:link>
	    </td>
	  </tr>
	  </logic:iterate>
   </tbody>
  </table>
</div>

<p style="padding: 10px;"></p>



<div class="w3-container"><!-- thông tin tài khoản-->
        
        <div class="w3-col w3-card-4 w3-right" style="width:80%">
            <div class="w3-row w3-green" style="padding: 5px;">
                <p>Chỉnh sửa bài viết</p>
            </div>
            <p></p>
            <div class="w3-row">
              <html:form action="/listpost" styleClass="form-horizontal" method="post" >
              <input type="hidden" name="order" value="${ord}" />
                 <input type="hidden" name="page" value="${pages}" />
                 <input type="hidden" name="type" value="${types}" />
                 <input type="hidden" name="typeExe" value="3" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                   <input type="hidden" name="typeSearch" value="${typesearch}" />
                   <input type="hidden" name="txtSearch" value="${txtsearch}" />
					<div class="form-group">
                        <label class="control-label col-sm-3" for="email">QuestionID:</label>
                        <div class="col-sm-4">
                        
                        <html:text property="questionID" styleClass="form-control"   readonly="true" ></html:text>
                        </div>
                    </div>
                   <div class="form-group">
                        <label class="control-label col-sm-3" for="email">AccountID:</label>
                        <div class="col-sm-4">
                        <html:text property="accountID" styleClass="form-control"   readonly="true" ></html:text>
                       
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Tiêu đề:</label>
                        <div class="col-sm-8">
                         <html:text property="title" styleClass="form-control"  ></html:text>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="comment">Nội dung:</label>
                        <div class="col-sm-8">
                        
                        <html:textarea property="questionBody" rows="5" styleClass="form-control"></html:textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Tags:</label>
                        <div class="col-sm-8">
                        <html:text property="tags" styleClass="form-control" ></html:text>
                        
                        </div>
                    </div>
                     <div class="form-group">
	                        <label class="control-label col-sm-3" for="pwd">Trạng thái:</label>
	                        <div class="col-sm-5"> 
	                        <html:select  name="quanLyBaiVietForm" property="isLock"  styleClass="form-control" ><!-- tùy chọn khóa-->
	                        	<html:option value="-1">Xóa</html:option>
	                        	<html:option value="0">Mở</html:option>
	                        	<html:option value="1" >Khóa</html:option>
	                        </html:select>
	                        </div>
	                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-8 col-sm-10">
                        <html:submit property="submit" styleClass="w3-btn w3-large w3-teal" >Lưu</html:submit><!-- nút lưu thông tin-->
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
</body>
</html>