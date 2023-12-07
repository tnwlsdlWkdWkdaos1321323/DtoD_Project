package com.springboot.dtod.notice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.springboot.dtod.notice.domain.AdminNotice;

// @Repository를 적어야 스프링 IoC에 빈으로 등록이 되는데
// JpaRepository를 extends(상속)하면 생략 가능함.
// JpaRepository는 CRUD 함수를 들고 있음
// AdminNoticeRepository는 interface로 만들어야 됨.
public interface AdminNoticeRepository extends JpaRepository<AdminNotice, Long>{

	// 페이징 처리를 위한 메서드 추가
	Page<AdminNotice> findAll(Pageable pageable);
	
}
