<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 헤더 인클루드 추가 -->
<%@include file="../includes/header.jsp" %> 

<link rel="stylesheet" href="/resources/pays/payment.css">

<!-- 결제하기 기능 구현을 위한 스크립트 시작 -->
<!-- https://portone.gitbook.io/docs/sdk/javascript-sdk-old -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/metismenu@3.0.6/dist/metisMenu.min.js"></script>
<script type="text/javascript">

function fn_buy() { 
    // https://portone.gitbook.io/docs/auth/guide/2.
    var IMP = window.IMP;
    IMP.init('imp46788185'); // portone 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다.
    // var selectedValue = document.getElementById("month").value;
    var monthValue = document.querySelector('input[name="month"]:checked').value; // 구독 개월수에 대한 변수
    var buyerNameValue = document.getElementById("buyerName").value; // 구매자에 대한 변수
    var buyerAddrValue = document.getElementById("buyerAddr").value; // 구매자 주소에 대한 변수
    var buyerEmailValue = document.getElementById("buyerEmail").value; // 구매자 이메일에 대한 변수

    var price = 0;
    
    if (monthValue == 3) {
        price = 20000;
    } else if (monthValue == 6) {
        price = 39000;
    } else if (monthValue == 12) {
        price = 49000;
    } else {
    	price = 0;
    }
    console.log("price3 : " + price);
    var paidValue = Number(price);
    console.log(typeof paidValue);
    console.log(typeof price);
    
 	// customer_uid 생성 (로그인이 구현되어 있다면 해당 정보를 가져와 사용할 수도 있음)
    // var customer_uid = generateUniqueID(); // 적절한 방법으로 유니크한 값 생성

    // https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md#pc-mobile
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
        name : monthValue + '개월 구독',
        amount : paidValue,
        buyer_email : buyerEmailValue,
        buyer_name : buyerNameValue,
        buyer_addr : buyerAddrValue,
        buyer_postcode : '123-456',
        // https://portone.gitbook.io/docs/auth/guide/3.
        m_redirect_url: "/pays/paymentDone.do",
    }, function(rsp) {
    	console.log("price 1: " + price);
        console.log("IMP response: ", rsp);
        if (rsp.success) {	
            var paymentInfo = {
                imp_uid: rsp.imp_uid, // 시리얼번호 or 가맹점번호
                merchant_uid: rsp.merchant_uid, // 주문번호
                name: monthValue + '개월 구독', // 상품명
                amount: paidValue, // 상품가격
                apply_num: rsp.apply_num, //  신용카드 승인번호
                buyer_name: buyerNameValue, // 구매자 이름
                buyer_addr: buyerAddrValue, // 구매자 주소
                buyer_email: buyerEmailValue, // 구매자 이메일
                paidd_at: new Date() // 결제 날짜
            }
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            $.ajax({
                url: "/pays/paymentProcess.do", //cross-domain error가 발생하지 않도록 주의해주세요
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify(paymentInfo),
                success: function (data, textStatus) {
                    console.log(paymentInfo);
                    
                 	// 결제 정보를 세션에 저장
                    sessionStorage.setItem('paymentInfo', JSON.stringify(paymentInfo));
                    location.href = "/pays/paymentDone.do";
                },
                error: function (e) {
                    console.log(e);
                }
            });
        } else {
            alert("결제 실패 : " + rsp.error_msg);
        }
    });
}

function generateUniqueID() {
    // 적절한 방법으로 유니크한 값 생성 (예: timestamp + 랜덤 문자열)
    return new Date().getTime() + '_' + Math.random().toString(36).substr(2, 9);
}

</script>
<!-- 결제하기 기능 구현을 위한 스크립트 끝 -->
</head>

<!-- 네비 인클루드 추가 -->
<%@ include file="../includes/nav.jsp"%>

<div id="payment" class="container">
	<div class="row paHeader">
	    <div class="col paLeft">
	    	<img class="paOrder" alt="결제/주문 아이콘" src="/resources/images/payment_icon.svg">
	      	<span>주문/결제</span>
	    </div>
	    <div class="col paRight">
	      	결제완료
    	</div>
    </div>
    <form name="month">
	    <h2 class="h2 paTableH2">구독상품 선택</h2>
	    <table class="table paTable">
		  <thead>
		    <tr class="paTableTh">
		      <th scope="col">구독선택</th>
		      <th scope="col">구독기간</th>
		      <th scope="col">구독혜택</th>
		      <th scope="col">구독금액</th>
		      <th scope="col">배송구분</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class="paTableTr">
		      <td><input type="radio" name="month" value="3" checked></td>
		      <td scope="row">3개월 구독</td>
		      <td>720p & Standard</td>
		      <td>20,000원</td>
		      <td>택배</td>
		    </tr>
		    <tr class="paTableTr">
		      <td><input type="radio" name="month" value="6"></td>
		      <td scope="row">6개월 구독</td>
		      <td>1080p & Premium</td>
		      <td>39,000원</td>
		      <td>택배</td>
		    </tr>
		    <tr class="paTableTr">
		      <td><input type="radio" name="month" value="12"></td>
		      <td scope="row">12개월 구독</td>
		      <td>4K+HDR & Premium</td>
		      <td>49,000원</td>
		      <td>택배</td>
		    </tr>
		  </tbody>
		</table>
	</form>
	<div>
		<h2 class="h2 paSaleH2">할인혜택 적용</h2>
		<div class="paSale">
			<p class="paSaleText">술결 협력 업체 페이지에 회원가입해보세요. 회원 구매 시 할인 쿠폰 및 적립금, 마일리지 등의 다양한 혜택이 있습니다. </p>
			<div class="row justify-content-center">
				<div class="col-2 paSaleBox" >
				 	<a href="#">회원혜택</a>
				</div>
				<div class="col-2 paSaleBox">
					<a href="#">협력업체</a>
				</div>
				<div class="col-2 paSaleBox paSaleLast">
					<a href="#">적립금 확인</a>
				</div>
			</div>
		</div>
	</div>
	<div>
		<h2 class="h2 paBuyerH2">주문자 정보</h2>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				주문하시는 분
			</div>
			<input class="col-8 paBuyerRight" name="buyerName" id="buyerName" placeholder="이름을 입력하세요" />
		</div>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				주소
			</div>
	    	<input class="col-8 paBuyerRight" name="buyerAddr" id="buyerAddr" placeholder="도로명주소를 입력하세요" />
		</div>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				이메일
			</div>
	    	<input class="col-8 paBuyerRight" name="buyerEmail" id="buyerEmail" placeholder="이메일을 입력하세요" />
		</div>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				전화번호
			</div>
	    	<input class="col-8 paBuyerRight"placeholder="- 제외 전화번호를 입력하세요" />
		</div>
	</div>
	<div class="paDeliTop">
		<h2 class="h2 paDeliH2">배송지 정보</h2>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				받으시는 분
			</div>
			<input class="col-8 paBuyerRight"placeholder="이름을 입력하세요" />
		</div>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				주소
			</div>
	    	<input class="col-8 paBuyerRight"placeholder="도로명주소를 입력하세요" />
		</div>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				이메일
			</div>
	    	<input class="col-8 paBuyerRight"placeholder="이메일을 입력하세요" />
		</div>
		<div class="row justify-content-start paBuyer">
			<div class="col-4 paBuyerLeft">
				배송메모
			</div>
	    	<input class="col-8 paBuyerRight"placeholder="배송시 참고사항을 작성해주세요" />
		</div>
	</div>
	
	<div class="row justify-content-center paBtnContent paEncase">
		<div class="col-2 paAbout" >
			<a href="/pages/about">처음으로</a>
		</div>
		<div class="col-2 paBtn">
    		<button type="button" onclick="fn_buy()">결제하기</button>
		</div>
	</div>
	
</div>

<!-- 푸터 인클루드 추가 -->
<%@ include file="../includes/footer.jsp"%>