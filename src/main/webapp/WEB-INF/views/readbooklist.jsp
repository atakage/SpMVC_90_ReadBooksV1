<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<style>


* {
	margin:0 auto;
padding:0;
}

body{
	


}

table{
 	border-bottom: none;
	text-align: center;
	width: 50%;
	table-layout: fixed;
	/* float: left; */
	border-collapse: collapse;
	margin-top: 1%;
	margin-left: 25%;
}

td{
padding: 1%;
  /*   width: 10%; */
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}

tr:hover{
	background-color: rgb(242,242,242);
}

#view_readBookDetailTR{
	cursor: pointer;
}


.table_title{

  display: block;
	float: left;
	font-size: x-large;
	margin-top: 15%;
	margin-left: 45%;
}

#login_modal{

	display:none;
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	z-index:5;
	background-color: rgba(0,0,0,0.3);
}



#cancel_login{

	font-size:50px;
	color:white;
	float:right;
	cursor: pointer;

}

</style>




<script>

function readBooktrClick(b_code,b_name,rb_seq){
	
	
	//document.location.href = "${rootPath}/book/update?b_code="+b_code

			
			
			
	$('input[id=top_fixedNav_b_code]').attr('value', b_code)
	$('input[id=top_fixedNav_b_name]').attr('value', b_name)
	$('input[id=rb_seq]').attr('value', rb_seq)

	
	
	
	
	 bookSubButton = document.getElementById('bookSubButton')
	 bookMDButton = document.getElementById('bookMDButton')
	// getSpecifyReadBookListButton = document.getElementById('getSpecifyReadBookListButton')
	 readBookViewButton = document.getElementById('readBookViewButton')

	 bookSubButton.style.visibility = 'visible';
	bookMDButton.style.visibility = 'visible';
	//getSpecifyReadBookListButton.style.visibility = 'visible';
	readBookViewButton.style.visibility = 'visible';

}



$(function(){
	$('#cancel_login').click(function(){

		
		$("#login_modal").css("display", "none")
		
		
		})
})


</script>



<body>

<%@ include file="/WEB-INF/views/include/fixed_top.jsp" %>



<input id="readBookAttr" type="hidden" value="${READBOOKATTR}">
<input id="rb_seq" type="hidden">



<div class="table_title">
<a>독서록 리스트</a>
</div>
<br>

<table border="1">
	<tr>
		
		<th>도서코드</th>
		<th>도서제목</th>
		<th>독서일자</th>
		<th>한줄소감</th>
		<th style="width: 5%;">평점</th>
	</tr>
	
	
	<c:choose>
		
		<c:when test="${empty READBOOKLIST}">
			<tr>
				<td>자료가 없습니다</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="rbookList" items="${READBOOKLIST}" varStatus="status">
					<tr id="view_readBookDetailTR" onclick="readBooktrClick('${rbookList.rb_bcode}','${BOOKNAMELIST[status.index]}', '${rbookList.rb_seq}')">
						<td>${rbookList.rb_bcode}</td>
						<td>${BOOKNAMELIST[status.index]}</td>
						<td>${rbookList.rb_date}</td>
						<td>${rbookList.rb_subject}</td>
						<td>${rbookList.rb_star}</td>
						<td style="display: none;">${rbookList.rb_seq}</td>
					</tr>
			</c:forEach>
		</c:otherwise>
	
	</c:choose>
	
</table>


<div id="login_modal">
	<a id="cancel_login">&times;</a>
	<%@ include file="/WEB-INF/views/include/login.jsp" %>

</div>

</body>
</html>