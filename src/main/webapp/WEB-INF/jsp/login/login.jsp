<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

$(document).ready(function(){
	
	
	
	$("#loginBtn").on("click",function(){
		console.log("loginBtn");
		
		var userId = $("#memId").val();
		var pwd = $("#memPassword").val();
		
		console.log(userId);
		console.log(pwd);
		
		var loginVo = {
			userId : userId,
			pwd : pwd
		}
		
		console.log(loginVo)
		
		$.ajax({
			url : "${pageContext.request.contextPath}/login/loginPro.do",		
			type : "post",
			data : JSON.stringify(loginVo),
			contentType : "application/json",
			dataType : "text",
			success : function(result) {
				console.log(result);
				
				if(result == "ok"){
					window.location.href="${pageContext.request.contextPath}/account/accountList.do"
				}else{
					alert("아이디 비밀번호를 확인해 주세요.");
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
})

</script>


<form id="sendForm" method="post" action="${pageContext.request.contextPath}/login/loginPro.do">

	<input type="hidden" id="platform" name="platform" value="">
	<div class="container col-md-offset-2 col-sm-6" style="margin-top: 100px;">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				<input id="memId" type="text" class="form-control valiChk" name="memId" placeholder="id" title="ID">
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input id="memPassword" type="password" class="form-control valiChk" name="memPassword" placeholder="Password" title="Password">
			</div>
			<br>
			
			
		<br>
		<div class="col-md-offset-4">
			<button type="button" id="loginBtn" class="btn btn-primary">로그인</button>
			<button type="button" id="cancel" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/login/login.do'">취소</button>
			<button type="button" id="#" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/user/userInsert.do'">회원가입</button>
		</div>
	</div>
</form>

