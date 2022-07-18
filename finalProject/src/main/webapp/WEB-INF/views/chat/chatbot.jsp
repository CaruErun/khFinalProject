<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {
}

#main-content {

	height:50px;
	width:50px;
    background-color : rgba(0,0,0,0);
    
	        <%--opacity:0;--%>
}
#chat-table{
height:500px;
	width:500px;
    max-width: 500px;
border-width:3px;
border-color:black;
border-style:none solid solid solid;
overflow:scroll;
background:white;
}
#message{
	height:500px;
	width:500px;
	position:fixed;
	bottom:30%;
	right:10%;
}
#connect:hover{
cursor:pointer;
}
.allowM,.sendM{
padding:3px;
max-width:60%;
}
.allowM{
float:left;
border:1px solid black;
border-radius:10px;
}
.sendM{
float:right;
text-align:right;
border:1px solid black;
border-radius:10px;
}
#main-content #send-table{
width:100%;
}
#send-table #msgTd{
width:95%;
}
#msgTd>#msg{
width:95%;
}
#send{
cursor:pointer;
}
#communicate>*,#communicate *{
background:white;
font-size:13pt;
}
#msg{
font-size:15pt;
}
#chatDiv{
	position:fixed;
	top:80%;
	right:10%;
}
#meHeder{
height:30px;
width:500px;
border-width:3px;
border-color:black;
border-style:solid solid none solid;
	background:skyblue;
}
</style>
</head>
<body>    
<div id="main-content">
<div id="message">
<div id="meHeder">ㅡ</div>
<div id="chat-table">

        <div style="background-color:'white';">
            <table id="conversation" class="table table-striped">
                <thead id="communicate-h">
                </thead>
                <tbody id="communicate">
                </tbody>
            </table>
        </div>
    </div>
    <hr>
            <div>
            <table id="send-table">
            <tr>
            <td id="msgTd"><input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요...." style="height:50px;width:430px;"></td>
            <td><img src="resources/image/forward.png" id="send" height="55px"></td>
            </tr>
            </table>
                

        </div>
   </div>
    <div id="chatDiv"  style="width:50px;height:50px;">
           <img id="connect" src="resources/image/chat.png" height="50px" width="50px">
    </div>
    
</div>
<script>
$(document).ready(function(){
	$(function() {

		const $messageTextBox = $('#chat-table');

		document.getElementById("message").style.display='none';
		var stompClient = null;


		function connect() {
		    var socket = new SockJS("${pageContext.request.contextPath}/stomp/chat");
		    stompClient = Stomp.over(socket);
		    stompClient.connect({}, function (frame) {
		        console.log('Connected: ' + frame);
		        stompClient.subscribe('/topic/public', function (message) {
		            showMessage("<div class='allowM'>" + message.body + "</div><br><br>"); //서버에 메시지 전달 후 리턴받는 메시지
		        });
		    });
	    	$("#msg").val("");
		}

		function disconnect() {
		    if (stompClient !== null) {
		        stompClient.disconnect();
		    }
		    console.log("Disconnected");
		}

		function sendMessage() {
		    let message = $("#msg").val()
		    showMessage("<div class='sendM'>" + message + "</div><br><br>");

		    stompClient.send("/app/sendMessage", {}, JSON.stringify(message));//서버에 보낼 메시지
		}

		function showMessage(message) {
			message += "<div style='height:30px'></div>";
		    $("#communicate").append(message);
			$messageTextBox.scrollTop($messageTextBox[0].scrollHeight);
		}
		
		function enterkey() {
		    	if($("#msg").val()!=""){
			    	sendMessage(); 
			    	$("#msg").val("");
		    }
		}
		$("#msg").keyup(function(event){
			if(event.keyCode==13) enterkey();
			});
		

		$(function () {
		    $( "#connect" ).click(function() { 
		    	if(stompClient == null) {
		    		connect();
		    		document.getElementById("message").style.display='block';
		    	}
		    	else {
		    		disconnect();
		    		stompClient = null;
		    		document.getElementById("message").style.display='none';
		    	}


		    });

		    $( "#send" ).click(function() { 
		    	if($("#msg").val()!=""){
		    	sendMessage(); 
		    	$("#msg").val("");
		    	}
		    });
		    

		});



		//var sock = new SockJS(
		//			"${pageContext.request.contextPath}/stomp/chat");
		//var client = Stomp.over(sock);
	    
	    	//client.connect({},function() {
				//메세지 들어오는곳 == 구독한 채팅 채널
	            //roomNo는 채팅창 접속하는 url에 get방식의 값으로 연결해줌
	            //ex)채팅url?roomNo=13 이면 jsp el태그로 ${roomNo}로 가져와서 사용
				//client.subscribe('/app/chat/'+ roomNo,function(chat) {
				//받은 데이터
				//var content = JSON.parse(chat.body);
				//후에 받은 데이터를 html코드로 뿌려주면 됨	

				//});
	                            
	       });

	});
	
</script>
</body>

</html>