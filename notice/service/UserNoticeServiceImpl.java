package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.UserNoticeCriteria;
import org.zerock.domain.UserNoticeVO;
import org.zerock.mapper.UserNoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
@Transactional
public class UserNoticeServiceImpl implements UserNoticeService {


		// @Setter(onMethod_ = @Autowired)
		// Spring 4.3 이상에서는 단일 파라미터를 받는 생성자의 경우 자동 처리
		// (파라미터를 자동으로 주입할 수 있음. 즉, 위에 @Setter 구문 안써도 됨)
		private UserNoticeMapper mapper;

		// 특정 글 상세조회 작업의 기능 구현
		@Override
		public UserNoticeVO get(Long nobno) {
			log.info("get... 특정 글 내용을 조회 합니다!" + nobno);
			return mapper.read(nobno);
		}

		// 목록보기에 페이징이 적용되는 작업의 기능 구현
		@Override
		public List<UserNoticeVO> getList(UserNoticeCriteria cri) {
			log.info("get List with criteria : " + cri);
			return mapper.getListWithPaging(cri);
		}

		// 전체 데이터 수를 구해주는 작업의 기능 구현
		@Override
		public int getTotal(UserNoticeCriteria cri) {
			log.info("get total count : 전체데이터 수를 구해줍니다");
			return mapper.getTotalCount(cri);
		}
}


