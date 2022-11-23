<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.1.12.4.min.js"></script>

<script type="text/javascript">
	
//id체크여부 값 저장

$(document).ready(function(){

	$("#idcked").on("click",function(){
		console.log("idCheck")
		
		var userId = $("#memId").val();
		var pattern2 = /[a-z]/;
		
		console.log(userId)
		
		// Id 입력 안햇을시 경고문구 6글자 이상
		if(userId == null || userId == ''){
			alert("아이디를 입력해 주세요.")
			return false;
		}else if(userId.length <= 5){
			alert("6글자 이상 입력해 주세요.")
			return false;
		}else if(!pattern2.test(userId)){
			alert("영문으로 입력해 주세요.")
			return false;
		}
		
		
	 	$.ajax({
			url : "${pageContext.request.contextPath}/user/userIdCheck.do",		
			type : "post",
			data : JSON.stringify(userId),
			contentType : "application/json",
			dataType : "json",
			success : function(result) {
				console.log(result);
				if(result == 0){
					$("#result").text("사용할 수 있는 아이디 입니다.")
				}else {
					$("#result").text("사용중인 아이디 입니다.")
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
	///////////////////////////////////////저장//////////////////////////////////////
	
	$("#saveBtn").on("click",function(){
		
		var userId = $("#memId").val();
		
		var pwd = $("#pwd").val();
		var name = $("#memName").val();
		
		
		var userVO = {
			userId: userId,
			pwd : pwd,
			name : name
			
			
		}
		
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*<>*]/;
		var pattern4 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(pwd.length <= 5 || pwd.length > 12){
			alert("비밀번호를 6 ~ 12글자로 입력해 주세요.");
		}else if(!pattern1.test(pwd)||!pattern2.test(pwd)||!pattern3.test(pwd)){
			alert("특수기호, 영문, 숫자를 조합해 주세요.");
		}else{
			$.ajax({
				url : "${pageContext.request.contextPath}/user/userInsertPro.do",		
				type : "post",
				data : JSON.stringify(userVO),
				contentType : "application/json",
				dataType : "json",
				success : function(result) {
					
					alert("가입 되었습니다.");
					window.location.href = "${pageContext.request.contextPath}/user/loginForm.do"
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
				
			});
		}
		
		
		
	});
	
});



</script>


<div class="container" style="margin-top: 50px">
	<form class="form-horizontal" id="sendForm" action="${pageContext.request.contextPath}/user/userInsertPro.do">
	
	
	    <div class="form-group">
	      <label class="col-sm-2 control-label">ID</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="memId" name="userId" type="text" value="" title="ID">
	      </div>

	      <div class="container">
	      	<button type="button" id="idcked" class="btn btn-default" style="display: block;" >ID 중복 체크</button>
	      </div>
	    </div>
	    
	    <div>
			<span id="result" style="margin-left: 200px;"></span>
		</div>
			
	    <div class="form-group">
	      <label for="disabledInput " class="col-sm-2 control-label">패스워드</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="pwd" name="pwd" type="password" title="패스워드" >
	      </div>
	      <label for="disabledInput " class="col-sm-2 control-label">패스워드 확인</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="pwdCh" name="" type="password" title="패스워드 확인">
	      </div>
	    </div>

		

	    <div class="form-group">
	      <label for="disabledInput" class="col-sm-2 control-label">이름</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="memName" name="name" type="text" value="" title="이름" >
	      </div>
	    </div>


	    <div class="col-md-offset-4">
			<button type="button" id="saveBtn"class="btn btn-primary">저장</button>
			<button type="button" id="#"class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/login/login.do'">취소</button>
	    </div>
	</form>
</div>


