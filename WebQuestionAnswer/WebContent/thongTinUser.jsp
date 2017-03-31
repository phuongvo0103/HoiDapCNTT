<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<title></title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />

      <link rel="stylesheet" href="css/font-awesome.min.css"/>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
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
      padding: 60px 0px 0px 0px;
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
  <div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding-8 w3-card-2">
    <a class="w3-bar-item w3-button w3-hid	e-medium w3-hide-large w3-opennav w3-right w3-hover-black w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
    <a href="#home" class="w3-margin-left w3-bar-item w3-button w3-border-bottom"><b>Simple</b> Solved</a>
    <!-- Float links to the left. Hide them on small screens -->
    <div id="tabs" class="w3-left w3-hide-small">
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=2&o=2&page=1" class="w3-bar-item w3-button">Câu hỏi</a>
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=0&o=2&page=1" class="w3-bar-item w3-button">Tags</a>
      <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=&c=0&typeSearch=0&typePage=1&o=2&page=1" class="w3-bar-item w3-button w3-margin-right">Thành viên</a>
    </div>
    <!-- Float to the right-->
    <div class="w3-right w3-hide-small">
      <logic:notEmpty name="accountDetailsForm" property="account">
		<html:link action="/dangxuat" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng xuất</html:link>
		</logic:notEmpty>
		<logic:empty name="accountDetailsForm" property="account">
		<a href="/WebQuestionAnswer/dangNhap.jsp" class="w3-bar-item w3-button w3-blue w3-round-large">Đăng nhập</a>
		</logic:empty>
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
                      <html:link action="/tag">Profile</html:link>
                        </li>                    
                        </ul>
             </div>
        </div>


<!-- thông tin cá nhân -->

<div class="container">
<div class="row">
<html:form action="/user" method="post">
<!-- Hình ảnh thông tin cá nhân -->
 <div class="col-sm-3">                
         <div class="w3-card-12 w3-hover-shadow w3-center" width="800" height="800">
           <bean:define id="img" name="accountDetailsForm" property="img"> </bean:define>
            
           	 <img src="${img}" class="img-rounded"  width="200px" height="200px">  
                  
            <div class="w3-container w3-center">
                <p><table>23,545 REPUTATION</table></p>
            </div>
                <div class="badge" style="background-color:rgb(255,255,0);color:Yellow">
                <a><span class="badge" style="background-color:rgb(255,215,0);color:gold">.</span>20</a>
                </div>
                <div class="badge" style="background-color:rgb(255,239,213);color:PapayaWhip">
                <a><span class="badge" style="background-color:rgb(192,192,192);color:silver">.</span>30</a>
                </div>
                <div class="badge" style="background-color:rgb(255,192,203);color:pink">
                <a><span class="badge" style="background-color:rgb(139,69,19);color:saddlebrown">.</span>50</a>
                </div>
                <table></table>
            </div>
      <div class="w3-container">
                <ul class="w3-ul">
    <li><i class="glyphicon glyphicon-bars"></i> <h3>Communities</li>
                </ul>
            </div>
  </div>
  
<!-- End hình ảnh thông tin cá nhân -->

<div class="col-sm-9">

<!--content-->
<!-- Hiển thị thông tin -->
    <div class="row">
        <div class=" form-horizontal col-sm-7  ">
            <div id="section1">
            
           	<div class="form-group">
                    <label class="col-sm-3 ">Tên hiển thị :</label>
                    <div class="col-sm-7 ">
                         <bean:write  name="accountDetailsForm" property="displayName" ></bean:write>
                    </div>
                </div>                
                <div class="form-group">
                    <label class="col-sm-3 ">Email:</label>
                    <div class="col-sm-7 ">
                         <bean:write  name="accountDetailsForm" property="email" ></bean:write>
                    </div>
                </div>
                
                   <div class="form-group">
                    <label class="col-sm-3 ">Nghề nghiệp:</label>
                    <div class="col-sm-7 ">
                         <bean:write  name="accountDetailsForm" property="career" ></bean:write>
                    </div>
                </div>
                     <div class="form-group">
                    <label class="col-sm-3 ">Tên công ty:</label>
                    <div class="col-sm-7 ">
                         <bean:write  name="accountDetailsForm" property="companyName" ></bean:write>
                    </div>
                </div>
                     <div class="form-group">
                    <label class="col-sm-3 ">Tiểu sử:</label>
                    <div class="col-sm-7 ">
                         <bean:write  name="accountDetailsForm" property="aboutMe" ></bean:write>
                    </div>
                </div>		             
            </div>
        </div>
<!--Answer-->
	 <div class="form-horizontal col-sm-1 ">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="w3-container w3-cell w3-mobile">
                                <p><h4>
                                <bean:write  name="accountDetailsForm" property="totalAnswer" ></bean:write>
                                </h4></p>
                                <p>answers</p>
                            </div>
                        </div>
                    </div>
                </div>
<!--Question-->
       <div class="form-horizontal col-sm-1 ">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="w3-container w3-cell w3-mobile">
                                <p><h4>
                                <bean:write  name="accountDetailsForm" property="totalQuestion" ></bean:write>
                                </h4></p>
                                <p>questions</p>
                            </div>
                        </div>
                    </div>
                </div>
<!--nguoidoc-->

                <div class="form-horizontal col-sm-3  ">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="w3-container w3-cell w3-mobile">
                                <p><h4>
                                <bean:write name="accountDetailsForm" property="reputationPoint" ></bean:write>
                                </h4></p>
                                <p>Reputation Point</p>
                            </div>
                        </div>
                    </div>
                </div>


<!--content1-->
<div class="row">

    <div class=" form-horizontal col-sm-7 ">
             
                        
     </div>

    <div class=" form-horizontal col-sm-5 ">
               <span class="glyphicon-icon-map-marker"></span>      
                 <p><bean:write  name="accountDetailsForm" property="location" ></bean:write></p>                 
                 <p><bean:write  name="accountDetailsForm" property="totalView" ></bean:write> profile views</p>
                 <p><bean:write  name="accountDetailsForm" property="lastSeen" ></bean:write></p>
                        
     </div>
</div>
</div>
</html:form>
<!--content2-->
 <hr>
 <h4>Top tags</h4>
<!--tag1-->
<div class="row">
             
        <div class="col-sm-11" >
 
            <div class="row "style="background-color:rgb(220,220,220);color: black">
            <div class="col-sm-2">
                             
                <a>
                <span class="label-info" style="color:white">sql</span>
                <span class="badge" style="background-color:rgb(255,215,0);color:gold">.</span>
                </a>
            </div>

            <div class="col-sm-4">
            
            </div>

            <div class="col-sm-2">
                   <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Scores <h4>37,311</h4> </p>
                            </div>                        
                    </div>
            </div>

             <div class="col-sm-2">
                     <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Posts <h4>26,311</h4> </p>
                            </div>                        
                    </div>
            </div>

            <div class="col-sm-2">
                   <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Posts% <h4>76</h4> </p>
                            </div>                        
                    </div>
            </div>

            </div>
        </div>
       

</div>

<!--tag2-->
<br>
<div class="row">
             
        <div class="col-sm-11" >
 
            <div class="row "style="background-color:rgb(220,220,220);color: black">
            <div class="col-sm-2">
                             
                <a>
                <span class="label-info" style="color:white">java</span>
                <span class="badge" style="background-color:rgb(255,215,0);color:gold">.</span>
                </a>
            </div>

            <div class="col-sm-4">
            
            </div>

            <div class="col-sm-2">
                   <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Scores <h4>100,311</h4> </p>
                            </div>                        
                    </div>
            </div>

             <div class="col-sm-2">
                     <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Posts <h4>22,311</h4> </p>
                            </div>                        
                    </div>
            </div>

            <div class="col-sm-2">
                   <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Posts% <h4>80</h4> </p>
                            </div>                        
                    </div>
            </div>

            </div>
        </div>
       

</div>


<!--tag3-->

<br>
<div class="row">
             
        <div class="col-sm-11" >
 
            <div class="row "style="background-color:rgb(220,220,220);color: black">
            <div class="col-sm-2">
                             
                <a>
                <span class="label-info" style="color:white">css</span>
                <span class="badge" style="background-color:rgb(255,215,0);color:gold">.</span>
                </a>
            </div>

            <div class="col-sm-4">
            
            </div>

            <div class="col-sm-2">
                   <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Scores <h4>35,111</h4> </p>
                            </div>                        
                    </div>
            </div>

             <div class="col-sm-2">
                     <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Posts <h4>30,231</h4> </p>
                            </div>                        
                    </div>
            </div>

            <div class="col-sm-2">
                   <div class="form-group">                     
                            <div class="w3-mobile">
                                <p>Posts% <h4>60</h4> </p>
                            </div>                        
                    </div>
            </div>

            </div>
        </div>
       

</div>
<br>

<!--content3-->
<h4>Top Posts</h4>

<!--post1-->
<hr>       
			<logic:notEmpty name="accountDetailsForm" property="listQuestion">   
			<logic:iterate id="question" name="accountDetailsForm" property="listQuestion">
			<div class="row">
    
		        <bean:define id="quesID" name="question" property="questionID"></bean:define>
		        <div class="w3-container display-block">
		        <html:link action="/question-details?questionID=${quesID}" style="color:#ff00ff;">
			          <bean:write name="question" property="title"/>
				</html:link>
		        </div>
	        
</div>       
</logic:iterate>    
</logic:notEmpty>             

<p style="padding: 10px;"></p>

<!-- end thông tin cá nhân -->
     <!-- footer của trang-->
    <footer style="min-height: 100px;">
        
    </footer>
    <!-- hết footer của trang-->
</body>
</html>