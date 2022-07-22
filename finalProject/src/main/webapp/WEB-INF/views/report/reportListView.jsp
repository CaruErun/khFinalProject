<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
	
		#reportList {text-align:center;}
        #reportList a{
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
        .btn-secondary{
            margin-right: 10px;
        }

        
	</style>
</head>

<body>
		<jsp:include page="../customerInfoMenubar.jsp"/>
		<div id="content">
        <div id="content_2">
        
			<br>
            <h2>신고</h2>
            <br><br>
            
            <table id="reportList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>신고번호</th>
                        <th>분류</th>
                        <th>신고자</th>
                        <th>피신고자</th>
                        <th>신고일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="r" items="${list }">
	                    <tr>
	                        <td class="reportNo">${r.reportNo}</td>
	                        <td>${r.reportCateNo }</td>
	                        <td>${r.reportId}</td>
	                        <td class="reportedId">${r.reportedId}</td>
	                        <td>${r.createDate}</td>
	                        <td>
            					<button type="button" class="detail" class="btn btn-secondary detail" data-toggle="modal" data-target="#detailView">상세</button>
            				</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <br><br>
            <div id="pagingArea">
                <ul class="pagination">
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
                    <li class="page-item"><a class="page-link" href="reportList.re?cpage=${p}">${p}</a></li>
                </c:forEach>
                </ul>
            </div>
        </div>
        <br><br>

<!-- 	<button id="detail">전송</button> -->
    </div>

	<!-- 신고 상세보기 모달 -->
	<div class="modal" id="detailView">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
			        <h4 class="modal-title">신고 상세 보기</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
<!-- 
	모달은 페이지 이동을 하지 않기 때문에 => ajax
 -->
	      		<!-- Modal body -->
				<div class="modal-body" align="center">
					<div class="ReportContent"></div>
		      		<br> 
		      		<div class=""><b>판매 게시글로 이동</b></div><br>
            		<a class="btn btn-secondary" id="ban" style="float:right;" href="">정지</a>
				</div>
			</div>
<!-- 			클릭하면 이벤트 발생 -> attr로 변경 -->
		</div>
	</div>

	<script>
		$(function(){
			$(".detail").click(function(){
// 				console.log($(this).parent().parent().children(".reportNo").eq(0).text());
				$.ajax({
					url: "detailAjax.re",
					data: {
						reportNo: $(this).parent().parent().children(".reportNo").eq(0).text()
					},
					success: function(result){
						$(".ReportContent").html(result.reportContent);
					},
					error: function(){
						console.log("ajax 통신 실패");
					},
				})
			})
		})
	</script>
	
	<script>
		$(function(){
			function test(pi){
				
			$("#ban").attr("href",'ban.me?userId='+pi);
			}
			
			$(".detail").click(function(){
				var pi = $(this).parent().siblings().eq(3).text();
				console.log(pi);
				test(pi);
			})
			
// 			$("#ban").click(function(){
// 				console.log($(this).parent().parent().parent());
// 				$("#ban").attr("href", "ban.me?userId="+$(this).parent(".reportedId").eq(0).text());
// 			})
		})
	</script>
	
         	<jsp:include page="../common/footer.jsp"/>
</body>
</html>