<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>


<meta charset="UTF-8">
<title>나의 JSP 홈페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
	
	
	$('#autoCR_b_code_button').click(function(){
		
		
		$.ajax({
			
			
			url:"${rootPath}/book/createcode", type:'GET',
			success:function(result){
				
				$('input[id=b_code]').attr('value', result)
				
			}, error:function(){
				alert('서버 오류')
			}
			
		})
		
	})
	
	
	$('#insert_button').click(function(){
		
		
		if(document.getElementById("b_code").value.length < 1 || document.getElementById("b_name").value.length < 1 ||  document.getElementById("b_auther").value.length < 1){
			
			alert('필수 입력란 확ㅇ니')
			return false;
			
		}
		
		var b_code = $("#b_code").val()
		var b_name = $("#b_name").val()
		
		var b_auther = $("#b_auther").val()
	
		var b_comp = $("#b_comp").val()
		
		var b_year = $("#b_year").val()
		var b_iprice = $("#b_iprice").val()
		
		document.location.href="${rootPath}/book/insertnext?b_code="+ encodeURI(b_code) + "&b_name="+ encodeURI(b_name) +
		"&b_auther="+ encodeURI(b_auther) + "&b_comp="+ encodeURI(b_comp) + "&b_year="+ encodeURI(b_year) + "&b_iprice="+ b_iprice
		
		
	})
	
	
	
	
	
	$('#update_button').click(function(){
		
		
		if(document.getElementById("b_code").value.length < 1 || document.getElementById("b_name").value.length < 1 ||  document.getElementById("b_auther").value.length < 1){
			
			alert('필수 입력란 확ㅇ니')
			return false;
			
		}
		
		var b_code = $("#b_code").val()
		var b_name = $("#b_name").val()
		
		var b_auther = $("#b_auther").val()
	
		var b_comp = $("#b_comp").val()
		
		var b_year = $("#b_year").val()
		var b_iprice = $("#b_iprice").val()
		
		document.location.href="${rootPath}/book/updatenext?b_code="+ encodeURI(b_code) + "&b_name="+ encodeURI(b_name) +
		"&b_auther="+ encodeURI(b_auther) + "&b_comp="+ encodeURI(b_comp) + "&b_year="+ encodeURI(b_year) + "&b_iprice="+ b_iprice
		
		
	})
	
	
	$('#delete_button').click(function(){
		
		
		
		if(confirm('정말 삭제?')){
			
			
			var b_code = $('#b_code').val()
			
			$.ajax({
				
				url: "${rootPath}/book/deletenext", data:{b_code}, type:'POST',
				success : function(result){
					
					if(result < 1){
						alert('삭제 실패')
						document.location.replace("${rootPath}/")
					}else{
						alert('삭제 성공')
						document.location.replace("${rootPath}/")
					}
				},
				error : function(){
					alert('서버 오류')
				}
				
			})
			

		}
		
		
		//return false;
		
		
	})
	
})


</script>




<style>

* {
	
	margin:0;
	padding:0;
}

body{
	
	width:978px;
	margin:auto;

}

#insert_formBox{
	background-color: papayawhip;
	text-align: center;
	margin-top:10%;
}

#insert_title{
	font-size: x-large;
}

#b_name{
	margin-right: 99px;
}

#b_auther{
	    margin-right: 82px;
}

#b_comp{
	    margin-right: 54px;
}

#b_year{
	margin-right: 98px;
}

#b_iprice{
	margin-right: 68px;
}
</style>


</head>

<body>



<c:choose>
	<c:when test="${empty BOOKVO}">
<div id="insert_formBox">
<a id="insert_title">도서 등록</a>	
<br><br>

도서코드(필수):<input id="b_code" readonly="readonly" ><button id="autoCR_b_code_button" >도서코드 자동생성</button></br>
도서명(필수):<input id="b_name" ><br>
저자(필수):<input id="b_auther" ></br>
출판사:<input id="b_comp" ></br>
구입일자:<input type="date" id="b_year" ></br>
구입가격:<input type="number" id="b_iprice" ></br> <!-- 문자 강제입력시 문제 처리해야함 -->

</br>
</br>


<button type="button" id="insert_button">등록</button>
<button type="button" onclick="document.location.href='${rootPath}/'">홈으로</button>
</div>	
	</c:when>
	<c:otherwise>
	
	<div id="insert_formBox">
		<a id="insert_title">도서 수정&삭제</a><br><br>

도서코드(필수):<input id="b_code" readonly="readonly" value="${BOOKVO.b_code}" style="margin-right: 115px;"><br>
도서명(필수):<input id="b_name" value="${BOOKVO.b_name}"></br>
저자(필수):<input id="b_auther" value="${BOOKVO.b_auther}"></br>
출판사:<input id="b_comp" value="${BOOKVO.b_comp}" ></br>
구입일자:<input type="date" id="b_year" value="${BOOKVO.b_year}"></br>
구입가격:<input type="number" id="b_iprice" value="${BOOKVO.b_iprice}"></br> <!-- 문자 강제입력시 문제 처리해야함 -->
</br>
</br>


<button type="button" id="update_button">수정</button>
<button type="button" id="delete_button">삭제</button>
<button type="button" onclick="document.location.href='${rootPath}/'">홈으로</button>
</div>	
	
	
	
	</c:otherwise>

</c:choose>


</body>
</html>