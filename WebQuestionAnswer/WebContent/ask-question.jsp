<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<title>SE20</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/w3-theme-black.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/custom-tag-editor.css" />
<link rel="stylesheet" href="css/jquery.tag-editor.css" />
    <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<!-- Editor -->
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
a{
cursor:pointer;
}
  </style>
<!-- Editor -->
	<script src="js/myjs.js"></script>
	<!-- Code mirror -->
	<link rel="stylesheet" href="css/codemirror.css">
	<script src="js/codemirror.js"></script>
	<script src="js/matchbrackets.js"></script>
	<link rel="stylesheet" href="css/show-hint.css">
	<link rel="stylesheet" href="css/all-hallow-eve.css">
	<script src="js/show-hint.js"></script>
	<script src="js/clike.js"></script>
	<script type="text/javascript">
	var xhttp;
	function initTransfer()
	{
	    if(xhttp==null||xhttp.readyState==0){
	    if(window.XMLHttpRequest){
	        xhttp=new XMLHttpRequest();
	        xhttp.onreadystatechange=function(){
	            callback(xhttp);};
	    }else{
	        xhttp=new ActiveXObject("Microsoft.XMLHTTP");
	        xhttp.onreadystatechange=function(){
	            callback(xhttp);};
	        }
	    }
	}
	function callback(xhttpRequest){
	    if(xhttpRequest.readyState==4&&xhttpRequest.status==200){
	        var s=decode(xhttpRequest.responseText);
	        var obj = JSON.parse(s);
	        var doc=document.getElementById("searchView");
	        while (doc.hasChildNodes()) {
	            doc.removeChild(doc.lastChild);
	        }
	        if(obj!=null)
	        {
	        	var divtong=document.createElement("h3");
	        	divtong.innerHTML="Câu hỏi liên quan";
	        	doc.appendChild(divtong);
	        	for (i in obj) {
	        		var div=document.createElement("div");
		        	var taga = document.createElement("a");
			        taga.href="/WebQuestionAnswer/question-details.do?questionID="+obj[i].questionID;
			        var ss=obj[i].title;
			        ss=ss.replace(/\+/g, " ");
			        taga.innerHTML=ss;
			        div.appendChild(taga);
			        doc.appendChild(div);
	        	}
	        	
	        }
	        
	        
	    }
	}
	function send(value,url,method){
	    initTransfer();
	    if(xhttp!=null){
	        
	            xhttp.open(method,url,true);
	            if(method=="GET")xhttp.send();
	            else if(method=="POST"){
	                xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	                xhttp.send(value);
	            }
	        }
	}
	function encode(value)
	{
		return encodeURIComponent(value);
	}
	function decode(value)
	{
		 return decodeURIComponent(value);
	}
	function searchQuestion(value)
	{
		var s='{"method":"searchQuestion","TxtSearch":"'+value+'","Page":1}';
		return encode(s);
	}
	
	var enter=0;//chưa nhập thông tin
	var changevalue=1;//đã thay đổi
	var svalue="";
	function titleEnterKey(e)
	{
		var obj=document.getElementById("txtTitle");
		var s=obj.value;
		if(s.trim()!="")enter=1;
		else {
			enter=0;
		}
		changevalue=0;
	}
	function losefocus()
	{
		if(changevalue==0 && enter==1)
		{
			var obj=document.getElementById("txtTitle");
			var s=obj.value;
			s=s.trim();
			if(svalue!=s)
			{
				send('requestService='+searchQuestion(s),'/WebQuestionAnswer/service.do','POST');
				changevalue=1;
				svalue=s;
			}
		}
	}
	</script>
</head>
<body>

	<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding-8 w3-card-2">
    <a class="w3-bar-item w3-button w3-hid	e-medium w3-hide-large w3-opennav w3-right w3-hover-black w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
    <a href="/WebQuestionAnswer/visitor.do" class="w3-margin-left w3-bar-item w3-button w3-border-bottom"><b>Simple</b> Solved</a>
    <!-- Float links to the left. Hide them on small screens -->
    <div id="tabs" class="w3-left w3-hide-small">
      <a href="/WebQuestionAnswer/visitor.do?order=1&type=0&txtSearch=&c=0&typeSearch=0&typePage=2&o=2&page=1" class="w3-bar-item w3-button">Câu hỏi</a>
      <a href="/WebQuestionAnswer/visitor.do?order=1&type=0&txtSearch=&c=0&typeSearch=0&typePage=0&o=2&page=1" class="w3-bar-item w3-button">Tags</a>
      <a href="/WebQuestionAnswer/visitor.do?order=1&type=0&txtSearch=&c=0&typeSearch=0&typePage=1&o=2&page=1" class="w3-bar-item w3-button w3-margin-right">Thành viên</a>
    </div>
    <!-- Float to the right-->
    <div class="w3-right w3-hide-small">
  
		<logic:notEmpty name="postQuestionForm" property="account">
		<html:link action="/dangxuat" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng xuất</html:link>
		</logic:notEmpty>
		<logic:empty name="postQuestionForm" property="account">
		<a href="/WebQuestionAnswer/dangNhap.jsp" class="w3-bar-item w3-button w3-blue w3-round-large">Đăng nhập</a>
		</logic:empty>


    </div>
    <!-- Float to the rest-->
    <div class="w3-rest w3-hide-small btn-search w3-padding-small  w3-margin-right" >
      <html:form action="/visitor">
      		<input type="hidden" name="order" value="1" />
                 <input type="hidden" name="page" value="1" />
                 <input type="hidden" name="type" value="0" />
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
      <a href="/WebQuestionAnswer/visitor.do?order=1&type=0&txtSearch=&c=0&typeSearch=0&typePage=2&o=2&page=1" class="w3-bar-item w3-button">Câu hỏi</a>
      <a href="/WebQuestionAnswer/visitor.do?order=1&type=0&txtSearch=&c=0&typeSearch=0&typePage=0&o=2&page=1" class="w3-bar-item w3-button">Tags</a>
      <a href="/WebQuestionAnswer/visitor.do?order=1&type=0&txtSearch=&c=0&typeSearch=0&typePage=1&o=2&page=1" class="w3-bar-item w3-button w3-margin-right">Thành viên</a>

      <html:link action="/dangnhap" styleClass="w3-bar-item w3-button w3-blue w3-round-large">Đăng nhập</html:link>

  </div>

</div>

	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="min-height: 100px;">
		<div style="display: none;">
			<img class="w3-image w3-grayscale-max" src="img/architect.jpg"
				alt="Architecture" width="1500" height="500" style="display: none;">
			<div class="w3-display-middle w3-margin-top w3-center">
				<h1 class="w3-xxlarge w3-text-white">
					<span class="w3-padding w3-black w3-opacity-min"><b>SS</b></span> <span
						class="w3-hide-small w3-text-light-grey">Technology</span>
				</h1>
			</div>
		</div>
	</header>
<div class="w3-row" style="max-width: 1564px">
	<!-- Page content -->
	<div class="w3-content w3-padding" ></div>
	<!-- Post Section -->
	<div class="w3-row">
		<html:form action="/ask-question" method="post" 
			styleClass="w3-container w3-section">
			<!-- Content left -->
			<div class="w3-col w3-container m8 l9" style="min-height: 750px">
				<div class="w3-row">
					<div class="w3-container w3-border-bottom w3-border-blue">
						<h3>Đặt câu hỏi</h3>
					</div>
					<p></p>
					<div>
					   <div class="form-group">
						<label class="w3-label w3-text-black">Tiêu đề (<span style="color:red;">*</span>) :</label>
						<html:text property="title" styleClass="form-control" styleId="txtTitle" onkeydown="titleEnterKey(event);"  onblur="losefocus();"></html:text>
						
						<logic:notEqual name="postQuestionForm" property="errTitle" value="0">
						<div style="color:red;">Tiêu đề không hợp lệ: không được để trống, viết bậy hoặc thiếu văn hóa</div>
						</logic:notEqual>
						
						</div>
						
						<div class="form-group">
						<label class="w3-label w3-text-black">Nội dung (<span style="color:red;">*</span>) :</label>
						<textarea name="questionBody" class="form-control" rows="10"></textarea>
						<logic:notEqual name="postQuestionForm" property="errBody" value="0">
						<div style="color:red;">Nội dung không hợp lệ: không được để trống, viết bậy hoặc thiếu văn hóa</div>
						</logic:notEqual>
						</div>
						<div class="form-group">
						<label class="w3-label w3-text-black">Tags (<span style="color:red;">*</span>) :</label>
						<div style="margin: 0 0 1.2em;">
							<html:text styleId="tags" property="tags" styleClass="w3-input w3-border"></html:text>
						</div>
						<logic:notEqual name="postQuestionForm" property="errTag" value="0">
						<div style="color:red;">Tag không hợp lệ: không được để trống hoặc thiếu văn hóa</div>
						</logic:notEqual>
						</div>
						
						<script src="js/jquery-ui.min.js"></script>
						<script src="js/jquery.caret.min.js"></script>
						<script src="js/jquery.tag-editor.js"></script>
						<script>
							// jQuery UI autocomplete extension - suggest labels may contain HTML tags
							// github.com/scottgonzalez/jquery-ui-extensions/blob/master/src/autocomplete/jquery.ui.autocomplete.html.js
							(function($) {
								var proto = $.ui.autocomplete.prototype, initSource = proto._initSource;
								function filter(array, term) {
									var matcher = new RegExp($.ui.autocomplete
											.escapeRegex(term), "i");
									return $.grep(array, function(value) {
										return matcher.test($("<div>").html(
												value.label || value.value
														|| value).text());
									});
								}
								$.extend(proto,
												{
													_initSource : function() {
														if (this.options.html
																&& $.isArray(this.options.source)) {
															this.source = function(
																	request,
																	response) {
																response(filter(
																		this.options.source,request.term));
															};
														} else {
															initSource.call(this);
														}
													},
													_renderItem : function(ul,
															item) {
														return $("<li></li>").data(
																		"item.autocomplete",
																		item).append(
																		$("<a></a>")[this.options.html ? "html"
																				: "text"]
																				(item.label)).appendTo(ul);
													}
												});
							})(jQuery);

							$(function() {
								$('#tags')
										.tagEditor(
												{
													maxLength:25,
													autocomplete : {
														delay : 0,
														position : {
															collision : 'flip'
														},
														source : [ 'Asp',
																'BASIC', 'C',
																'C++', 'CSS',
																'Clojure',
																'COBOL',
																'ColdFusion',
																'Erlang',
																'Fortran',
																'Groovy',
																'Haskell',
																'HTML', 'Java',
																'JavaScript',
																'Lisp', 'Perl',
																'PHP',
																'Python',
																'Ruby',
																'Scala',
																'Scheme' ]
													},
													forceLowercase : true,
													delimiter : ', ', /* space and comma */
													maxTags : 5,
													placeholder : 'Nhập tag của câu hỏi ...'
												});

							});
						</script>
						<br>
						<html:submit styleClass="w3-btn w3-teal" value="Đăng bài" property="submit"></html:submit>
						<a href="/WebQuestionAnswer/visitor.do" class="btn w3-blue">Hủy</a>
					</div>
					<logic:notEqual name="postQuestionForm" property="postFail" value="0">
						<div style="color:red;">Đăng không thành công</div>
					</logic:notEqual>
				</div>
			</div>

			<!-- Content right -->
			<div class="w3-col m4 l3 w3-container" id="searchView">
				
			</div>
		</html:form>

	</div>
</div>

	<!-- Footer -->

	<footer class="w3-center w3-black w3-padding-16">
		<p>Powered by team20</p>
	</footer>


</body>
</html>