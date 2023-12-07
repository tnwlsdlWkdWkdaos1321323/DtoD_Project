<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 헤더 인클루드 추가 -->
<%@include file="../includes/header.jsp" %> 

<link rel="stylesheet" href="/resources/pays/paymentSuccess.css">

<!-- 결제하기 기능 구현을 위한 스크립트 시작 -->
<!-- https://portone.gitbook.io/docs/sdk/javascript-sdk-old -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/metismenu@3.0.6/dist/metisMenu.min.js"></script>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
	//세션에서 결제 정보 가져오기
	var paymentInfo = JSON.parse(sessionStorage.getItem('paymentInfo'));
	
	// 가져온 결제 정보를 이용하여 화면에 출력
	if (paymentInfo) {
	    // 결제 정보를 HTML 화면에 표시
	    document.getElementById("subscriptionMonths").innerHTML = paymentInfo.name;
	    document.getElementById("paymentAmount").innerHTML = paymentInfo.amount + "원";
	    document.getElementById("buyerName").innerHTML = paymentInfo.buyer_name;
	    document.getElementById("buyerAddr").innerHTML = paymentInfo.buyer_addr;
	    document.getElementById("buyerEmail").innerHTML = paymentInfo.buyer_email;
	    document.getElementById("paymentDate").innerHTML = new Date(paymentInfo.paidd_at).toLocaleDateString();
	} else {
	    console.log("결제 정보가 없습니다.");
	}

});

</script>

</head>

<!-- 네비 인클루드 추가 -->
<%@ include file="../includes/nav.jsp"%>

<!-- 결제 정보를 표시할 부분 추가 -->
<div id="paymentInfo" class="container paymentSuccess">

	<div class="row paSHeader">
	    <div class="col paSLeft">
	      	<span>주문/결제</span>
	    </div>
	    <div class="col paSRight">
	    <img class="paSOrder" alt="결제완료아이콘" src="/resources/images/paymentSuccess_icon.svg">
	      	<span>결제완료</span>
    	</div>
    </div>
    <div class="row">
	    <div class="col align-self-center paSCheckP">
		    <img class="paSCheck" alt="결제 체크 아이콘" src="/resources/images/success_check.svg">
	    </div>
	 </div>
    	<div class="h3 pasH3">결제 처리가 정상적으로 완료되었습니다.<br> 술결을 구독해주셔서 감사합니다.</div>
    
	
	<div class="row">
		<div class="col-md-6 offset-md-3 bill">
			<h2 class="h2 pasH2">결제 정보</h2>
			<div class="billTextParent">
			   	<div class="row justify-content-center billText">
					<div class="col-4 billBold">
						* 구독 개월수 : 
					</div>
					<div class="col-4">
					 	<p id="subscriptionMonths"></p>
					</div>
				</div>
				<div class="row justify-content-center billText">
					<div class="col-4 billBold">
						* 결제금액 : 
					</div>
					<div class="col-4">
					 	<p id="paymentAmount"></p>
					</div>
				</div>
				<div class="row justify-content-center billText">
					<div class="col-4 billBold">
						* 구매자 이름 : 
					</div>
					<div class="col-4">
					 	<p id="buyerName"></p>
					</div>
				</div>
				<div class="row justify-content-center billText">
					<div class="col-4 billBold">
						* 구매자 주소 : 
					</div>
					<div class="col-4">
					 	<p id="buyerAddr"></p>
					</div>
				</div>
				<div class="row justify-content-center billText">
					<div class="col-4 billBold">
						 * 구매자 이메일 : 
					</div>
					<div class="col-4 ">
					 	<p id="buyerEmail"></p>
					</div>
				</div>
				<div class="row justify-content-center billText">
					<div class="col-4 billBold">
						* 결제일 : 
					</div>
					<div class="col-4 ">
					 	<p id="paymentDate"></p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div>
		
	</div>
   	
	<br>
	<div class="row justify-content-center paBtnContent paEncase">
		<div class="col-2 paAbout" >
			<a href="/pages/about">처음으로</a>
		</div>
		<div class="col-2 paBtn">
    		<a href="/pages/product">술결 상품</a>
		</div>
	</div>
</div>

	

<!-- 푸터 인클루드 추가 -->
<%@ include file="../includes/footer.jsp"%>