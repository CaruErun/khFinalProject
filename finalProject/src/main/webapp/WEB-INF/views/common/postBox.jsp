<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/postBox.css">
    <title>운송장등록</title>
</head>
<body>

<c:if test="${ not empty alertMsg }">
<script>
	alert("${alertMsg}");
</script>
<c:remove var="alertMsg" scope="session"/>
</c:if>

    <div class="wrap">
        <div id="header">
            <div id="title">운송장등록</div>
            
        </div>
        <div id="content">
                <form action="postInsert.me">
                    <div id="content1">
                        <img src="resources/images/중고경매.png" alt="이미지" id="image">
                    </div>
                    <div id="content2">
                        운송장 등록 후 수정이 불가하니 신중하게 입력해주십시오.
                    </div>
                    <div id="content3">
                        <div id="content_3_1">
                            &nbsp;&nbsp; 택배회사 &nbsp;
                            <select  id="inputbox" name="pboxName">
                                <option value="CJ대한통운">CJ대한통운</option>
                                <option value="우체국택배">우체국택배</option>
                                <option value="한진택배">한진택배</option>
                                <option value="롯데택배">롯데택배</option>
                                <option value="로젠택배">로젠택배</option>
                            </select>
                        </div>
                        <div id="content_3_2">
                            운송장번호 &nbsp;
                            <input type="text" id="inputbox" name="pboxNo">
                            <input type="hidden" name="userId">
                        </div> 
                    </div>
        </div>
        <div id="footer">
            <div id="footer_1">
                <input type="submit" id="" class="btn3" value="등록">
                <button type="button" class="btn4">취소</button>
            </div>
        </div>
                </form>
    </div>  
</body>
</html>