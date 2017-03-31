<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>SE20</title>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/w3.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/w3-theme-black.css" />

  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <link rel="stylesheet" href="css/font-awesome.min.css"/>
  <script src="js/myjs.js"></script>
</head>
<body>

<!-- Navbar (sit on top) -->


<!-- Header -->
<div class="w3-display-container w3-content w3-wide" id="home" style="min-height: 100px;">
  <!-- <img class="w3-image w3-grayscale-max" src="img/architect.jpg" alt="Architecture" width="1500" height="500"> 
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>SS</b></span> <span class="w3-hide-small w3-text-light-grey">Technology</span></h1>
  </div>
  -->
</div>

<!-- Page content -->

<div class="w3-content w3-padding" style="max-width:1564px">

  <!-- Users Section -->
<div class="w3-row"> 
    <!-- Main Content -->
<div class="w3-col w3-container ">
    <!-- User -->
        <div class="w3-container w3-padding-0" id="projects">
            <h3 class="">Danh sách thành viên</h3>
        </div>  
<div class="w3-row">
	<html:form action="/listAccountUser" method ="post">
	<table>
	<tbody>	
	<logic:iterate name="accountForm" property="listAccount" id="account">
		 <!-- User first -->
		    <div class="w3-col m2 w3-margin">
		      <div class="w3-card 15">
		       <div class="w3-card 15">
		        <img src="<bean:write name="account" property="img"></bean:write>" alt="Koala" style="width:100%">
				<div>
				<hr>
			     <p align="center"><bean:write name="account" property="userName"></bean:write></p>
			     <p align="center"><bean:write name="account" property="displayName"></bean:write></p>
			     <div>
			     <p align="center">
			     
			     <bean:write name="account" property="reputationPoint"></bean:write> scores
			     
			     </p>
			     </div>
			     </div>
			   </div>
		      </div>
		     </div>
	</logic:iterate>
	
	
	</tbody>
	</table>
	</html:form>
</div>
        <div class="w3-container w3-padding-small">
            <div class="w3-row w3-border-top w3-border-light-grey w3-border-bottom">
                <div class="w3-bar">
                        <a href="#" class="w3-button">&laquo;</a>
                        <a href="#" class="w3-button">1</a>
                        <a href="#" class="w3-button">2</a>
                        <a href="#" class="w3-button">3</a>
                        <a href="#" class="w3-button">4</a>
                        <a href="#" class="w3-button">5</a>
                        <a href="#" class="w3-button">&raquo;</a>
                </div>
            </div>
        

        </div>
    </div>
</div>
</div>
<!-- Footer -->
<div class="w3-center w3-black w3-padding-16">
  <p>Powered by team20</p>
</div>

</body>
</html>