<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ page import="model.bean.Account"%>

<!DOCTYPE html>
<html>
<title>SE20</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/w3.css" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/w3-theme-black.css" />
  <link rel="stylesheet" href="css/font-awesome.min.css"/>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/myjs.js"></script>
  
 
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
  
		<logic:notEmpty name="tagDetailsForm" property="account">
		<html:link action="/dangxuat" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng xuất</html:link>
		</logic:notEmpty>
		<logic:empty name="tagDetailsForm" property="account">
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


  </div>

</div>
	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide " id="home"
		style="min-height: 100px;">
		<!-- <img class="w3-image w3-grayscale-max" src="img/architect.jpg" alt="Architecture" width="1500" height="500"> 
			  <div class="w3-display-middle w3-margin-top w3-center">
			    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>SS</b></span> <span class="w3-hide-small w3-text-light-grey">Technology</span></h1>
			  </div>
			  -->
	</header>

	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px"></div>

	<!-- Question Section -->
	<div class="w3-row">
		<!-- Content left -->
		<html:form action="/tagdetails" method="post"></html:form>
		<logic:notEmpty name="tagDetailsForm" property="tag">
			<div class="w3-col w3-container m8 l9 ">
				<!-- Question Section -->

				<bean:define id="tag" name="tagDetailsForm" property="tag"></bean:define>
					<bean:define id="tagID" name="tag" property="tagID"></bean:define>
					<div class="w3-container w3-padding-0 w3-border-bottom w3-border-blue">
						<html:link action="/tagdetails?tagID=${tagID}">
							<h3>
								<bean:write name="tag" property="tagName" />
							</h3>
						</html:link>
					</div>
					<div class="w3-container w3-padding-small">
						<!-- Question -->
						<div
							class="w3-row">
							<!--Left -->
							<div class="w3-col w3-container w3-center m2 l2 w3-border">
								<div class="w3-row font-8">
									<!-- Vote Score -->
									<div class="w3-col w3-container w3-display-container">
										<div class="w3-large">
											<bean:write name="tag" property="tagPoint" />
										</div>
										<div class="w3-small">
											Point
										</div>
									</div>
								</div>

							</div>

							<!-- Right -->
							<div class="w3-col w3-container m10 l10 ">
								<!-- Title -->
								<div class="w3-container w3-padding-8">
									<p class="w3-margin-top-8 ">
										<bean:write name="tag" property="descriptionDetails" />
									</p>
								</div>
								<div class="w3-container w3-padding-8">
									
									<div class="w3-right">
									
									
										<div class="w3-container w3-padding-8">
										
										<p class="w3-small">
											Ngày đăng:<bean:write name="tag" format="dd-MM-yyyy" property="creationDate" />
										</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					
				

			</div>

			<!-- Content right -->
	    <div class="w3-col m4 l3">
	        <div class="w3-container w3-section">
	              <a href="ask-question.do"><button class="w3-btn w3-teal">Đặt câu hỏi</button></a>
	        </div>
	        <logic:notEmpty name="tagDetailsForm" property="listTagTop">
		        <div class="w3-container w3-section">
		            <h4 style="display: inline-block">Top tags</h4>
		        </div>
		        <div class="tags w3-container w3-padding-8 ">
		        	<logic:iterate id="tags" name="tagDetailsForm" property="listTagTop">
		        	<bean:define id="stagID" name="tags" property="tagID"></bean:define>
		        		<html:link action="/tagdetails?tagID=${stagID}">
		            		<bean:write name="tags" property="tagName"/>
		            	</html:link>
		            </logic:iterate>
		        </div>
	        </logic:notEmpty>
	        <div class="w3-container w3-section">
	            <h4 style="display: inline-block">Tags theo dõi</h4>
	            <a class="w3-margin-left">edit</a>
	        </div>
	        <div class="tags w3-container w3-padding-8 ">
	            <a>c#</a>
	            <a>asp.net</a>
	            <a>.net</a>
	            <a>dom</a>
	        </div>
	
	        <div class="w3-container w3-section">
	            <h4 class="">Tags bỏ qua</h4>
	        </div>
	         <div class="tags w3-container w3-padding-8 ">
	            <a>vb.net</a>
	            <a>php</a>
	        </div>
	        <logic:notEmpty name="tagDetailsForm" property="listQuestionSam">
	        <div class="w3-container w3-section">
	            <h4 class="">Câu hỏi liên quan</h4>
	        </div>
	         <logic:iterate id="ques" name="tagDetailsForm" property="listQuestionSam">
		        <bean:define id="quesID" name="ques" property="questionID"></bean:define>
		        <div class="w3-container display-block">
		        <html:link action="/question-details?questionID=${quesID}">
			          <bean:write name="ques" property="title"/>
				</html:link>
		        </div>
	        </logic:iterate>
            </logic:notEmpty>
			<logic:notEmpty name="tagDetailsForm" property="listQuestionTop">
	        <div class="w3-container w3-section">
	            <h4 class="">Câu hỏi xem nhiều</h4>
	        </div>
	         <logic:iterate id="ques" name="tagDetailsForm" property="listQuestionTop">
		        <bean:define id="quesID" name="ques" property="questionID"></bean:define>
		        <div class="w3-container display-block">
		        			<html:link action="/question-details?questionID=${quesID}">
			            	<bean:write name="ques" property="title"/>
			            	</html:link>
		        </div>
	        </logic:iterate>
            </logic:notEmpty>
    	  </div>
		</logic:notEmpty>
		<logic:empty name="tagDetailsForm" property="tag">
			<div class="w3-center">
			Không tồn tại tag này
			</div>
		</logic:empty>
	</div>
	
	<footer class="w3-center w3-black w3-padding-16"
		style="margin-top: 100px;">
		<p>Powered by team20</p>
	</footer>
</body>
</html>