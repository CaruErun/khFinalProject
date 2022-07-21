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

<!-- 판매자와 구매자에게 똑같은 방 번호를 부여 -->
		<div class="container">
            <div class="col-6">
                <h1>[${room.name}]</h1>
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

<script>
            $(document).ready(function(){

                var roomName = '${room.name}';
                var roomId = '${room.roomId}';
                var username = '${username}';

                console.log(roomName + ", " + roomId + ", " + username);

                var sockJs = new SockJS("${pageContext.request.contextPath}/stomp/chat");
                //1. SockJS를 내부에 들고있는 stomp를 내어줌
                var stomp = Stomp.over(sockJs);

                //2. connection이 맺어지면 실행
                stomp.connect({}, function (){
                   console.log("STOMP Connection")

                   //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                   // roomId에 해당하는 번호에 들어와 있음(구독)
                   stomp.subscribe("/topic/chat/room/" + roomId, function (chat) {
                	   
                       var content = JSON.parse(chat.body);
                       console.log(content.message)
                       var writer = content.writer;
                       var str = '';
// ==
                       if(writer === username){	// 내가 메세지를 보냈을 때
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-secondary'>";
                           str += "<b>" + writer + " : " + content.message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }
                       else{	// 다른사람에게 메세지를 받았을 때
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-warning'>";
                           str += "<b>" + writer + " : " + content.message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }
// == 채팅방 형식 지정     
                   });

                   //3. send(path, header, message)로 메세지를 보낼 수 있음
                   stomp.send('/app/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
                   // ㄴ 서버에 통신을 보냄 '/app/chat/enter' 매핑값으로
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