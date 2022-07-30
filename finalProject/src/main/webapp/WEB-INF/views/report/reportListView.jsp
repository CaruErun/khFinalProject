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
	
		#reportList {
			text-align:center;
		}
        #reportList a{
        	color:black;
        	text-decoration: none;
        }
        #pagingArea{
        	width:70%;
 			margin-top:50px; 
			display: flex;
			align-items:center;
			justify-content: center;
        }
        #content{
			margin : 0 auto;
            padding-top:50px;
		    width: 1500px;
		    height: 900px;
			display:flex;
			flex-direction: column;
			justify-content : center;
			align-items: center;	
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
        #proView{
        	color:black;
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
                     
                        <th>상태</th>
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
	                        <td style="display:none;">${r.proNo }</td>
	                        <c:choose>
	                        	<c:when test="${r.reportStatus == 'Y' }">
	                       			 <td class="reportStatus"><b>처리대기</b></td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td class="reportStatus">처리완료</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <td>
            					<button type="button" class="btn detail btn-secondary " data-toggle="modal" data-target="#detailView">상세</button>
            				</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </div>
            <br><br>
            <div id="pagingArea">
                <ul class="pagination">
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
                    <li class="page-item"><a class="page-link" href="reportList.re?cpage=${p}">${p}</a></li>
                </c:forEach>
                </ul>
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
		      		<a id="proView" href=""><b>판매 게시글로 이동</b></a><br><br>
	            		<a class="btn btn-secondary" id="ban" style="float:right; display:block" href="">정지</a>
<!-- 		      		반려 버튼을 만들어서 신고 사유가 마땅하지 않을 경우 reportStatus를 n으로 만듦 -->
	            		<a class="btn btn-secondary" id="noban" style="float:right; display:block" href="">반려</a>
				</div>
			</div>
<!-- 			클릭하면 이벤트 발생 -> attr로 변경 -->
		</div>
	</div>

	<script>
	// 자바스크립트를 편하게 쓰라고 만든게 제이쿼리
		$(function(){
			$(".detail").click(function(){
				// attr / prop displayNone
				var reportStatus = $(this).parent().parent().children(".reportStatus").eq(0).text();
					if(reportStatus == '처리완료'){
						console.log(reportStatus);
						$("#ban").attr("style", 'display:none;' );
						$("#noban").attr("style", 'display:none;' );
					}else{
						$("#ban").attr("style", 'display:inline;');
						$("#noban").attr("style", 'display:inline;');
					}
				
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
			function test(reportNo, reportedId, proNo){
				// 함수/메소드를 정의
				// 함수 안의 변수 이름으로 받아 사용함
			$("#ban").attr("href",'ban.me?reportNo='+reportNo+'&reportedId='+reportedId);
			$("#noban").attr("href", 'noban.me?reportNo='+reportNo);
			$("#proView").attr("href", "productDetail.pr?pNo="+proNo);
			}
			
			$(".detail").click(function(){
				var reportNo = $(this).parent().siblings().eq(0).text();
// 				console.log(reportNo);
				// 함수/메소드를 호출
				// 함수 안에 변수를 담아서 보냄
				var reportedId = $(this).parent().siblings().eq(3).text();
				var proNo =  $(this).parent().siblings().eq(5).text();
				console.log(proNo)
				console.log(reportedId);
				test(reportNo, reportedId, proNo);
			})
			
			// 이미 ban되어 있을 경우 (banDate에 이미 특정 날짜가 들어있을 경우)
			// 조건문으로 banDate + 일수
			
			// 신고를 처리했을 경우 status는 n으로 하고 보여주는데 상태를 바꾸고 정지버튼을 안 보여줌
			
// 			$("#ban").click(function(){
// 				console.log($(this).parent().parent().parent());
// 				$("#ban").attr("href", "ban.me?userId="+$(this).parent(".reportedId").eq(0).text());
// 			})
		})
	</script>

	
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>