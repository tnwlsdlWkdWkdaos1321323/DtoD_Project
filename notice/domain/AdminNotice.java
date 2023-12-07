package com.springboot.dtod.notice.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@SequenceGenerator(
		name = "NOTICE_IDX_SEQ_GEN",
		sequenceName = "NOTICE_IDX_SEQ",
		initialValue = 1,
		allocationSize = 1		
		)
@Data
@Entity // 서버 실행시에 테이블이 생성됨
@Table(name="NOTICE")
public class AdminNotice {

	@Id // pk를 해당 변수로 하겠다. 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "NOTICE_IDX_SEQ")
	@SequenceGenerator(name = "NOTICE_IDX_SEQ", sequenceName = "NOTICE_IDX_SEQ_GEN", allocationSize = 1)
	@Column(name= "NOBNO")
	// Long을 대문자로 하는 이유는 래핑 클래스로 넣으면 나중에 id값에 null값을 넣을 수 있다. 
	// 나중에 관리하기에 편하다. 
	// 만약 int를 사용하면 0이 들어갈 수도 있다.
	private Long nobno;
	
	private LocalDate nodate;
	
	private LocalDate noupdate;
	
	@Column(name="NOTITLE", nullable=false, length = 200)
	private String notitle;
	
	@Column(name = "NOCONTENT", nullable = false, length = 2000)
	private String nocontent;
	
	@Column(name = "NOWRITER", nullable = false, length = 20)
	private String nowriter;
	
	// 어노테이션 PrePersist를 사용하면 엔티티의 특정 필드에 값을 설정하거나
	// 특정 로직을 실행하는 등의 작업을 수행할 수 있다.
	// 보통은 엔티티에 대한 초기화 작업이나 생성일자 설정 등에 활용한다. 
	@PrePersist 
	@Column(name="NODATE")
	protected void onCreate() {
		nodate = LocalDate.now();
	}
	
	@PreUpdate
	@Column(name="NOUPDATE")
	protected void onUpdate() {
		noupdate = LocalDate.now();
	}
	
}
