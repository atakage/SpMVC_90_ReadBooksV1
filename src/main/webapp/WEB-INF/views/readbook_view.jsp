<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath}"/>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>

* {
	
	margin:0;
	padding:0;
}

body{
	
	width:100%;

}

.readBookViewBox{
    /* margin-top: 10%; */
    margin: 0 auto 0 auto;
    margin-top: 10%;
    width: 500px;
    /* margin-left: 30%; */
    border-style: double;
    background-color: papayawhip;
    font-size: larger;
}

.paragraph{

    background-color: bisque;
	
}


.paragraphContent{

font-weight: bold;

}


.homeButton{
    margin-left: 50%;
}

</style>


<body>



<div class="readBookViewBox">


<a class="paragraph">SEQ</a> &nbsp&nbsp <a class="paragraphContent">${READBOOKVO.rb_seq}</a>   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a class="paragraph">도서코드</a> &nbsp&nbsp <a class="paragraphContent">${READBOOKVO.rb_bcode}</a><br>
<a class="paragraph">독서일자</a> &nbsp&nbsp <a class="paragraphContent">${READBOOKVO.rb_date}</a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a class="paragraph">독서시간</a> &nbsp&nbsp <a class="paragraphContent">${READBOOKVO.rb_rtime}시간</a><br><br>
<a class="paragraph">도서명</a> &nbsp&nbsp <a class="paragraphContent">${READBOOKVO.rb_bname}</a><br><br><br>
<a class="paragraph">한줄소감</a> &nbsp&nbsp <a class="paragraphContent">${READBOOKVO.rb_subject}</a><br><br>
<a class="paragraph">긴줄소감</a><br><br>
<a class="paragraphContent">${READBOOKVO.tb_text}</a><br><br><br><br>

<a class="paragraph">평점 &nbsp&nbsp ${READBOOKVO.rb_star}</a>



</div>
<br>
<input type="button" value="닫기" onclick="window.close()" style="margin-left: 47%">

</body>
</html>