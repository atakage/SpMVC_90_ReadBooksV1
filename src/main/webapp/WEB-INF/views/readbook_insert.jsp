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


	


	
	
	$('#insert_button').click(function(){

			if($('#rb_bcode').val().length < 1 || $('#rb_date').val().length != 10){

					alert('필수 입력란 확인')
					return false;
				}
			
			if( $('#rb_text').val().length > 400){

				alert('긴줄 소감 400자 제한')
				return false;
			}
			
			

			var rb_bcode = $("#rb_bcode option:selected").val()
			var rb_date = $('#rb_date').val()
			var rb_rtime = $('#rb_rtime').val()
			var rb_subject = $('#rb_subject').val()
			var rb_text = $('#rb_text').val().replace(/(?:\r\n|\r|\n)/g, '<br/>') //textarea의 줄바꿈 <br/>치환하여 저장
			var rb_star = $("input:radio[name='rb_star']:checked").val()
			
			
			
			
			
			$.ajax({

				url:"${rootPath}/readbook/insertnext", data:{rb_bcode,rb_date, rb_rtime, rb_subject, rb_text, rb_star}, type:'POST',
				success:function(result){

						if(result == 'FAIL'){
								alert('등록 실패')
								document.location.href="${rootPath}/readbook/list"
							}else{
						alert('독서록 등록 완료')
						document.location.href="${rootPath}/readbook/list"
							}
						
					}, error:function(){

						alert('서버 오류')
						}
				
				})
		
		})




	$('#update_button').click(function(){


		if($('#rb_date').val().length != 10){

			alert('독서일자는 반드시 입력')
			return false;
			}



		var rb_seq = $('#rb_seq').val()
		var rb_bcode = $('#rb_bcode').val()
		var rb_date = $('#rb_date').val()
		var rb_rtime = $('#rb_rtime').val()
		var rb_subject = $('#rb_subject').val()
		var rb_text = $('#rb_text').val().replace(/(?:\r\n|\r|\n)/g, '<br/>') //textarea의 줄바꿈 <br/>치환하여 저장
		var rb_star = $("input:radio[name='rb_star']:checked").val()
		


		$.ajax({

		

			url:"${rootPath}/readbook/updatenext", data:{rb_seq, rb_bcode, rb_date, rb_rtime, rb_subject, rb_text, rb_star}, type:'POST',
			success:function(result){

				if(result == "FAIL"){
						alert('수정 실패')
						document.location.href="${rootPath}/readbook/list"
					}else if(result == "OK"){
						alert('수정 성공')
						document.location.href="${rootPath}/readbook/list"

						}

				},error:function(){
						alert('서버 에러')
					}
			
			})
		
		})





		$('#delete_button').click(function(){


				if(confirm('정말 삭제?')){

					 var rb_seq = $('#rb_seq').val()

					 $.ajax({

						url:"${rootPath}/readbook/delete", data:{rb_seq}, type:'POST',
						success:function(result){

							if(result == 'OK'){
									alert('삭제 완료')
									document.location.href="${rootPath}/readbook/list"
								}else{
									alert('삭제 실패')
									document.location.href="${rootPath}/readbook/list"
									}

							}, error:function(){
									alert('서버 오류')
								}

						 
						 })
						
					}

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

#rb_date{
	margin-right: 103px;
}

#rb_subject{
	    margin-right: 31px;
}

</style>

</head>
<body>



<c:choose>

	<c:when test="${empty READBOOKVO}">
<div id="insert_formBox">	
	<a id="insert_title">독서록 등록</a><br><br>
	
도서코드(필수):<select id="rb_bcode" size="1" >

	<c:forEach items="${BOOKLIST}" var="bookList">
	<option   value="${bookList.b_code}">${bookList.b_code}&nbsp|&nbsp${bookList.b_name}</option>
	</c:forEach>
</select>

<br><br>
독서일자(필수):<input id="rb_date" type="date"><br>
독서시간:<input id="rb_rtime" type="number" value="0">시간<br>
한줄소감:<input id="rb_subject" maxlength="20" placeholder="최대 20자"><br><br>
<p class="textArea">긴줄소감 <br/><textarea id="rb_text"  maxlength="400" placeholder="최대 400자" rows="10" cols="40"></textarea><br>
평점: &nbsp<input id="rb_star" name="rb_star" type="radio" value="1">1
&nbsp<input id="rb_star" name="rb_star"  type="radio" value="2">2
&nbsp<input id="rb_star" name="rb_star" type="radio" value="3">3
&nbsp<input id="rb_star" name="rb_star" type="radio" value="4">4
&nbsp<input id="rb_star" name="rb_star" type="radio" value="5">5<br>

<!--  
<c:set value="${SEQREADBOOK}" var="seq_read_book"/>
<input id="seq_read_book" type="hidden" value="${SEQREADBOOK}"/>
[${seq_read_book}]수정&삭제를 위한 SEQ 번호입니다 꼭 외워두세요-->
<br>
<br>


<button type="button" id="insert_button">등록</button>
<button type="button" onclick="document.location.href='${rootPath}/'">홈으로</button>
</div>	
	</c:when>
	<c:otherwise>


	<div id="insert_formBox">
		<a id="insert_title">독서록 수정&삭제</a><br><br>

SEQ:<input id="rb_seq" value="${READBOOKVO.rb_seq}" readonly="readonly"><br>
도서코드(필수):<input id="rb_bcode" value="${READBOOKVO.rb_bcode}" readonly="readonly" style="margin-right: 77px;"><br>
독서일자(필수):<input id="rb_date" type="date" value="${READBOOKVO.rb_date}"><br>
독서시간:<input id="rb_rtime" type="number" value="${READBOOKVO.rb_rtime}">시간<br>
한줄소감:<input id="rb_subject" maxlength="20" placeholder="최대 20자" value="${READBOOKVO.rb_subject}"><br><br>
<p class="textArea">긴줄소감 <br/><textarea id="rb_text"  maxlength="400" placeholder="최대 400자" rows="10" cols="40">${READBOOKVO.tb_text}</textarea><br>
평점: &nbsp<input id="rb_star" name="rb_star" type="radio" value="1">1
&nbsp<input id="rb_star" name="rb_star"  type="radio" value="2">2
&nbsp<input id="rb_star" name="rb_star" type="radio" value="3">3
&nbsp<input id="rb_star" name="rb_star" type="radio" value="4">4
&nbsp<input id="rb_star" name="rb_star" type="radio" value="5">5<br>


<br>
<br>


<button type="button" id="update_button">수정</button>
<button type="button" id="delete_button">삭제</button>
<button type="button" onclick="document.location.href='${rootPath}/'">홈으로</button>
	
	
	</div>	
	
	</c:otherwise>

</c:choose>

</body>
</html>