package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// Criteria는 '검색의 기준'을 의미하는데,
// 여기서는 페이징 처리에 필요한 파라미터인
// 페이지 번호(pageNum), 한페이지당 몇 개의 데이터(amount) 필드를 정의합니다.
@Getter
@Setter
@ToString
public class UserNoticeCriteria {

	private int pageNum; //페이징 처리에 필요한 "페이지 번호(pageNum)" 필드 선언
	private int amount; //페이징 처리에 필요한 "한 페이지당 몇 데이터 (amount)" 필드 선언
	
	private String type; //검색 조건 처리에 필요한  type 필드 선언
	private String keyword; //검색 조건 처리에 필요한 keyword 필드 선언
	
	// 아래에서 Criteria 생성자의 용도는
	// pageNum과 amount값을 전달받은 생성자 역할을 하며,
	// 기본값을 1페이지, 10개로 지정해서 처리합니다.
	public UserNoticeCriteria() {
		this(1, 10);
	}

	public UserNoticeCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	  // getTypeArr() 메서드는 검색 조건이 각 글자(T, C, W)로 구성되어 있으므로
	  // 검색 조건을 배열로 만들어서 한 번에 처리하기 위함입니다.
	  // getTypeArr()을 이용해서 MyBatis의 동적 태그를 활용할 수 있습니다.
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
}
