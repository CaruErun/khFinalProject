<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#noticeList {text-align:center;}
        #noticeList>tbody>tr:hover {cursor:pointer;}
        #noticeList a{
        	color:black;
        	text-decoration: none;
        }
        #pagingArea{
        	width:fit-content; margin:auto; 
 			margin-top:50px; 
        }
        #content{
            padding-top:50px; 
		    width: 1500px;
		    height: 840px;
 		    margin-left: 20%;
		}		
		table{
		    border-top: 1px solid gray;
		    border-bottom: 1px solid gray;
		}
		#content_2{
		    width: 70%;
		    height: 100%;
		}
		
        .text {width:53%;}

        .btn-secondary{
            margin-right: 10px;
        }

        
	</style>

</head>

<body>
		<jsp:include page="../customerInfoMenubar.jsp"/>
			<div id="content">
            <h2>공지사항</h2>
            <h4>삼삼옥션 서비스의 오류, 장애, 기타 공지사항을 안내드립니다.</h4>
        	<div id="content_2">
            <br>
            <c:if test="${loginUser.userId eq 'admin' }">
            	<a class="btn btn-secondary" style="float:right;" href="enrollForm.no">공지사항 작성</a>
            </c:if>
            <br><br><br>
            <table id="noticeList" class="table table-hover" style="width: 1050px; text-align:center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="n" items="${list }">
	                    <tr onclick = "location.href='detail.no?nno=${n.nfNo}'">
<!-- 	                    onclick 으로 선언한 다음에는 문자열이 필요  그래서 ""가 있어야함-->
<!-- 						location.href도 주소를 "", ''로 해야함 -->
	                        <td class="nfNo">${n.rnum }</td>
	                        <td>${n.nfTitle }</td>
	                        <td>${n.count }</td>
	                        <td>${n.createDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <script>	// 자바 스크립트 => $jquery
            	$(function(){
            		$("#noticeList>tbody>tr").click(function(){
            			/*
            			리스트뷰에서 게시글을 클릭하면 rnum이 nfno로 넘어감
            			rnum 19를 클릭하면 nfno34로 가야하는데 19로 감
            			같은 이름의 클래스가 여러개일 수 있어서 .eq(0)를 넣어야함
            			location.href = 'detail.no?nno=' + $(this).children(".nfNo").eq(0).text();
            			el태그랑 자바스크립트는 어울릴 수 없음
            			실행순서가 - 자바 jstl html 자바스크립트
            			
            			var a = $(this).closest('tr').prevAll().length;
            			location.href = 'detail.no?nno=' + ${list.get(a).nfNo};
            			onclick은 스크립트로 실행
            			*/
						console.log($(this).closest('tr').prevAll().length);
            			// 5개 tr중에 뭐를 클릭했는지
            			// 자바스크립트 - jquery
            		})
            	})
            </script>
            
            <br><br>
            <div id="pagingArea">
                <ul class="pagination">
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
                    <li class="page-item"><a class="page-link" href="noticeList.no?cpage=${p}">${p}</a></li>
                </c:forEach>
                </ul>
            </div>
        </div>

    </div>
	
         	<jsp:include page="../common/footer.jsp"/>
</body>
</html>