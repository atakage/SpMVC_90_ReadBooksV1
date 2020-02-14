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


<script>

$(function(){
	

	$('#login_button').click(function(){
		
	

	if(document.getElementById('login_m_id').value.length < 1 || document.getElementById('login_m_password').value.length < 1){
			
			
			alert('아이디와 비밀번호 입력')
			return false;
			
		}
	
	
	var login_m_id = $('#login_m_id').val()
	var login_m_password = $('#login_m_password').val()
	
	
	
	$.ajax({
		
		
		url: "${rootPath}/member/logincheck", data:{login_m_id, login_m_password}, type:'POST',
		success : function(result){
			
			if(result == 'LOGINFAIL'){
				alert('아이디와 비밀번호를 다시 확인하시오')
				return false;
			}else if(result == 'LOGINOK'){
				alert('로그인 성공')
				document.location.href = "${rootPath}/"
			}
			
		}, error:function(){
			alert('서버 오류')
		}
		
	})
	
	
	
	})
		
})
</script>



<style>



body{
	
	/*width:100%;*/
	
	/*margin: 0 auto 0 auto;*/
	
}


.login_box{

margin: 0 auto 0 auto;
background:  papayawhip;
width: 300px;
border-radius: 6px;
padding: 0px 0px 70px 0px;
border: bisque 4px solid;
margin-top: 15%;


}


#login_m_id{

background:bisque;
border: #ccc 1px solid;
border-bottom: #ccc 2px solid;
padding: 8px;
width: 250px;
color: #AAAAAA;
margin-top: 10px;
font-size: 1em;
border-radius: 4px;
margin-left: 15px;
}

#login_m_password{

border-radius: 4px;
background: bisque;
border: #ccc 1px solid;
padding: 8px;
width: 250px;
font-size: 1em;
margin-left: 15px;
}

#login_button{
	
	background: bisque;
	width: 125px;
	padding-top: 5px;
	padding-bottom: 5px;
	color: black;
	border-radius: 4px;
	border: #E5D7BF 1px solid;
	
	margin-top: 20px;
	margin-bottom:20px;
	margin-left: 16px;
	float:left;
	font-weight: 800;
	font-size: 0.8em;
}

#login_button:hover{
	background:#E5D7BF;
}

#memberInsert_button{

	background: bisque;
	width: 125px;
	padding-top: 5px;
	padding-bottom: 5px;
	color: black;
	border-radius: 4px;
	border: #E5D7BF 1px solid;
	
	margin-top: 20px;
	margin-bottom:20px;
	margin-left: 10px;
	float:left;
	font-weight: 800;
	font-size: 0.8em;

}

#memberInsert_button:hover{
	background:#E5D7BF;
}


</style>

<body>
<div class="login_box">
<input id="login_m_id" placeholder="아이디"><br>
<input id="login_m_password" type="password" placeholder="비밀번호"><br>
<button type="button" id="login_button">로그인</button>
<button type="button" id="memberInsert_button" onclick="document.location.href='${rootPath}/member/insert'">회원가입</button>
</div>



</body>
</html>