package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymementVO {
	
	String imp_uid; // 시리얼번호 or 가맹점번호
    String merchant_uid; // 주문번호
    String name; // 상품명
    int amount; // 상품가격
    String apply_num; // 신용카드 승인번
    String buyer_name; // 구매자 이름
    String buyer_addr; // 구매자 주소
    String buyer_email; // 구매자 이메일
    Date paidd_at; // 결제 날짜

}
