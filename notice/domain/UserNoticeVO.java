package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserNoticeVO {

	private Long nobno; // 게시글 번호 필드 선언
	private String notitle; // 게시글 제목 필드 선언
	private String nocontent; // 게시글 내용 필드 선언
	private String  nowriter; // 게시글 작성자 필드 선언
	private Date nodate; // 게시글 등록일자 필드 선언
	private Date noupdate; // 게시글 수정일자(갱신일자) 필드 선언
	
	private int replyCnt; // 게시글의 댓글 숫자 필드(인스턴스 변수) 선언
	
}
