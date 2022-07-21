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
		<jsp:include page="../chartMenubar.jsp"/>
		
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
                        '', '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ''
                    ],
                    datasets: [
                        { //데이터
                            label: '물품 신규 등록', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	// 가장 큰것 *1.2
                            	${ctEnrollAmount.arr[0] },
                            	${ctEnrollAmount.arr[1] },
                            	${ctEnrollAmount.arr[2] },
                            	${ctEnrollAmount.arr[3] },
                            	${ctEnrollAmount.arr[4] },
                            	${ctEnrollAmount.arr[5] },
                            	${ctEnrollAmount.arr[6] },
                            	${ctEnrollAmount.arr[7] },
                            	${ctEnrollAmount.arr[8] },
                            	${ctEnrollAmount.arr[9] },
                            	${ctEnrollAmount.arr[10] },
                            	${ctEnrollAmount.arr[11] },
                            	${ctEnrollAmount.most }
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
                            label: '거래 완료',
                            fill: false,
                            data: [
                            	${ctTradeAmount.arr[0] },
                            	${ctTradeAmount.arr[1] },
                            	${ctTradeAmount.arr[2] },
                            	${ctTradeAmount.arr[3] },
                            	${ctTradeAmount.arr[4] },
                            	${ctTradeAmount.arr[5] },
                            	${ctTradeAmount.arr[6] },
                            	${ctTradeAmount.arr[7] },
                            	${ctTradeAmount.arr[8] },
                            	${ctTradeAmount.arr[9] },
                            	${ctTradeAmount.arr[10] },
                            	${ctTradeAmount.arr[11] },
                            	${ctTradeAmount.most }
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

         	<jsp:include page="../common/footer.jsp"/>
</body>
</html>