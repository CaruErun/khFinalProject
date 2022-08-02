<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="resources/css/회원탈퇴.css">
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="title">나의정보</div>
            <div id="out">&nbsp&nbsp회원탈퇴</div>
        </div>
        <div id="content">
                    <div id="content1">
                        <br><br><span class="span" style="color: midnightblue; font-weight: 550; font-size: 25px;">SAMSAM AUCTION 회원 탈퇴</span><span style="font-size: 25px;">를 하시겠습니까?</span>
                        <br><pre id="pre" style="font-size: 12px;">아래 약관 내용을 참조하신 후 신중하게 버튼을 클릭하여 주시기 바랍니다.</pre>
                    </div>
                    <div id="content2"></div>
                    <div id="content3">
                        <div id="content_3_1">약관</div>
                        <div id="content_3_2">&nbsp&nbsp&nbsp SAMSAM AUCTION을 이용해주신 고객님께<br><br>
                            &nbsp&nbsp&nbsp 회원탈퇴시 유의사항 <br><br>
                            &nbsp&nbsp&nbsp · 회원탈퇴 시 회원님의 정보는 전자상거래에서의 소비자보호법률에 의거한 개인정보취급방침에 따라 관리됩니다.<br><br>
                            &nbsp&nbsp&nbsp · 회원탈퇴후에도 회원님의 관한 정보는 관련법령에 의거 일정기간 보관됩니다.<br><br>
                            &nbsp&nbsp&nbsp <b>[탈퇴가 불가한 경우]</b><br>
                            &nbsp&nbsp&nbsp <span style="color: midnightblue; font-weight: bold;">진행중인 물품</span>(판매/구매)이 있는 경우 탈퇴신청이 불가능합니다.
                        </d>
                    </div>
        </div>
        <div id="footer">
            <div id="footer_1">
                <input type="button" id="" class="btn3" value="탈퇴" onclick="location.href='deleteFo.me'">
                <button class="btn4" onclick="history.go(-1)">취소</button>
            </div>
        </div>
    </div>
</body>
</html>