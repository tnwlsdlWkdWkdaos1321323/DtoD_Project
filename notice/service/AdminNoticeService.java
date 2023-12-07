package com.springboot.dtod.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.springboot.dtod.notice.domain.AdminNotice;
import com.springboot.dtod.notice.repository.AdminNoticeRepository;

import lombok.RequiredArgsConstructor;

// 기능을 정의할 수 있고, 트랜잭션을 관리할 수 있음.

@RequiredArgsConstructor // final이 붙어 있는 애들한테 자동으로 constructor를 만들어준다. 
//AdminNoticeService가 IoC 컨테이너에 등록이 되어있다는 근거는 @Service이기 때문에 
// 그래서 스프링에서 뭔가 문제가 생겼을 때 @Service가 메모리에 떠있는지 확인해야 된다.
@Service 
public class AdminNoticeService {
	// 함수 => 송금() -> 레파지토리에 여러개의 함수 실행 -> commit or rollback
	
	private final AdminNoticeRepository anRepository;
	
	@Transactional // 서비스 함수가 종료될 때 commit할지 rollback할지 트랜잭션 관리하겠다. 
	public AdminNotice save(AdminNotice aNotice) { // save : 저장하기 
		return anRepository.save(aNotice);
	}
	
	// 주석 제외 아래 한 줄
	// JPA 변경감지라는 내부기능 활성화 X, update시의 정합성을 유지해줌. insert의 유령데이터현상(팬텀현상)을 막지 못한다.
	@Transactional(readOnly = true)  
	public AdminNotice select(Long nobno) { // select : 한건 가져오기
		return anRepository.findById(nobno)
				.orElseThrow(() -> new IllegalArgumentException("글 번호를 확인해주세요"));
	}
	
	@Transactional(readOnly = true) // select 할 때마다 readOnly를 걸면 됨
	public List<AdminNotice> selectAll(){ // selectAll : 모두 가져오기
		return anRepository.findAll();
	}
	
	@Transactional
	public AdminNotice update(Long nobno, AdminNotice aNotice) { // update : 수정하기
		// 더티체팅 update 치기
		// 데이터베이스에서 데이터를 가지고 오면 영속화됐다고 한다. 
		AdminNotice adnEntity = anRepository.findById(nobno)
				// 영속화(AdminNotice 오브젝트) -> 영속성 컨텍스트에 보관
				.orElseThrow(() -> new IllegalArgumentException("글 번호를 확인해주세요")); 
		adnEntity.setNotitle(aNotice.getNotitle());
		adnEntity.setNocontent(aNotice.getNocontent());
		adnEntity.setNowriter(aNotice.getNowriter());
		adnEntity.setNodate(aNotice.getNodate());
		adnEntity.setNoupdate(aNotice.getNoupdate());
		return adnEntity;
	} // 함수의 종료 => 트랜잭션이 종료 => 영속화 되어있는 데이터를 DB로 갱신(flush) => commit ====> 더티체킹
	
	@Transactional
	public String delete(Long nobno) { // delete : 삭제하기
		anRepository.deleteById(nobno); // 오류가 터지면 익셉션을 타니까 신경쓰지 말고
		return "ok"; // ok가 떨어지면 잘 된 것이다.
	}
	
	// 페이징 처리를 위해 메서드 추가
	@Transactional(readOnly = true)
	public Page<AdminNotice> selectAll(Pageable pageable) {
	    return anRepository.findAll(pageable);
	}
	
}
