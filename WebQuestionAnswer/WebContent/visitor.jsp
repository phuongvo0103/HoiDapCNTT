<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
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
  </style>
</head>
<body>
<bean:define name="visitorForm" id="pages" property="page"></bean:define>
    <bean:define name="visitorForm" id="pagestart" property="pageStart"></bean:define>
    <bean:define name="visitorForm" id="pageend" property="pageEnd"></bean:define>
    <bean:define name="visitorForm" id="numpage" property="numPage"></bean:define>
    <bean:define id="ord" name="visitorForm" property="order"></bean:define>
    <bean:define id="types" name="visitorForm" property="type"></bean:define>
    <bean:define id="search" name="visitorForm" property="txtSearch"></bean:define>
    <bean:define id="typesearch" name="visitorForm" property="typeSearch"></bean:define>
    <bean:define id="typepage" name="visitorForm" property="typePage"></bean:define>
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
    <div id="tabs" class="w3-right w3-hide-small">
  		<logic:notEmpty name="visitorForm" property="account">
  		<bean:define id="account" name="visitorForm" property="account"></bean:define>
		<bean:define id="displayName" name="account" property="displayName"></bean:define>
		<html:link action="/danhsachTTCN" styleClass="w3-text-blue"><bean:write name="displayName"/></html:link>
		</logic:notEmpty>
		<logic:notEmpty name="visitorForm" property="account">
		<html:link action="/dangxuat" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng xuất</html:link>
		</logic:notEmpty>
		<logic:empty name="visitorForm" property="account">
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
<header class="w3-display-container w3-content w3-wide "id="home" style="min-height: 50px;">
  <!-- <img class="w3-image w3-grayscale-max" src="img/architect.jpg" alt="Architecture" width="1500" height="500"> 
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>SS</b></span> <span class="w3-hide-small w3-text-light-grey">Technology</span></h1>
  </div>
  -->
</header>

	<!-- Page content -->
   <div class="w3-content w3-padding" style="max-width:1564px;">
<logic:notEqual name="visitorForm" property="postOK" value="0">
<div id="postOKFAIL" class="w3-green" style="color:green;padding:2px;">Đăng thành công</div>
<script type="text/javascript">
function hiddenError()
{
	var doc=document.getElementById("postOKFAIL");
	doc.innerHTML="";
	doc.style="";
}
setTimeout(hiddenError, 3000);
</script>
</logic:notEqual>
 	 <!-- Question Section -->
  	<div class="w3-row"> 
    	<!-- Content left -->
    <html:form action="/visitor" method="post">
    	<div class="w3-col w3-container m8 l9" style="min-height: 850px">
    	<!-- Question Section -->
             
        <div class="w3-container w3-padding-small">
          
          
          <logic:equal name="typepage" value="2">
           <div class="w3-container w3-padding-0" id="projects">
                <h3 class="">Top các câu hỏi</h3>
              </div>  
          <!-- Title -->
          <div class="w3-row w3-border-top w3-border-blue w3-border-bottom">
              <!--Left -->
              <div class="w3-col w3-container w3-center m4 l5">
                  <div class="w3-row w3-padding-12 font-8">
                      <!-- Vote Score -->
                      <div class="w3-col l4 w3-container w3-display-container">
                          <div class="w3-large">
                          <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=1&txtSearch=${search}&page=${pages}&c=1&typeSearch=${typesearch}&typePage=${typepage}" style="font-size:30px;">
                  			<span class="glyphicon glyphicon-sort"></span>
                  			</a>
                          </div>
                        
                      </div>
                      <!-- Answer Score -->
                      <div class="w3-col l4 w3-container w3-display-container">
                          <div class="w3-large">
                          <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=2&txtSearch=${search}&page=${pages}&c=1&typeSearch=${typesearch}&typePage=${typepage}" style="font-size:30px;">
                  			<span class="glyphicon glyphicon-sort"></span>
                  			</a>
                          </div>
                          
                      </div>
                      <!-- Views Score -->
                      <div class="w3-col l4 w3-container w3-display-container">
                          <div class="w3-large">
                          <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=3&txtSearch=${search}&page=${pages}&c=1&typeSearch=${typesearch}&typePage=${typepage}" style="font-size:30px;">
                  			<span class="glyphicon glyphicon-sort"></span>
                  			</a>
                          </div>
                          
                      </div>

                  </div>
              </div>

              <!-- Right -->
              <div class="w3-col w3-container m8 l7 ">
                  <!-- Title -->
                  <div class="w3-container w3-padding-0 w3-right">
                  <p class="w3-margin-top-8 w3-text-blue w3-hover-indigo">
                  <div class="w3-large">
                  <a href="/WebQuestionAnswer/visitor.do?order=${ord}&type=0&txtSearch=${search}&page=${pages}&c=1&typeSearch=${typesearch}&typePage=${typepage}" style="font-size:30px;">
                  <span class="glyphicon glyphicon-sort"></span>
                  </a>
                  </div>
                  </div>
                  
              </div>
          </div>
 			<!-- Questions -->
            
			      <logic:iterate id="question" name="visitorForm" property="listObject">
		          <div class="w3-row w3-border-top w3-border-light-grey w3-border-bottom">
		              <!--Left -->
		              <div class="w3-col w3-container w3-center m4 l5">
		                  <div class="w3-row w3-padding-12 font-8">
		                  
		                      	  <!-- Vote Score -->
			                      <div class="w3-col l4 w3-container w3-display-container">
			                          <div class="w3-large">
			                              <bean:write name="question" format="0" property="totalVote"/>
			                          </div>
			                          <div class="w3-small">Lượt bỏ phiếu</div>
			                      </div>
			                      
			                      <!-- Answer Score -->
			                      <div class="w3-col l4 w3-container w3-display-container">
			                          <div class="w3-large">
			                              <bean:write name="question" format="0" property="totalAnswer" />
			                          </div>
			                          <div class="w3-small">Lượt trả lời</div>
			                      </div>
			                      
			                      <!-- Views Score -->
			                      <div class="w3-col l4 w3-container w3-display-container">
			                          <div class="w3-large">
			                              <bean:write name="question" format="0" property="totalView" />
			                          </div>
			                          <div class="w3-small">Lượt xem</div>
			                      </div>
							 
		                  </div>
		              </div>

		              <!-- Right -->
		              <div class="w3-col w3-container m8 l7 ">
		                  <!-- Title -->
		                  <div class="w3-container w3-padding-0">
		                      <p class="w3-margin-top-8 w3-text-blue w3-hover-light-blue">
		                          <bean:define id="questionID" name="question" property="questionID"></bean:define>
		                          <html:link action="/question-details?questionID=${questionID}">
		                              <bean:write name="question" format="1" property="title" />
		                          </html:link>
		                      </p>
		                  </div>
		                  <!-- Title -->
		                  <div class="w3-container w3-padding-0">
		                      <p class="w3-margin-top-8 w3-text-black">
		                              <bean:write name="question" format="1" property="questionBody" />
		                      </p>
		                  </div>
		                  <div class="w3-container w3-padding-0">
		                      <div class="w3-left tags w3-container w3-padding-0 ">
		                           <bean:define id="tags" name="question" property="listTag"></bean:define>
		                           <logic:iterate id="tag" name="tags">
		                               <bean:define id="tagID" name="tag" property="tagID"></bean:define>
		                               
		                               <html:link action="/tagdetails?tagID=${tagID}" styleClass="w3-green" style="padding:4px;">
		                               		<bean:write name="tag" property="tagName"/>
		                               </html:link>
		                               
		                           </logic:iterate>
		                      </div>
		                      <div class="w3-right">
		                          <p class="w3-small">
		                          	  <span>được đăng vào lúc</span>
		                              <bean:write name="question" format="dd-MM-yyyy" property="creationDate"/>
		                              <span>từ</span>
		                             
		                              <bean:define id="accountID" name="question" property="accountID"></bean:define>
								      <html:link action="/danhsachTTCN?accountID=${accountID}&type=1">								          
								       <bean:write name="question" property="accountName"/>
								      </html:link>
								      
								  </p>
		                      </div>
		                  </div>
		              </div>
		            
		          </div>
		          </logic:iterate>  
		    
	</logic:equal>
	<%--phan account --%>
		<logic:equal name="typepage" value="1">
		 <div class="w3-container w3-padding-0" id="projects">
                <h3 class="">Danh sách thành viên</h3>
              </div>  
		<!-- Title -->
          <div class="w3-row w3-border-top w3-border-blue w3-border-bottom">
              <!--Left -->
              <div class="w3-col w3-container w3-center m4 l5">
                  <div class="w3-row w3-padding-12 font-8">
                       <!-- form tìm kiếm --> 
        
                <div class="container">
                <div class="navbar-header">
                <html:form action="/visitor" method="get">
                 <input type="hidden" name="order" value="1" />
                 <input type="hidden" name="page" value="1" />
                 <input type="hidden" name="type" value="1" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                    <input type="hidden" name="typePage" value="1" />
                <ul class="nav navbar-nav navbar-right">
                                <li style="padding-right: 40px;padding-top: 5px;">
                                <html:text styleId="search"  name="visitorForm" property="txtSearchSub"></html:text><!-- ô nhập thông tin tìm kiếm-->                         
                                </li>
                                 <li style="padding-right: 40px;width:50px;padding-top: 10px;">
                                                       <!-- tùy chọn điều kiện sắp xếp --> 
	       <li style="padding-right: 40px;width:220px;padding-top: 5px;">
	        <html:select name="visitorForm" property="typeSearch" styleClass="w3-select w3-border">
			 <html:option value="0">Tìm theo tên đăng nhập</html:option>
	         <html:option value="1">Tìm theo tên hiển thị</html:option>
	         <html:option value="2">Tìm theo tên email</html:option>
	        </html:select>
	       </li>                                          
                                <li  style="padding-top: 5px;">                            
                                <html:submit property="submit" styleClass="w3-btn w3-large w3-teal"> Tìm kiếm </html:submit>                                
                                </li>
                    </ul>
                   </html:form>                        
                </div>
             </div>
        
<!-- end tìm kiếm -->
                  </div>
              </div>

          </div>
<div class="w3-col w3-container ">
    <!-- User -->
<table>
	<tbody>	
	<logic:iterate name="visitorForm" property="listObject" id="account">
		 <!-- User first -->
		 <bean:define id="accountid" name="account" property="accountID"></bean:define>
		 <html:link action="/user?accountID=${accountid}">
		    <div class="w3-col m2 w3-margin" style="width:150px;height:200px;">
		      <div class="w3-card 15">
		       <div class="w3-card 15">
		        <p align="center"><img src="/WebQuestionAnswer/<bean:write name="account" property="img"></bean:write>" alt="Koala" style="width:64px;height:64px;">
				</p>
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
		  </html:link>
	</logic:iterate>
	</tbody>
	</table>
</div>
		</logic:equal>
		<%--het phan account --%>
		<%--phan tag  --%>
		<logic:equal name="typepage" value="0">
		<!-- Title -->
          <div class="w3-row w3-border-top w3-border-blue w3-border-bottom">
              <!--Left -->
              <div class="w3-col w3-container w3-center m4 l5">
                  <div class="w3-row w3-padding-12 font-8">
 <!-- form tìm kiếm --> 
        
                <div class="container">
                <div class="navbar-header">
                <html:form action="/visitor" method="get">
                <input type="hidden" name="typeSearch" value="0" />
                 <input type="hidden" name="order" value="1" />
                 <input type="hidden" name="page" value="1" />
                 <input type="hidden" name="type" value="2" />
                   <input type="hidden" name="o" value="2" />
                   <input type="hidden" name="c" value="0" />
                    <input type="hidden" name="typePage" value="0" />
                <ul class="nav navbar-nav navbar-right">
                                <li style="padding-right: 40px;padding-top: 5px;">
                                <html:text styleId="search"  name="visitorForm" property="txtSearchSub"></html:text><!-- ô nhập thông tin tìm kiếm-->                         
                                </li>
                                 <li style="padding-right: 40px;width:50px;padding-top: 10px;">
                                   
                                <li  style="padding-top: 5px;">                            
                                <html:submit property="submit" styleClass="w3-btn w3-large w3-teal"> Tìm kiếm </html:submit>                                
                                </li>
                    </ul>
                   </html:form>                        
                </div>
             </div>
        
<!-- end tìm kiếm -->
                      
                  </div>
              </div>

          </div>
          
          <%----------------gdg --%>
    <div class="w3-col w3-container ">   
        <div class="w3-row">
             <div class="w3-container">
                    <h3 class="">Danh sách Tag</h3>
             </div>

       <!-- Bảng danh sách -->
  		<table > <!-- bảng thông tin-->	
            <tbody>
	         <logic:iterate name="visitorForm" property="listObject" id="tag">
	             
	            <div class="w3-col	 w3-container l3 w3-padding-0">
	                  <div class="tags w3-container">       
	                  <bean:define id="tagID" name="tag" property="tagID"></bean:define>           
	                      <html:link action="/tagdetails?tagID=${tagID}">
	                      <bean:write name="tag" property="tagName"/>
	                      </html:link>
	                      <span> x <bean:write name="tag" property="tagPoint"/></span>
	                      <div class="w3-tiny">
	                         <bean:write name="tag" property="descriptionDetails"/>
	                      </div>
	                      <!-- tootaluse Score -->
			                <div class="w3-small">totalUse <bean:write name="tag" format="0" property="totalUse" /></div>
			                    
	                  </div>
	             </div> 
            	
            </logic:iterate>
            </tbody>   
 		 </table>
                        
        </div>
    </div>
          <%--          dgd --%>
			
			</logic:equal>
		<%--het phan tag --%>
		<div class="w3-row"> 
	  	<!-- phân trang -->
		  <div class="w3-right">
		      <p></p>
		    <div class="w3-bar">
		    
		    <logic:notEqual name="pagestart" value="1">
		    <a href="/WebQuestionAnswer/visitor.do?order=${ord }&type=${types}&page=${pages}&o=1&txtSearch=${search}&typeSearch=${typesearch}&c=0&typePage=${typepage}" class="w3-bar-item w3-button glyphicon glyphicon-backward"></a>
		    </logic:notEqual>
		    <logic:iterate name="visitorForm" property="listPage" id="ipage">
		    <logic:equal name="ipage" value="${pages }">
		    <a href="/WebQuestionAnswer/visitor.do?order=${ord }&type=${types}&page=${ipage}&o=2&txtSearch=${search}&typeSearch=${typesearch}&c=0&typePage=${typepage}" class="w3-button w3-green"><bean:write name="ipage"/></a>
		    </logic:equal>
		    <logic:notEqual name="ipage" value="${pages}">
		    <a href="/WebQuestionAnswer/visitor.do?order=${ord }&type=${types}&page=${ipage}&o=2&txtSearch=${search}&typeSearch=${typesearch}&c=0&typePage=${typepage}" class="w3-button"><bean:write name="ipage"/></a>
		    </logic:notEqual>
		    
		    </logic:iterate>
		    <logic:lessThan name="pageend" value="${numpage}">
		    <a href="/WebQuestionAnswer/visitor.do?order=${ord }&type=${types}&page=${pages}&o=0&txtSearch=${search}&typeSearch=${typesearch}&c=0&typePage=${typepage}" class="w3-button glyphicon glyphicon-forward"></a>
		    </logic:lessThan>
		    </div>    
		     
		</div>
		    <!-- hết phân trang -->
	  </div>
        </div>  <%--------cho nay ket thuc tag --%>
    </div>

</html:form>

	    <!-- Content right -->
	    <div class="w3-col m4 l3">
	        <div class="w3-container w3-section">
	              <a href="ask-question.do"><button class="w3-btn w3-teal">Đặt câu hỏi</button></a>
	        </div>
	        <logic:notEmpty name="visitorForm" property="listTagTop">
		        <div class="w3-container w3-section">
		            <h4 style="display: inline-block">Top tags</h4>
		        </div>
		        <div class="tags w3-container w3-padding-8 ">
		        	<logic:iterate id="tag" name="visitorForm" property="listTagTop">
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
	        <logic:notEmpty name="visitorForm" property="listQuestionSam">
	        <div class="w3-container w3-section">
	            <h4 class="">Câu hỏi liên quan</h4>
	        </div>
	         <logic:iterate id="question" name="visitorForm" property="listQuestionSam">
		        <bean:define id="quesID" name="question" property="questionID"></bean:define>
		        <div class="w3-container display-block">
		        <html:link action="/question-details?questionID=${quesID}" style="color:#ff00ff;">
			          <bean:write name="question" property="title"/>
				</html:link>
		        </div>
	        </logic:iterate>
            </logic:notEmpty>
			<logic:notEmpty name="visitorForm" property="listQuestionTop">
	        <div class="w3-container w3-section">
	            <h4 class="">Câu hỏi xem nhiều</h4>
	        </div>
	         <logic:iterate id="question" name="visitorForm" property="listQuestionTop">
		        <bean:define id="quesID" name="question" property="questionID"></bean:define>
		        <div class="w3-container display-block">
		        			<html:link action="/question-details?questionID=${quesID}" style="color:#0000ff;">
			            	<bean:write name="question" property="title"/>
			            	</html:link>
		        </div>
	        </logic:iterate>
            </logic:notEmpty>
    	  </div>
	  </div>
	  
   </div>

<%@include file="footer.jsp"%>

</body>
</html>