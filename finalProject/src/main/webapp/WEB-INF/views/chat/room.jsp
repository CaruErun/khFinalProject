<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
            <div class="col-6">
                <h1>"채팅방"</h1>
            </div>
            <div>
                <div id="msgArea" class="col"></div>
                <div class="col-6">
                    <div class="input-group mb-3">
                        <input type="text" id="msg" class="form-control">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6"></div>
        </div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!--
	sockjs: 웹브라우저 상관 없이 웹소켓을 사용할 수 있게 해줌 
	stomp: 웹소켓을 보다 간편하게 사용할 수 있게
-->
<!-- 
	낙찰이 되면 productNo로 CHAT_ROOM 테이블에 인서트 하나 인서트
	낙찰자, 판매자에게 CHAT_ROOM_NO를 전달
	헤더에서 보여줌
	낙찰자, 판매자에게 거래가 성사되었다는 정보를 주기위한 sql구문이 필요
	경매가 끝나는건 PRO_STATUS = 'n'
	groub by로 bid테이블의 pro_no를 하나로 묶음
-->
		<script>
            $(document).ready(function(){

                var roomName = "123";
                var roomId = '${chat.chatRoomNo}';
                var username = '${chat.name}';

                console.log(roomName + ", " + roomId + ", " + username);

                var sockJs = new SockJS("${pageContext.request.contextPath}/stomp/chat");
                //1. SockJS를 내부에 들고있는 stomp를 내어줌
                var stomp = Stomp.over(sockJs);

                //2. connection이 맺어지면 실행
                stomp.connect({}, function (){
                   console.log("STOMP Connection")

                   //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                   stomp.subscribe("/topic/chat/room/" + roomId, function (chat) {
                	   
                       var content = JSON.parse(chat.body);
                       console.log(content.message)
                       var writer = content.writer;
                       var str = '';

                       if(writer === username){
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-secondary'>";
                           str += "<b>" + writer + " : " + content.message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }
                       else{
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-warning'>";
                           str += "<b>" + writer + " : " + content.message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }
<<<<<<< HEAD
=======
// == 채팅방 형식 지정
>>>>>>> refs/remotes/origin/main
                   });

                   //3. send(path, header, message)로 메세지를 보낼 수 있음
                   stomp.send('/app/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
                });

                $("#button-send").on("click", function(){
					send();
                });
        		$("#msg").keyup(function(event){
        			if(event.keyCode==13) send();
        			});
 				function send(){
                    var msg = document.getElementById("msg");

                    console.log(username + ":" + msg.value);
                    stomp.send('/app/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
                    msg.value = '';
 					
 				}
 				
            });
        </script>
</body>
</html>