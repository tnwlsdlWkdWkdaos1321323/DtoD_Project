package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UNPageDTO {

	private int startPage; // 시작 페이지 필드 정의
	private int endPage; // 끝 페이지 필드 정의
	private boolean prev, next; // prev(이전), next(다음) 처리 필드 정의
	
	private int total; // 전체 데이터 수 필드 정의
	
	// pageNum(현재 페이지 번호), amount(페이지에서 보여주는 데이터 수)로
	// 구성된 Criteria 객체 정의
	private UserNoticeCriteria cri;

	public UNPageDTO(UserNoticeCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0))*10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) Math.ceil(((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = startPage > 1 ;
		
		this.next = endPage < realEnd;		
	}	
}


