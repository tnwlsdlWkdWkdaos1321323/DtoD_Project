package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.UNPageDTO;
import org.zerock.domain.UserNoticeCriteria;
import org.zerock.service.UserNoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class UserNoticeController {

	private UserNoticeService service;
	
	// Page300 : 페이징 매개변수 적용 /list 소스 코딩을 아래와 같이 5줄 추가해 줍니다.
	@GetMapping("/list")
	public void list(UserNoticeCriteria cri, Model model) {
		log.info("list 글 목록 조회를 처리합니다!" + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total 전체 데이터 수 = " + total);
		
													// total 변수 데이터수 = 123개로 가정함
//		model.addAttribute("pageMaker", new UNPageDTO(cri, 123));
		model.addAttribute("pageMaker", new UNPageDTO(cri, total)); 
	}
	
	// Page316 : 조회 페이지에서 다시 목록 페이지로 이동 : 페이지 번호 유지를 위한 BoardController 소스 코딩을 해줍니다.
	@GetMapping("/get")
	public void get(@RequestParam("nobno") Long nobno, @ModelAttribute("cri") UserNoticeCriteria cri, Model model) {
		log.info("/get 조회 처리");
		model.addAttribute("notice", service.get(nobno));
	}
	
}
