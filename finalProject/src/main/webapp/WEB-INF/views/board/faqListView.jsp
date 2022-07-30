<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		#faqList {text-align:center;}
        #faqList>tbody>tr:hover {cursor:pointer;}
        #faqList a{
        	color:black;
        	text-decoration: none;
        }
        #pagingArea{
        	width:70%;
 			margin-top:50px; 
			display: flex;
			align-items:center;
			justify-content: center;
/* 			border: 1px solid black; */
        }
        #content{
         	margin: 0 auto;
            padding-top:50px;
		    width: 1500px;
		    height: 840px;
		    display:flex;
		    flex-direction: column;
/*   		    border: 1px solid black; */
  		    align-items: center;
		}	
		table{
			width:100%;
		    border-top: 1px solid gray;
		    border-bottom: 1px solid gray;
		}
		#content_1{
			width: 70%;
/* 			border: 1px solid blue; */
		}
		#content_2{
		    width: 70%;
/* 		    border: 1px solid red; */
		}
        .btn-secondary{
            margin-right: 10px;
        }
        #nfContent{
        display: none;
        }
	</style>
</head>

<body>
		<jsp:include page="../customerInfoMenubar.jsp"/>
		<div id="content">
			<div id="content_1">
            	<h2>FAQ</h2>
            	<h4>자주 묻는 질문들을 안내해 드립니다.</h4>
        	</div>
        	<div id="content_2">
            <br>
            <c:if test="${loginUser.userId eq 'admin' }">
            	<a class="btn btn-secondary" style="float:right;" href="enrollForm.fq">FAQ 작성</a>
            </c:if>
            <br><br><br>
            <table id="faqList" class="table table-hover" style="width: 1050px; text-align:center">
                <thead>
                    <tr>
                        <th width="10%">글번호</th>
                        <th width="15%">카테고리</th>
                        <th width="50%">제목</th>
                        <th width="15%">작성일</th>
                        <th width="10%"></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="f" items="${list }">                
	                    <tr id="nfTitle" onclick="down();">
	                        <td class="nfNo">${f.rnum }</td>
	                        <td>${f.nfCateNo}</td>
	                        <td>${f.nfTitle }</td>
	                        <td>${f.createDate }</td>
	                        <td></td>
<!-- 	                        <td onclick="event.cancelBubble='true'"> -->
<%-- 	                        	<c:if test="${1 eq 1 }"> --%>
<%--                 					<a class="btn btn-secondary" href="updateForm.fq?nfNo=${f.nfNo}">수정/삭제</a> --%>
<!--                 					<input type="hidden"> -->
<%-- 								</c:if> --%>
<!--                 			</td> -->
	                    </tr>
	                    <tr id="nfContent">
	                    	<td width="60%" colspan="3"><b>${f.nfContent }</b></td>
	                    	<td onclick="event.cancelBubble='true'">
	                        	<c:if test="${loginUser.userId eq 'admin' }">
                					<a class="btn btn-secondary" href="updateForm.fq?nfNo=${f.nfNo}">수정/삭제</a>
                					<input type="hidden">
								</c:if>
                			</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <script>	// 자바 스크립트 => $jquery
            	$(function(){
            		$("#faqList>tbody>#nfTitle").click(function(){
						console.log($(this).closest('tr').prevAll().length);
						var $answer = $(this).next();
						
						if($answer.css("display")=="none"){
							$(this).siblings("#nfContent").slideUp();
							$answer.slideDown();
						}else{
							$answer.slideUp();
						}
            		});
            	});
            </script>
            
        	</div>
            <div id="pagingArea">
                <ul class="pagination">
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
                    <li class="page-item"><a class="page-link" href="faqList.fq?cpage=${p}">${p}</a></li>
                </c:forEach>
                </ul>
            </div>
        <br><br>

    </div>
	
         	<jsp:include page="../common/footer.jsp"/>
</body>
</html>



