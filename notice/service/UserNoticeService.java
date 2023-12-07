package org.zerock.service;

import java.util.List;

import org.zerock.domain.UserNoticeCriteria;
import org.zerock.domain.UserNoticeVO;

public interface UserNoticeService {
	
	// 상세보기를 위한 get() 추상 메서드 선언
	public UserNoticeVO get(Long nobno);
	
	// 목록보기에 페이징이 적용되는 getList() 추상 메서드 선언
	public List<UserNoticeVO> getList(UserNoticeCriteria cri);
	
	// 전체 데이터를 확인할 수 있는 getTotal() 추상 메서드 선언(페이징을 위해서 필요)
	public int getTotal(UserNoticeCriteria cri);
	
}

