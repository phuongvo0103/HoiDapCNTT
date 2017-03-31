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
  
		<logic:notEmpty name="displayQuestionDetailsForm" property="account">
		<html:link action="/dangxuat" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng xuất</html:link>
		</logic:notEmpty>
		<logic:empty name="displayQuestionDetailsForm" property="account">
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
	<header class="w3-display-container w3-content w3-wide " id="home" style="min-height: 100px;">
		
	</header>

	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px"></div>
<logic:notEqual name="displayQuestionDetailsForm" property="voteOK" value="0">
<div id="voteOKFAIL" class="w3-red" style="color:red;">Không thể vote</div>
<script type="text/javascript">
function hiddenError()
{
	var doc=document.getElementById("voteOKFAIL");
	doc.innerHTML="";
	doc.style="";
}
setTimeout(hiddenError, 3000);
</script>
</logic:notEqual>
	<!-- Question Section -->
	<div class="w3-row">
		<!-- Content left -->
		<html:form action="/question-details" method="post"></html:form>
		<logic:notEmpty name="displayQuestionDetailsForm" property="question">
			<div class="w3-col w3-container m8 l9 ">
				<!-- Question Section -->
				
				<bean:define id="question" name="displayQuestionDetailsForm" property="question"></bean:define>
				<bean:define id="isLock" name="question" property="isLock"></bean:define>
					<bean:define id="questionID" name="question" property="questionID"></bean:define>
					<div class="w3-container w3-padding-0 w3-border-bottom w3-border-blue">
						<html:link action="/question-details?questionID=${questionID}">
							<h3>
								<bean:write name="question" property="title" />
							</h3>
						</html:link>
					</div>
					<div class="w3-container w3-padding-small">
						<!-- Question -->
						<div
							class="w3-row">
							<!--Left -->
							<div class="w3-col w3-container w3-center m2 l2">
								<div class="w3-row font-8">
									<!-- Vote Score -->
									
						
									<div class="w3-col w3-container w3-display-container">
									
										<div class="w3-large w3-padding-8">
										
										<html:form action="/question-details" method="post">
										<html:hidden property="vote" value="1" />
										<html:hidden property="type" value="0" />
										<html:hidden property="questionID" value="${questionID}" />
										<logic:equal name="question" property="vote" value="1">
											<button type="submit" class="btn btn-default w3-green" aria-label="Left Align">
												<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
											</button>
											</logic:equal>
											<logic:notEqual name="question" property="vote" value="1">
												<button type="submit" class="btn btn-default" aria-label="Left Align">
												<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
											</button>
											</logic:notEqual>
										</html:form>
										</div>
										<div class="w3-large">
											<bean:write name="question" property="totalVote" />
										</div>
										
										<div class="w3-large w3-padding-8">
										<html:form action="/question-details" method="post">
										<html:hidden property="vote" value="-1" />
										<html:hidden property="type" value="0" />
										<html:hidden property="questionID" value="${questionID}" />
											<logic:equal name="question" property="vote" value="-1">
											<button type="submit" class="btn btn-default w3-red" aria-label="Left Align">
												<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
											</button>
											</logic:equal>
											<logic:notEqual name="question" property="vote" value="-1">
												<button type="submit" class="btn btn-default" aria-label="Left Align">
												<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
											</button>
											</logic:notEqual>
											</html:form>
										</div>
									</div>
								</div>
								<div class="w3-row font-8">
									<!-- Views Score -->
									<div class="w3-col w3-container w3-display-container">
										<logic:notEqual name="isLock" value="0">
										<div class="w3-text-red">Đã khóa</div>
										</logic:notEqual>
									</div>
								</div>

							</div>

							<!-- Right -->
							<div class="w3-col w3-container m10 l10 ">
								<!-- Title -->
								<div class="w3-container w3-padding-8">
									<p class="w3-margin-top-8 ">
										<bean:write name="question" property="questionBody" />
									</p>
								</div>
								<div class="w3-container w3-padding-8">
									<div class="w3-left tags w3-container w3-padding-0 ">
										<bean:define id="listTag" name="question" property="listTag"></bean:define>
										<logic:iterate id="tag" name="listTag">
											<bean:define id="tagID" name="tag" property="tagID"></bean:define>
											<html:link action="/tagdetails?tagID=${tagID}"
												style="text-decoration:none">
												<bean:write name="tag" property="tagName" />
											</html:link>
										</logic:iterate>

									</div>
									<div class="w3-right">
									<bean:define id="quesAccountID" name="question" property="accountID"></bean:define>
									
										<div class="w3-container w3-padding-8">
										<html:link action="/danhsachTTCN?accountID=${quesAccountID}&type=1">
										<p class="w3-small">
											<bean:write name="question" property="accountName" />
										</p>
										</html:link>
										<p class="w3-small">
											Ngày đăng:<bean:write name="question" format="dd-MM-yyyy" property="creationDate" />
										</p>
										<p class="w3-small">
											Lượt view:<bean:write name="question" format="0" property="totalView" />
										</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<logic:notEmpty name="question" property="listAnswer">
						<!-- Answers -->
						<div class="w3-container w3-padding-0">
							<h4>Câu trả lời</h4>
						</div>
						
						<logic:iterate id="answer" name="question" property="listAnswer">

							<div class="w3-container w3-padding-small">
								<!-- Answer -->
								<div
									class="w3-row w3-border-top w3-border-light-grey w3-border-bottom">
									<!--Left -->
									<div class="w3-col w3-container w3-center m2 l2">
										<div class="w3-row font-8">
											<!-- Vote Score -->
											<bean:define id="answerID" name="answer" property="answerID"></bean:define>
											<div class="w3-col w3-container w3-display-container">
												<div class="w3-large w3-padding-8">
												<html:form action="/question-details" method="post">
												<html:hidden property="vote" value="1" />
												<html:hidden property="type" value="1" />
												<html:hidden property="questionID" value="${questionID}" />
												<html:hidden property="answerID" value="${answerID}" />
													
													<logic:equal name="answer" property="vote" value="1">
														<button type="submit" class="btn btn-default w3-green" aria-label="Left Align">
															<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
														</button>
													</logic:equal>
													<logic:notEqual name="answer" property="vote" value="1">
														<button type="submit" class="btn btn-default" aria-label="Left Align">
														<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
													</button>
													</logic:notEqual>
												</html:form>
												</div>
												<div class="w3-large">
													<bean:write name="answer" property="totalVote" />
												</div>
												<div class="w3-large w3-padding-8 ">
													<html:form action="/question-details" method="post">
													<html:hidden property="vote" value="-1" />
													<html:hidden property="type" value="1" />
													<html:hidden property="questionID" value="${questionID}" />
													<html:hidden property="answerID" value="${answerID}" />
												
													<logic:equal name="answer" property="vote" value="-1">
														<button type="submit" class="btn btn-default w3-red" aria-label="Left Align">
															<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
														</button>
													</logic:equal>
													<logic:notEqual name="answer" property="vote" value="-1">
														<button type="submit" class="btn btn-default" aria-label="Left Align">
														<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
													</button>
													</logic:notEqual>
													</html:form>
												</div>
											</div>
										</div>
										<div class="w3-row font-8">
											<!-- Views Score -->
											<div class="w3-col w3-container w3-display-container">
												<div class="w3-small">Favorite</div>
											</div>
										</div>

									</div>

									<!-- Right -->
									<bean:define id="accAnswerID" name="answer" property="accountID"></bean:define>
									<div class="w3-col w3-container m10 l10  ">
										<!-- Title -->
										<div class="w3-container w3-padding-8">
											<p class="w3-margin-top-8">
												<bean:write name="answer" property="answerBody" />
											</p>
										</div>
										<div class="w3-right">
										<html:link action="/danhsachTTCN?accountID=${accAnswerID}&type=1">
											<p class="w3-small">
												<bean:write name="answer" property="accountName" />
											</p>
											</html:link>
											<p class="w3-small">
												Đăng ngày:<bean:write name="answer" format="dd-MM-yyyy" property="creationDate" />
											</p>
										</div>
									</div>
								</div>
								<!--  End answer -->
							</div>
							<!--  End answers -->
						</logic:iterate>
					</logic:notEmpty>
				

			</div>

			<!-- Content right -->
	    <div class="w3-col m4 l3">
	        <div class="w3-container w3-section">
	              <a href="ask-question.do"><button class="w3-btn w3-teal">Đặt câu hỏi</button></a>
	        </div>
	        <logic:notEmpty name="displayQuestionDetailsForm" property="listTagTop">
		        <div class="w3-container w3-section">
		            <h4 style="display: inline-block">Top tags</h4>
		        </div>
		        <div class="tags w3-container w3-padding-8 ">
		        	<logic:iterate id="tag" name="displayQuestionDetailsForm" property="listTagTop">
		        	<bean:define id="tagID" name="tag" property="tagID"></bean:define>
		            	<html:link action="/tagdetails?tagID=${tagID}" styleClass="w3-purple" style="padding:4px;">
		            	<bean:write name="tag" property="tagName"/>
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
	        <logic:notEmpty name="displayQuestionDetailsForm" property="listQuestionSam">
	        <div class="w3-container w3-section">
	            <h4 class="">Câu hỏi liên quan</h4>
	        </div>
	         <logic:iterate id="ques" name="displayQuestionDetailsForm" property="listQuestionSam">
		        <bean:define id="quesID" name="ques" property="questionID"></bean:define>
		        <div class="w3-container display-block">
		        <html:link action="/question-details?questionID=${quesID}">
			          <bean:write name="ques" property="title"/>
				</html:link>
		        </div>
	        </logic:iterate>
            </logic:notEmpty>
			<logic:notEmpty name="displayQuestionDetailsForm" property="listQuestionTop">
	        <div class="w3-container w3-section">
	            <h4 class="">Câu hỏi xem nhiều</h4>
	        </div>
	         <logic:iterate id="ques" name="displayQuestionDetailsForm" property="listQuestionTop">
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
		<logic:empty name="displayQuestionDetailsForm" property="question">
			<div class="w3-center">
			<bean:write name="displayQuestionDetailsForm" property="error"/>
			</div>
		</logic:empty>
	</div>
	<logic:equal name="isLock" value="0">
		<logic:notEmpty name="displayQuestionDetailsForm" property="account">
			<div class="w3-row" style="padding-left: 100px;">
			<html:form action="/question-details" method="post">
			<html:hidden property="type" value="12321" />
			<html:hidden property="questionID" value="${questionID}" />
				<label for="answerBody" style="display: block;">Nội dung câu trả lời:</label>
				<p><textarea name="answerBody" rows="10" cols="100"></textarea></p>
				<input type="submit" name="submit" value="Trả lời" class="w3-btn w3-teal">
			</html:form>
		</div>			
		</logic:notEmpty>
	</logic:equal>
	<footer class="w3-center w3-black w3-padding-16"
		style="margin-top: 100px;">
		<p>Powered by team20</p>
	</footer>
</body>
</html>