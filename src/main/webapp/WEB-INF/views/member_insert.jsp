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
	
	
	
	
	$('#member_insert_button').click(function(){
		
		
		if(document.getElementById('m_id').value.length < 5){
			
			
			alert('아이디 5자 이상 입력')
			return false;
			
		}
		
		
		if(document.getElementById('m_password').value.length < 8){
			
			
			alert('비밀번호 8자 이상 입력')
			return false;
			
		}


		if(document.getElementById('m_passwordRe').value != document.getElementById('m_password').value){

			alert('비밀번호 입력값이 다릅니다')
			return false;
			}
		
		if(document.getElementById('idCheckValue').value != '1'){
			
			
			alert('아이디 체크를 하시오')
			return false;
			
		}
		
		
		
		var m_id = $('#m_id').val()
		var m_password = $('#m_password').val()
		
		
		$.ajax({
			
			url:"${rootPath}/member/insertnext", type:'POST', data:{m_id, m_password},
			success:function(result){
				
				if(result == 'INSERTOK'){
					alert('유저 등록 성공')
					document.location.replace("${rootPath}/")
				}else if(result == 'INSERTFAIL'){
					alert('유저 등록 실패')
					document.location.replace("${rootPath}/")
				}
				
			},error:function(){
				alert('서버오류')
			}
			
		})
		
		
	
		
	})
	
	
	
	$('#idCheck_button').click(function(){
		
		
		if(document.getElementById('m_id').value.length < 5){
			
			
			alert('아이디 5자 이상 입력')
			return false;
			
		}
		
		
		var m_id = $('#m_id').val()
		
		
		$.ajax({
			
			url: "${rootPath}/member/idcheck", type:'POST', data:{m_id},
			success:function(result){
				
				if(result == 'CHECKOK'){
					
					alert('아이디 사용 가능')
					$('input[name=idCheckValue]').attr('value',1);
					
					// 
					
				}else if(result == 'CHECKFAIL'){
					
					alert('아이디가 이미 존재합니다')
					// 아이디 밸류값 지우기
					
				}
				
			},error:function(){
				alert('서버오류')
			}
			
		})
		
	})
	
	
	
})


</script>

<style>
body{
	
	width:100%;
	
	margin: 0 auto 0 auto;
	
}
#join_formBox{
	text-align: center;
    display: block;
    width: 50%;
    /* background-color: papayawhip; */
    border: 5px solid;
    padding: 30px;
    border-color: papayawhip;
    margin-left: 23%;
    margin-top: 10%;
}

#m_password{
	margin-right: 85px;
}

</style>


<body>

<div id="join_formBox">
<a id="join_title"><b>회원 등록</b></a><br><br>

아이디:<input id="m_id" placeholder="5자 이상"><button type="button" id="idCheck_button">중복확인</button><br>
비밀번호:<input id="m_password" type="password" placeholder="8자 이상"><br>
비밀번호확인:<input id="m_passwordRe" type="password" placeholder="8자 이상" style="margin-right: 116px;"><br>
<input name="idCheckValue" id="idCheckValue" type="hidden" value="0"><br>
<button id="member_insert_button" type="button">등록</button>
<button type="button" onclick="document.location.href='${rootPath}/'">홈으로</button>
</div>



</body>
</html>