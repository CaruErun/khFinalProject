<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link 
                rel="stylesheet" 
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
                integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
                crossorigin="anonymous" 
                referrerpolicy="no-referrer"
            />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
            <title>Insert title here</title>
        </head>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box !important;
            }

            .enroll-area {
                position: relative;
                width: 70%;
                height: 2300px;
                margin: 0 auto;
                top: 200px;
            }

            .enroll-category {
                width: 100%;
                height: 370px;
            }

            .enroll-area>form>div {
                margin-top: 70px;
            }

            .cate-location {
                width: 100%;
                height: 53px;
                border: 1px solid black;
                display: flex;
                margin-top: 20px;
                margin-left: 10px;
            }

            .cate-location>#cl-1 {
                width: 22%;
                height: 100%;
                background-color: black;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .cate-location>#cl-2 {
                width: 78%;
                height: 100%;
                display: flex;
                align-items: center;
                padding-left: 15px;
            }

            .select-category {
                width: 100%;
                height: 250px;
                margin-top: 20px;

            }

            .select-category>#se-list1,
            #se-list2 {
                width: 20%;
                height: 100%;
                font-size: 16px;
                padding: 10px;
                margin-left: 10px;
            }

            .select-category option {
                margin-bottom: 10px;
            }

            .enroll-item {
                width: 100%;
                height: 1000px;

            }

            .enroll-item>#item-info {
                display: flex;
                justify-content: space-between;
            }

            #item-info>h5 {
                padding-right: 5px;
                padding-top: 10px;
            }

            .item-title {
                border-top: 1px solid gray;
                border-right: 1px solid gray;
                width: 100%;
                height: 150px;
                display: flex;
                margin-top: 20px;
                margin-left: 10px;
            }

            .item-title>.it-2 {
                width: 82%;
                height: 100%;
                padding-left: 15px;
                padding-top: 10px;

            }

            .it-2>input {
                width: 90%;
                height: 25px;
                border: 1px dotted black;
                padding-left: 10px;
            }

            .item-content {
                border: 1px solid gray;
                width: 100%;
                height: 500px;
                display: flex;
                margin-left: 10px;
            }

            .item-content>.ic-2 {
                width: 82%;
                height: 100%;
                padding-left: 15px;
                padding-top: 10px;
            }

            .ic-2>#ic-text {
                width: 98%;
                height: 425px;
            }

            .item-image {
                border-right: 1px solid gray;
                border-bottom: 1px solid gray;
                border-left: 1px solid gray;
                width: 100%;
                height: 300px;
                display: flex;
                margin-left: 10px;
            }

            .item-image>.ii-2 {
                width: 82%;
                height: 100%;
                padding-left: 15px;
                padding-top: 10px;
            }

            .ii-2>.upload-box {
                width: 98%;
                height: 230px;
            }
			 .drag-area{
		        border: 2px dotted black;
		        height:100%;
		    }
		    .drag-area .icon{
		        font-size: 50px;
		    }
		    .drag-area .drag-drop{
		        font-size: 25px;
		        font-weight: bold;
		        color:darkolivegreen;
		        margin-bottom: 20px;
		    }
		    .drag-area .drag-info{
		        width: 100%;
		        font-size: 14px;
		        color: gray;
		        display: flex;
		        justify-content: center;
		    }
		    .drag-area.active {
		        border: 2px solid darkolivegreen;
		        background-color:lightgrey
		    }
            .upload-files{
                width: 98%;
                height: 60px;
                display: flex;
                align-items: center;
            }
            .upload-label{
                width: 90px;
                height: 30px;
                background-color: gray;
                color: white;
                border-radius: 3px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-weight: bold;
                cursor: pointer;
            }
              
		    .before-drop{
		        display: flex;
		        height: 90%;
		        align-items: center;
		        justify-content: center;
		        flex-direction: column;
		        padding-top: 30px;
		    }
		    .drop-area{
		        width: 100%;
		        height: 90%;
		        display: none;
		        align-items: center;
		        justify-content:left;
                padding-left: 45px;
		        
		    }
		    .drop-img{
		        width: 120px;
		        height: 150px;
                border: 1px solid black;
                position: relative;
                list-style: none;
                margin: 0 60px 20px 60px;
               

		    }
		    .drop-img img {
		        width: 100%;
		        height: 100%;
		        object-fit: cover ;
		    }
            .drop-img > div{
                width: 100%;
                display: flex;
                align-items: center;
                text-align: center;            
                
            }
            .delete-img{
                width: 18px;
                height: 18px;
                font-size: 20px;
                line-height: 10px;
                position:absolute;
                top: 0;
                right: 0;
                background-color: black;
                color: white;
                display: inline-block;
                text-align: center;
                cursor: pointer;
            }     
			.progress-name{
                font-size: 13px;
                width: 100%;
            
            }

            .enroll-bid {
                width: 100%;
                height: 250px;
            }

            .start-price {
                width: 100%;
                height: 50px;
                border: 1px solid gray;
                display: flex;
                margin-left: 10px;
                margin-top: 20px;

            }

            .start-price>.sp-2 {
                width: 82%;
                height: 100%;
                display: flex;
                align-items: center;
                padding-left: 15px;
            }

            .sp-2>input {
                width: 100px;
                height: 30px;
                border: 1px dotted black;
                padding-left: 15px;
                font-size: 16px;
                font-weight: bold;
            }
            .wish-price {
                width: 100%;
                height: 50px;
                border-left: 1px solid gray;
                border-bottom: 1px solid gray;
                border-right: 1px solid gray;
                display: flex;
                margin-left: 10px;

            }

            .wish-price>.wp-2 {
                width: 82%;
                height: 100%;
                display: flex;
                align-items: center;
                padding-left: 5px;
                font-weight: bold;
            }
            
            .wp-2 > input {
                height: 30px;
                border: 1px dotted rgb(5, 4, 4);
                margin-right: 5px;
                margin-left: 10px;
                font-size: 16px;
                font-weight: bold;
            }
            .wp-2 >div>input {
                width: 100px;
                height: 30px;
                border: 1px dotted black;
                margin-right: 5px;
                margin-left: 10px;
                padding-left: 15px;
                font-size: 16px;
                font-weight: bold;
            }
        
            

            .bid-date {
                width: 100%;
                height: 50px;
                border-left: 1px solid gray;
                border-right: 1px solid gray;
                border-bottom: 1px solid gray;
                display: flex;
                margin-left: 10px;

            }

            .bid-date>.bd-2 {
                width: 82%;
                height: 100%;
                display: flex;
                align-items: center;
                padding-left: 15px;
                font-weight: bold;
            }

            .bd-2>select {
                width: 100px;
                height: 30px;
                border: 1px dotted black;
                margin-right: 5px;
                padding-left: 22px;
                font-size: 16px;
                font-weight: bold;
            }
            .bd-2>span{
                padding-left: 20px;
                font-size: 14px;
                color: gray;
            }

            .enroll-shipping {
                width: 100%;
                height: 150px;
            }

            .enroll-shipping>.shipping-type {
                width: 100%;
                height: 50px;
                border: 1px solid gray;
                display: flex;
                margin-left: 10px;
                margin-top: 20px;
            }

            .shipping-type>.st-2 {
                width: 82%;
                height: 100%;
                display: flex;
                align-items: center;
                padding-left: 5px;
                font-weight: bold;
            }

            .st-2>input {
                height: 30px;
                border: 1px dotted black;
                margin-right: 5px;
                margin-left: 10px;
                padding-left: 22px;
                font-size: 16px;
                font-weight: bold;
            }

            .shipping-price {
                width: 100%;
                height: 50px;
                border-left: 1px solid gray;
                border-right: 1px solid gray;
                border-bottom: 1px solid gray;
                display: flex;
                margin-left: 10px;

            }

            .shipping-price>.shp-2 {
                width: 82%;
                height: 100%;
                display: flex;
                align-items: center;
                padding-left: 5px;
                font-weight: bold;
            }

            .shp-2>div>input {
                width: 100px;
                height: 30px;
                border: 1px dotted black;
                margin-right: 5px;
                margin-left: 10px;
                padding-left: 22px;
                font-size: 16px;
                font-weight: bold;
            }

            .btn-area {
                width: 100%;
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }

            .btn-area>button {
                width: 15%;
                height: 45px;
                margin-right: 5px;
                font-size: 16px;
                border-radius: 3px;
                cursor: pointer;
            }

            button[type=submit] {
                background-color: black;
                color: white;
            }

            .black-area {
                background-color: black;
                color: white;
                width: 18%;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
            }
            .kor-no{
                padding-left: 20px;
                font-size: 15px;
                font-weight: bold;
            }

            
        </style>

        <body>
            <jsp:include page="../common/header.jsp" />
            <div class="enroll-area">

                <h1>온라인 물품등록</h1>

                <form action="insertProduct.pr" id="insertForm" method="post" enctype="multipart/form-data">
                    <div class="enroll-category">
                        <h3>◆ 카테고리 선택</h3>
                        <div class="cate-location">
                            <div id="cl-1">선택한 카테고리 경로</div>
                            <div id="cl-2"></div>
                        </div>
                        <div class="select-category">
                            <select id="se-list1" size="5">
                                <option value="none" disabled>- 선택하세요 -</option>
                                <option value="100">가전제품</option>
                                <option value="200">스포츠용품</option>
                                <option value="300">생필품</option>
                                <option value="900">기타</option>
                              
                            </select>
                            <select name="proCateNo" id="se-list2" size="5" required>
                                <option value="none" disabled>- 선택하세요 -</option>
                              
                            </select>
                        </div>
                    </div>
                    <script>
                        let list2 = $('#se-list2');
                        $('#se-list1').on("change",function(){
                            $('#cl-2').text($(this).find("option:selected").text()+" > ");
                            $.ajax({
                            url : "selectCateList.pr",
                            data : {
                                categoryNo: $(this).find("option:selected").val()
                                
                            },
                            success : function(result){
                        
                                let opt = "";
                                for(var i=0; i<result.length; i++){
                                    opt += '<option value="'+result[i].cateNo+'">'+result[i].cateName+'</option>';
                                }
                                console.log(list2.children());
                                list2.children().remove();
		
                                list2.append("<option value='none' disabled>- 선택하세요 -</option>");
                                $(opt).appendTo('#se-list2');
                            },
                            error : function(){
                                console.log("ajax통신실패")
                            }
    					
    				        })	
                        });
                        $('#se-list2').on("change",function(){
                            let loc1 = ($('#se-list1')).find("option:selected").text();
                            let loc2 = $(this).find("option:selected").text();
                           
                            $('#cl-2').text(loc1+" > "+loc2);
                        });

                    </script>
                    <div class="enroll-item">
                        <div id="item-info">
                            <h3>◆ 물품정보</h3>
                            <h5>* 표시는 필수 항목입니다.</h5>
                        </div>
                        <div class="item-title">
                            <div class="it-1 black-area">
                                * 물품제목
                            </div>
                            <div class="it-2">
                                <input type="text" name="proTitle" required placeholder="   물품 제목 입력 시 아래 주의사항을 확인해 주세요!">
                            </div>
                        </div>
                        <div class="item-content">
                            <div class="ic-1 black-area">
                                * 물품설명
                            </div>
                            <div class="ic-2">
                                <textarea name="proContent" required id="ic-text" cols="30" rows="10"></textarea>
                            </div>
                        </div>
                        <div class="item-image">
		                    <div class="ii-1 black-area">
		                        * 이미지등록
		                    </div>
		                    <div class="ii-2">
		                        <div class="upload-box">
		                            <div class="drag-area">
		                                <div class="before-drop">
		                                    <h3>Upload your file</h3>
		                                    <div class="icon">
		                                        <i class="fas fa-images"></i>
		                                    </div>
		                                    <span class="drag-drop">Drag & Drop</span>
		                                </div>
		                                <ul class="drop-area">
		                             
		                                </ul>
		                                <span class="drag-info">
		                                	   ※이미지형식 : JPG, JPEG, PNG / 4장까지 등록 가능합니다.
		                               		  원활한 물품등록을 위하여 이미지 1장 기준으로 10MB 이하로 등록하셔야 합니다.
		                                </span>
                                       
		                            </div>
                                    
		                        </div>
                                <div class="upload-files">
                                    <input type="file" name="upfile" id="upfile0" onchange="loadImg(this);" style="display: none;">
                                    <input type="file" name="upfile" id="upfile1" onchange="loadImg(this);" style="display: none;">
                                    <input type="file" name="upfile" id="upfile2" onchange="loadImg(this);" style="display: none;">
                                    <input type="file" name="upfile" id="upfile3" onchange="loadImg(this);" style="display: none;">
                                    
                                    
                                    <label for="upfile0" class="upload-label" onclick="check4();">파일등록</label>

                                </div>
		                    </div>
               			 </div>
                    </div>
                
                 
					 	
					 <script>
		                // //드레그엔드랍
		                const dragArea = document.querySelector('.drag-area');
		                const dragText = document.querySelector('.drag-drop');
		                const dropArea = document.querySelector('.drop-area');
		                const beforeDrop = document.querySelector('.before-drop');
                        
                        
		                let file;
		                let num = 0;
		             
		                // //when file is inside the drag area
		                // dragArea.addEventListener('dragover',(event) => {
		                //     event.preventDefault();
		                //     dragText.textContent = 'Upload 하시겠습니까?';
		                //     dragArea.classList.add('active');
		                    
		                // });
		                // //when file leaces the drag area
		                // dragArea.addEventListener('dragleave', () => {
		                //     dragText.textContent ='Drag & Drop';
		                //     dragArea.classList.remove('active');
		                // });
		                // //when the file is dropped in the drag area
		                // dragArea.addEventListener('drop',(event) => {
		                //     event.preventDefault();
                            
		                //     file = event.dataTransfer;
                            
                        //     console.log(num);
                        //     if(num<4){
                        //         loadImg(file);
                      
                        //     }else{
                        //         alert('파일은 4개까지 등록 가능합니다.');
                        //         dragArea.classList.remove('active');
                        //     }
		                // });
                        function loadImg(inputfile){

                            
                            if(num<4){
                                file = inputfile.files[0];
                                displayFile();
                            }
                        }      
                        function check4(){
                            if(num>3){
                                alert('파일은 4개까지 등록 가능합니다.');
                            }
                        }
                     
		                
		                function displayFile(){
                            console.log(file);
		                    let fileType = file.type;
                            let fileSize = file.size;
                            let fileName = file.name;
                            console.log(fileType);
                     
                            

		                    let validExtensions = ['image/jpeg', 'image/jpg', 'image/png'];
		                    
                            if(validExtensions.includes(fileType)){
		                        if(fileSize<10485760){

                                    let fileReader = new FileReader();
                                    let fileKB = Math.floor(fileSize /1000); 
                                    let str = '<li class="drop-img">';
                                    
                                        fileReader.onload = () => {
                                            let fileURL = fileReader.result;
                                            str += '<img src="'+fileURL+'" alt="고장">';
                                            str += '<div>';
                                            str += '<span class="progress-name">'+fileName+' '+fileKB+'KB'+'</span>'
                                            str += '</div>';
                                            str += '<span class="delete-img" onclick="delImg(this);">x</span>';
                                            str += '</li>';
                                            $(str).appendTo(dropArea);
                                            num++
                                            $('.upload-label').attr("for","upfile"+num);  
                                
                                        }
                                        fileReader.readAsDataURL(file);
                         
                      
                                        dragArea.classList.remove('active');
                                        beforeDrop.style.display='none';
                                        dropArea.style.display='flex';
                             
                                    }else{
                                        alert('파일은 10MB이하의 크기만 등록 가능합니다.');
		                                dragArea.classList.remove('active');
                                    }
		                    }else{
		                         alert('이 파일은 Image 파일이 아닙니다.');
		                         dragArea.classList.remove('active');
		                    }

		                }
                 
                        function delImg(inputfile){
                            let index=$(inputfile).parent('li').index();
                            $(inputfile).parent('li').remove();

                            $('#upfile'+index).val("");
                            console.log($('#upfile'+index));
                            $('.upload-label').attr("for","upfile"+index);
                            num--;
                        }

        
		            </script> 
                    

                



                    <div class="enroll-bid">
                        <h3>◆ 경매설정</h3>
                        <div class="start-price">
                            <div class="sp-1 black-area">
                                * 시작가
                            </div>
                            <div class="sp-2">
                                <input type="text" class="price1" required name="proPrice" maxlength="8" oninput="numberMaxLength(this);">원 
                                <span class="kor-no" id="ptext0"></span>
                            </div>
                        </div>
                   
                        <div class="wish-price">
                            <div class="wp-1 black-area">
                                * 즉시구매
                            </div>
                            <div class="wp-2">
                                <input type="radio" name="wish" id="wp-yes" checked><span> 가능</span>
                                <input type="radio" name="wish" id="wp-no" ><span> 불가능</span>

                                <div class="wp-price">
                                    <input type="text" class="price2" name="wishPrice" required maxlength="8" oninput="numberMaxLength(this);">원
                                    <span class="kor-no" id="ptext1"></span>
                                </div>
                            </div>
                        </div>
                        <script>
                            $('#wp-yes').on("click",function(){
                         
                                $('.wp-price').css("display","block");
                                $('.price2').val("");
                                $('.price2').attr('required',true);
                                console.log($('.price2'));

                            });
                            $('#wp-no').on("click",function(){
                               console.log("111");
                                $('.wp-price').css("display","none");
                                $('.price2').attr('required',false);
                                $('.price2').val("0");
                                $('#ptext1').empty();
                            });
                            $('.price2').on("focusout",function(){
                                var price1 = parseInt($('.price1').val().replaceAll(',',''));
                                var price2 = parseInt($('.price2').val().replaceAll(',',''));
                                console.log(price1);
                                console.log(price2);
                                if((price2<price1)&&(price1!=0)){
                                    alert('즉시구매가는 시작가보다 낮게 설정할 수 없습니다.');
                                    console.log($('.price2').val());
                                    console.log($('.price1').val());
                                    $('.price2').val("");
                                    $('#ptext1').empty();
                                    setTimeout(function(){
                                        $('.price2').focus();
                                    });
                                }
                             
                            })
                            $('.price1').on("focusout",function(){
                                var price1 = parseInt($('.price1').val().replaceAll(',',''));
                                var price2 = parseInt($('.price2').val().replaceAll(',',''));
                                
                                if((price1>price2)&&(price2!=0)){
                                    alert('시작가는 즉시구매가보다 높게 설정할 수 없습니다.');
                                    $('.price1').val("");
                                    $('#ptext0').empty();
                                    setTimeout(function(){
                                        $('.price1').focus();
                                    });
                                }
                            })
                                    
                        </script>
                        <div class="bid-date">
                            <div class="bd-1 black-area">
                                * 경매기간
                            </div>
                            <div class="bd-2">
                                <select name="bidDate" id="bidDate">
                                    <option value="3">3일</option>
                                    <option value="4">4일</option>
                                    <option value="5">5일</option>
                                    <option value="6">6일</option>
                                    <option value="7">7일</option>
                                    <option value="8">8일</option>
                                    <option value="9">9일</option>
                                    <option value="10">10일</option>
                                </select>
                                <span>※물품등록을 한 이후부터 적용됩니다. 물품등록 후 5분 동안만 삭제가 가능하며, 그 이후에는 수정/삭제 불가하오니, 등록 시에 주의하세요!</span>
                            </div>
                        </div>
                    </div>
                    <div class="enroll-shipping">
                        <h3>◆ 배송설정</h3>
                        <div class="shipping-type">
                            <div class="st-1 black-area">
                                * 배송방법
                            </div>
                            <div class="st-2">
                                <input type="radio" name="tradeCateNo" value="1" id="stype-1" checked><span> 택배</span>
                                <input type="radio" name="tradeCateNo" value="2" id="stype-2" ><span> 직거래</span>
                            </div>
                        </div>
                        <div class="shipping-price">
                            <div class="shp-1 black-area">
                                * 비용부담
                            </div>
                            <div class="shp-2">
                                <div class="shp-price">
                                    <input type="text" class="price3" name="postPrice" maxlength="8" oninput="numberMaxLength(this);">원
                                    <span class="kor-no" id="ptext2"></span>
                                </div>
                            </div>
                        </div>
                        <script>
                            $('#stype-1').on("click",function(){
                                console.log("111");
                                $('.shp-price').css("display","block");
                                $('.price3').attr('required',true);
                                $('.price3').val("");

                            });
                            $('#stype-2').on("click",function(){
                                $('.shp-price').css("display","none");
                                $('.price3').val("0");
                                $('#ptext2').empty();
                            });
                        </script>
                      
                    </div>
                    <span class="btn-area">
                        <button type="submit">확인</button>
                        <button type="button" onclick="location.href='${pageContext.request.contextPath }'">취소</button>
                    </span>
                    <script>
                        $(':submit').on('click',function(){
                            console.log("1111");
                            $('.price1').val($('.price1').val().replaceAll(',',''));
                            $('.price2').val($('.price2').val().replaceAll(',',''));
                            $('.price3').val($('.price3').val().replaceAll(',',''));
                            console.log($('.price1'));
                            console.log($('.price2'));
                            console.log($('.price3'));
                        })
                    </script>
                
                <script>
                    //input[type=number] 글자수 제한
                    function numberMaxLength(e){
                        if(e.value.length > e.maxLength){
                            e.value = e.value.slice(0, e.maxLength);
                        }
                        if(e.value.length==1){
                            e.value = e.value.replace(/[0]/g,'');
                        }
                        e.value = e.value.replace(/[^0-9.]/g, '').replace(/(.*)\./g, '$1');
                        e.value = e.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }
                    
                    //가격 표시
                    $('.price1').on("keyup",function(){
                        let price =$('.price1').val().replace(/[^\d]+/g, "");
                        let p1 = price.substr(price.length-4);
                        let p2 = price.substr(0,price.length-4);
                        if(price.length>4){
                            $(this).next().text(p2+"만 "+p1+"원");
                        }else{
                            $(this).next().text(price+"원");
                        }
                    });
                    $('.price2').on("keyup",function(){
                        let price =$('.price2').val().replace(/[^\d]+/g, "");
                        let p1 = price.substr(price.length-4);
                        let p2 = price.substr(0,price.length-4);
                        if(price.length>4){
                            $(this).next().text(p2+"만 "+p1+"원");
                        }else{
                            $(this).next().text(price+"원");
                        }
                    });
                    $('.price3').on("keyup",function(){
                        let price =$('.price3').val().replace(/[^\d]+/g, "");
                        let p1 = price.substr(price.length-4);
                        let p2 = price.substr(0,price.length-4);
                        if(price.length>4){
                            $(this).next().text(p2+"만 "+p1+"원");
                        }else{
                            $(this).next().text(price+"원");
                        }
                    });
                    
                </script>
                </form>
            </div>


            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>
        
 