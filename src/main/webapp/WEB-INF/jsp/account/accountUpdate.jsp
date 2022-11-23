<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
$(document).ready(function(){

	$("#profitCost").on("change",function(){
		console.log("경후니뱅신")
		
		var category = $("#profitCost option:selected").val();
		console.log(category);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/account/selectCombo.do",		
			type : "post",
			data : JSON.stringify({"category":category}),
			contentType : "application/json",
			dataType : "JSON",
			success : function(value) {
				
				var arrayList = new Array();
				arrayList = value;
				console.log(arrayList)	
				
				
				for(var i=0; i<arrayList.length; i++){
					
					var option = "<option value = '"+arrayList[i].code+"'>"+arrayList[i].comKor+"</option>"
					
					$("#bigGroup").append(option);
					
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});

	
	$("#bigGroup").on("change",function(){
		console.log("경후니뱅신")
		
		var category = $("#bigGroup option:selected").val();
		console.log(category);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/account/selectCombo.do",		
			type : "post",
			data : JSON.stringify({"category":category}),
			contentType : "application/json",
			dataType : "JSON",
			success : function(value) {
				
				var arrayList = new Array();
				arrayList = value;
				console.log(arrayList)	
				
				
				for(var i=0; i<arrayList.length; i++){
					
					var option = "<option value = '"+arrayList[i].code+"'>"+arrayList[i].comKor+"</option>"
					
					$("#middleGroup").append(option);
					
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});

	
	$("#middleGroup").on("change",function(){
		console.log("경후니뱅신")
		
		var category = $("#middleGroup option:selected").val();
		console.log(category);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/account/selectCombo.do",		
			type : "post",
			data : JSON.stringify({"category":category}),
			contentType : "application/json",
			dataType : "JSON",
			success : function(value) {
				
				var arrayList = new Array();
				arrayList = value;
				console.log(arrayList)	
				
				
				for(var i=0; i<arrayList.length; i++){
					
					var option = "<option value = '"+arrayList[i].code+"'>"+arrayList[i].comKor+"</option>"
					
					$("#smallGroup").append(option);
					
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
	$("#smallGroup").on("change",function(){
		console.log("경후니뱅신")
		
		var category = $("#smallGroup option:selected").val();
		console.log(category);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/account/selectCombo.do",		
			type : "post",
			data : JSON.stringify({"category":category}),
			contentType : "application/json",
			dataType : "JSON",
			success : function(value) {
				
				var arrayList = new Array();
				arrayList = value;
				console.log(arrayList)	
				
				
				for(var i=0; i<arrayList.length; i++){
					
					var option = "<option value = '"+arrayList[i].code+"'>"+arrayList[i].comKor+"</option>"
					
					$("#detailGroup").append(option);
					
				}
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
	});
	
	//등록버튼
	$("#accountUpdate").on("click",function(){
		console.log("accountInsert버튼")
		
		var profitCost = $("#profitCost").val();
		var bigGroup = $("#bigGroup").val();
		var middleGroup = $("#middleGroup").val();
		var smallGroup = $("#smallGroup").val();
		var detailGroup = $("#detailGroup").val();
		var comment = $("#comment").val();
		var transactionMoney = $("#transactionMoney").val();
		var transactionDate = $("#transactionDate").val();
		var writer = '${autherUser.userId}';
		
		console.log("profitCost" + profitCost)
		console.log("bigGroup" + bigGroup)
		console.log("middleGroup" + middleGroup)
		console.log("smallGroup" + smallGroup)
		console.log("detailGroup" + detailGroup)
		console.log("comment" + comment)
		console.log("transactionMoney" + transactionMoney)
		console.log("transactionDate" + transactionDate)
		console.log("writer" + writer)
		
		var accountVo = {
			writer : writer,
			profitCost : profitCost,
			bigGroup : bigGroup,
			middleGroup : middleGroup,
			smallGroup : smallGroup,
			detailGroup : detailGroup,
			comment : comment,
			transactionMoney : transactionMoney,
			transactionDate : transactionDate 
		}
		
			$.ajax({
				url : "${pageContext.request.contextPath}/account/accountInsertPro.do",		
				type : "post",
				data : JSON.stringify(accountVo),
				contentType : "application/json",
				dataType : "JSON",
				success : function(accountVo) {
					alert("Insert성공")
					
				},
				
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
				
			});
		
		
				
			
	});
	
	
});


//////////////////////거래일자//////////////////////
	jQuery(function() {

			jQuery.each(jQuery(".datepicker"), function(i) {
				jQuery(this).datepicker({
							monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월'],
							dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
							dateFormat : 'yy-mm-dd',
							showOn : 'both',
							changeMonth : true,
							changeYear : true,
							buttonImage : './images/egovframework/common/calendar.png',
							buttonImageOnly : true,
							buttonText : "달력",
							yearRange : 'c-50:c+1',
							showButtonPanel : false
						}).css("background-color", "#e1eaf3").attr("readonly", "readonly");
			});
			$("#transactionDate").datepicker();
		}); // END jQuery(function()		
	


</script>

<!-- 비용 START -->
<div class="container" style="margin-top: 50px">
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>



	<div class="col-sm-11" id="costDiv">
		<div>
			<div class="col-sm-11">
			 		<div class="col-sm-12">
				      <div class="col-sm-3">
						<select class="form-control" id="profitCost" name="profitCost"  title="비용">
				        	<option value="">선택</option>
				        	<c:forEach var="list" items="${resultMap}" varStatus="cnt">
					        	<option value="${list.code}">${list.comKor}</option>
				        	</c:forEach>
				        </select>
				      </div>

				      <div class="col-sm-3">
						<select class="form-control" id="bigGroup"  name="bigGroup" title="관">
				        	<option value="">선택</option>
				        </select>
				      </div>

				      <div class="col-sm-3">
						<select class="form-control " id="middleGroup" name="middleGroup"  title="항">
					        	<option value="">해당없음</option>
				        </select>
				      </div>

				      <div class="col-sm-3">
						<select class="form-control "  id="smallGroup" name="smallGroup" title="목">
					        	<option value="">해당없음</option>
				        </select>
				      </div>
			 		</div>

			 		<div class="col-sm-12">  <label for="disabledInput" class="col-sm-12 control-label"> </label></div>
			 		<div class="col-sm-12">
			 			  <div class="col-sm-3">
								<select class="form-control " id="detailGroup" name="detailGroup" title="과">
							        	<option value="">해당없음</option>
						        </select>
					      </div>
				      <div class="col-sm-9">
				      		<input class="form-control " name="comment" id="comment" type="text" value="" placeholder="비용 상세 입력" title="비용 상세">
				      </div>
			 		</div>

				<div class="col-sm-12">  <label for="disabledInput" class="col-sm-12 control-label"> </label></div>
			 		<div class="col-sm-12">
			 		  <label for="disabledInput" class="col-sm-1 control-label"><font size="1px">금액</font></label>
				      <div class="col-sm-3">
				        	<input class="form-control" id="transactionMoney" name="transactionMoney" type="number" value="" title="금액">
				      </div>
			 		  <label for="disabledInput" class="col-sm-1 control-label"  onchange="jQuery()"><font size="1px">거래일자</font></label>
				      <div class="col-sm-3">
				       	 <input class="form-contro col-sm-2" id="transactionDate" name="transactionDate" type="text" value="" style="width: 80%" title="거래일자">
				      </div>
			 		</div>

					<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
					<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
			 </div>
		</div>
	</div>
		
</div>
	<div style="margin-left: 900px;">
			<button type="button" id = "accountUpdate">수정</button>
			<button type="button">취소</button>
	</div>
<!-- 비용 END -->