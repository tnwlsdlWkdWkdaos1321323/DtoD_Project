package com.springboot.dtod.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.springboot.dtod.notice.domain.AdminNotice;
import com.springboot.dtod.notice.repository.AdminNoticeRepository;
import com.springboot.dtod.notice.service.AdminNoticeService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor // final이 붙은 애의 생성자를 받아서 처리해준다.
@CrossOrigin(origins = "*") // 자바스크립트로 아래 mapping을 요청할 수 있게 하려고 사용
			 //외부에서 들어오는 자바스크립트 요청을 허용해준다.(리액트와 연결할 때 필요함)
@RestController
public class AdminNoticeController {

	private final AdminNoticeService anService;
	
	@Autowired
	private AdminNoticeRepository anRepository;

	// security(라이브러리 전용0 - CORS 정책을 가지고 있음(시큐리티가 CORS를 해재해줘야됨)
	// AdminNoticeController 진입 직전
	
	@PostMapping("/adminNotice")
	public ResponseEntity<?> save(@RequestBody AdminNotice aNotice){
		return new ResponseEntity<>(anService.save(aNotice), HttpStatus.CREATED); // 저장하기 201
	}

	@GetMapping(value = "/adminNotice")
	public ResponseEntity<?> findAll(){
	    return new ResponseEntity<>(anService.selectAll(), HttpStatus.OK); // 모두가져오기 200
	}

	@GetMapping("/admin/adminNotice/{nobno}")
	public ResponseEntity<?> findById(@PathVariable Long nobno){
		return new ResponseEntity<>(anService.select(nobno), HttpStatus.OK); // 한건 가져오기 200
	}

	@PutMapping("/admin/adminNotice/{nobno}")
	public ResponseEntity<?> update(@PathVariable Long nobno, @RequestBody AdminNotice aNotice){ // update할 때는 데이터를 두 건 받아야 된다.
		return new ResponseEntity<>(anService.update(nobno, aNotice), HttpStatus.OK); // 수정하기 200
	}

	@DeleteMapping("/admin/adminNotice/{nobno}")
	// id로 한 건만 찾아서 지우는 것이기 때문에 이름을 deleteById라고 했다.
	public ResponseEntity<?> deleteById(@PathVariable Long nobno){   
		return new ResponseEntity<>(anService.delete(nobno), HttpStatus.OK); // 삭제하기 200
	}
	
	// 페이징 처리를 위해 추가
	@GetMapping("/admin/adminNotice")
	public ResponseEntity<?> findAllPaged(@RequestParam(defaultValue = "0") int page,
	                                      @RequestParam(defaultValue = "10") int size) {
	    Page<AdminNotice> pagedResult = anService.selectAll(PageRequest.of(page, size));
	    return new ResponseEntity<>(pagedResult.getContent(), HttpStatus.OK);
	}

}
