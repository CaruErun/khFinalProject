<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>successful bid</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
    <!--icon-->
    <script src="https://kit.fontawesome.com/e849be2e05.js" crossorigin="anonymous"></script>
    <style>
        #bid-area{
            margin: auto;
            position: relative;
            width: 100%;
        }
        #Icon1-1, #Icon2-1{
            font-size: 100px;
        }
        #icon1,#icon2{
            display: inline-block;
            text-align: center;
            margin: 100px;
        }
        #inner-area{
            text-align: center;
        }
        button{
            border: 0;
            background-color: white;
        }
 
    </style>
</head>
<body>
    <div id="bid-area">

        <h1 align="center">축하합니다! 경매에 낙찰되셨습니다!</h1>
        <br><br><br>
        
        <div align="center">
            <img src="resources/images/중고경매.png" alt="상품이미지"  width="300px" height="260px">
            <p>[상품명 : 씽씽카]</p>
        </div>

        <div id="inner-area">
        <div id="icon1">
        <a><i class="fa-solid fa-comments-dollar" id="Icon1-1"></i></a> <br><br>
        <lable for="Icon1-1">판매자와 채팅하기(결제)</lable>
        </div>
    
        <div id="icon2">
        <a><i class="fa-solid fa-user" id="Icon2-1"></i></a> <br><br>
        <label for="icon2-1">관리자에게 문의하기</label>
        </div>
    </div>
    </div>
</body>
</html>