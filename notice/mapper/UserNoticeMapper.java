package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.UserNoticeCriteria;
import org.zerock.domain.UserNoticeVO;

public interface UserNoticeMapper {
	
	// 페이징 처리를 위해 Criteria 타입을 파라미터로 사용하는 getListWithPaging() 추상 메서드 선언
	public List<UserNoticeVO> getListWithPaging(UserNoticeCriteria cri);
	
	// 상세보기(select) 처리를 위한 read() 추상 메서드 선언
	public UserNoticeVO read(Long nobno);
	
	//전체 데이터의 개수를 반환해주는 getTotalCount() 추상 메서드 정의
	public int getTotalCount(UserNoticeCriteria cri);
	
}
