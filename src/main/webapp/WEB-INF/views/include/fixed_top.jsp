<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
    <!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>나의 JSP 홈페이지</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
.top_fixedNav{
	display:block;
	position: fixed;
	float: left;
	width: 100%;
	   background-color: rgba(255,239,213, 0.9);
	z-index: 2;
}

#show_bCode{
	margin-left: 12px;
}

#show_bName{
	margin-left:44px;
}

.btn:focus{
	box-shadow: 0 0 0 0;
}

.btn-primary{

	background-color: bisque;
	color:black;
	border: none;
}

.btn-primary:hover{

	background-color: #E5D7BF;
	border: none;
	border-color: black;
}

 .btn-primary:focus {
 background-color: bisque;
	color:black;
	border: none;
 }

.btn-primary:active{
	background-color: bisque;
	color:black;
	border: none;

}




.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle {
    background-color: bisque;
	color:black;
	border: none;
}





#login_window_button{
	margin-left:80%;
}

#logout_button{
	margin-left:79%;
}
 
 
#searchVal, #search_button{
	float: right;
}
</style>



<script>

$(function(){




$('#insert_book_button').click(function(){
		
		document.location.href="${rootPath}/book/insert"
		
	})

	


	$('#login_window_button').click(function(){




		// document.location.href="${rootPath}/member/login"
		
		$('#login_modal').css('display', 'block')
		
		})


	
	
	
	
	$('#insert_member_button').click(function(){
		
		
		document.location.href="${rootPath}/member/insert"
		
		
	})
	
	
	
	$('#bookMDButton').click(function(){


		if($('#readBookAttr').val() != 'READBOOKATTR'){		// 현재 페이지가 도서인지 독서록인지?

		
		var b_code = $('#top_fixedNav_b_code').val()
		
		
		
		document.location.href="${rootPath}/book/update?b_code="+b_code


		}else{

			

			if($('#memberVO').val().length < 1){

				alert('로그인이 필요합니다')
				document.location.href="${rootPath}/member/login"
				return false;
				}

			
			var rb_bcode = $('#top_fixedNav_b_code').val()
			
			
			var input_rb_seq = $('#rb_seq').val()
			/*
			if (input_rb_seq != $('#rb_seq').val()){

				// 리스트에 있는 seq 소스 노출 문제 

				alert('해당 독서록의 SEQ가 아닙니다')
				return false;

				}
			*/
			
			//로그인확인 -> seq번호 확인뒤 seq가지고 업뎃삭제페이지로 
			document.location.href="${rootPath}/readbook/update?rb_seq="+ input_rb_seq

		}
		
	})




	$('#insert_readbook_button').click(function(){


		if($('#memberVO').val().length < 1){

			alert('로그인이 필요합니다')
			document.location.href="${rootPath}/member/login"
			return false;
			}
		
		
		document.location.href="${rootPath}/readbook/insert"
		
		
	})


	$('#logout_button').click(function(){

		var date = new Date()
		var dateVal =  date.getFullYear()
		dateVal += '-'+ date.getMonth()+1
		dateVal += '-'+ date.getDate()

		
		
		
		$.ajax({

		

			url: "${rootPath}/member/logout", data: {dateVal}, type:"POST",
			success : function(result){

				
					alert('로그아웃 날찌:' + dateVal)
					document.location.href = document.location.href
				
				
				}, error:function(){

					alert('서버 오류')
					
					}


			
			})

	})





	$('#readBookViewButton').click(function(){
		
		
				var rb_seq = $('#rb_seq').val()
				var rb_bname = $('#top_fixedNav_b_name').val()
				
				let status = "width=630, height=630"
			//	document.location.href="${rootPath}/readbook/view?rb_seq=" + rb_seq
				window.open('${rootPath}/readbook/view?rb_seq='+rb_seq+'&rb_bname='+rb_bname , '_blank', status )			
						
				
		
		})



	$('#search_button').click(function(){

	

			var searchVal = $('#searchVal').val()


			if($('#readBookAttr').val() != 'READBOOKATTR'){		// 현재 페이지가 도서인지 독서록인지?

				
				document.location.href="${rootPath}/book/search?searchVal="+searchVal


				}else{
					
					var optionVal = $('#optionVal').val()
					
					var searchVal = $('#searchVal').val()

					document.location.href="${rootPath}/readbook/search?optionVal="+optionVal+"&searchVal="+searchVal


					}
			
		})



	
	
	
	
	
})

</script>


<input id="memberVO" value="${MEMBERVO.m_id}" type="hidden">



<body>



<div  class="top_fixedNav">


<a href="${rootPath}/"><strong>도서 리스트</strong></a>|
<a href="${rootPath}/readbook/list"><strong>독서록 리스트</strong></a>

<c:choose>
	<c:when test="${empty MEMBERVO }">
<!-- 	ID<input id="login_m_id">  
	비밀번호<input id="login_m_password" type="password"> -->
	
	<button id="login_window_button" class="btn">로그인</button>
	<button id="insert_member_button" class="btn">회원가입</button>
	
	<br><br>
	</c:when>
<c:otherwise>	
	
	<button id="logout_button" type="button" class="btn">로그아웃</button>
	<button id="insert_member_button" class="btn">회원가입</button>
	<div id="show_id"><b>${MEMBERVO.m_id}</b>님 환영합니다</div>
</c:otherwise>
</c:choose>





<button type="button" id="insert_book_button" class="btn btn-primary">도서 등록</button>


<button type="button" id="insert_readbook_button" class="btn btn-primary">독서록 등록</button>
<br>
<div class="top_fixedNav_bookDetail">

<div id="show_bCode">
도서코드<input id="top_fixedNav_b_code" readonly="readonly" placeholder="리스트를 클릭...">
</div>
<div id="show_bName">
제목<input id="top_fixedNav_b_name" readonly="readonly" placeholder="리스트를 클릭...">
</div>
 <a id="bookSubButton" style="visibility: hidden"></a>
<button id="bookMDButton" type="button" style="visibility: hidden" class="btn btn-primary">수정삭제</button>
<button id="readBookViewButton" type="button" style="visibility: hidden" class="btn btn-primary">내용보기</button>

<c:if test="${SEARCHINCLUDE == 'BOOKLIST'}">
<button id="search_button" type="button" class="btn btn-primary">검색</button>
<input id="searchVal" placeholder="도서명으로 검색">
</c:if>

<c:if test="${SEARCHINCLUDE == 'READBOOKLIST'}">

<button id="search_button" type="button" class="btn btn-primary">검색</button>
<input id="searchVal" maxlength="10" placeholder="10자 이하로 입력">
<select style="float: right;">
	<option id="optionVal" value="RB_SUBJECT">한줄소감</option>
	<option id="optionVal" value="B_NAME">도서명</option>
</select>
</c:if>
</div>


</div>
</body>
</html>