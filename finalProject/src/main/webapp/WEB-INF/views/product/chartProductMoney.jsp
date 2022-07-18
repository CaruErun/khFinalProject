<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

    <style>

    </style>

</head>
<body>
		<jsp:include page="../customerInfoMenubar.jsp"/>
		
		<div style="width: 900px; height: 900px;">
			<!--차트가 그려질 부분-->
			<canvas id="myChart"></canvas>
		</div>
		
		<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ''
                    ],
                    datasets: [
                        { //데이터
                            label: '물품 등록 금액', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	${ctEnrollMoney.arr[0] },
                            	${ctEnrollMoney.arr[1] },
                            	${ctEnrollMoney.arr[2] },
                            	${ctEnrollMoney.arr[3] },
                            	${ctEnrollMoney.arr[4] },
                            	${ctEnrollMoney.arr[5] },
                            	${ctEnrollMoney.arr[6] },
                            	${ctEnrollMoney.arr[7] },
                            	${ctEnrollMoney.arr[8] },
                            	${ctEnrollMoney.arr[9] },
                            	${ctEnrollMoney.arr[10] },
                            	${ctEnrollMoney.arr[11] },
                            	${ctEnrollMoney.most }
                            	//x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(0, 0, 0, 0)'
                            ],
                            borderColor: [
                                //경계선 색상                               
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(0, 0, 0, 0)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        } ,
                        {
                            label: '거래완료 금액',
                            fill: false,
                            data: [                            	
                            	${ctTradeMoney.arr[0] },
                            	${ctTradeMoney.arr[1] },
                            	${ctTradeMoney.arr[2] },
                            	${ctTradeMoney.arr[3] },
                            	${ctTradeMoney.arr[4] },
                            	${ctTradeMoney.arr[5] },
                            	${ctTradeMoney.arr[6] },
                            	${ctTradeMoney.arr[7] },
                            	${ctTradeMoney.arr[8] },
                            	${ctTradeMoney.arr[9] },
                            	${ctTradeMoney.arr[10] },
                            	${ctTradeMoney.arr[11] },
                            	${ctTradeMoney.most }
                            ],
                            backgroundColor:[                       
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(0, 0, 0, 0)'
                            ],
                            borderColor:[                                 
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(0, 0, 0, 0)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>

</body>
</html>