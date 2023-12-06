READ ME
===============================================================
-> 안드로이드앱(Front-end)
1. 컴파일 실행 환경 = JAVA SDK 1.6, ORACLE 11g, TOMCAT 9.0 , STS, React, android studio
2. 적용 기술 = SpringBoot, Mybatis, JAVA, android app, OracleDB, retrofit
3. 환경이 바뀌었을 때 수정해야할 사항들
- -> SignUpActivity 자바 파일에서 69번째 줄에
baseUrl("http://192.168.0.54:9005/")
아이피를 본인 아이피로 변경
===============================================================
-> SpringBoot(Back-end)
1. STS - File - import - General - Existing Projects into Workspace 파일 추가

=> 임포트 후
1) Properties - java build path - JRE System Library [jdk1.8.0_221], Apache Tomcat v9.0, JUnit4, Maven Dependencies, Web App Libraries 있는지 확인 후 없으면 추가
2) Project Facets - JPA 2.1 버전 추가 --> 오른쪽 Runtimes Apache Tomcat v9.0 확인 후 없으면 추가
3) Web Project Settings --> Context root: /로 변경

=> 아파치톰캣 서버 설정
Servers - Tomcat v9.0... 더블 클릭,  Module 클릭, 우측 "Edit.." 버튼 클릭! - Path:를 / 로 변경 후 OK 버튼 클릭 후 저장
===============================================================
-> Oracle(DB)< (dtod_sql파일의 1)유저생성 참고)
1. 술결을 사용할 사용자 추가
--권한 부여
sqlplus system/System1234
- - soju 계정이 있을 경우
drop user soju cascade;
- -admin계정생성

create user soju IDENTIFIED by beer
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP;

- - admin 계정 권한부여
GRANT CONNECT, DBA, RESOURCE TO soju;
- -admin계정 접속
conn soju/beer;
- - 계정 확인
show user;
===============================================================
->React npm (VS Code)

1) router-dom
npm install -save react-router-dom@5.3.0
npm install redux react-redux

2) reactstrap
npm install -save reactstrap@8.4.1

3) bootstrap
npm install -save bootstrap@4.4.1

4) axios
npm install axios
	
5) fontawesome (3가지)
npm i @fortawesome/fontawesome-svg-core
npm i @fortawesome/free-solid-svg-icons @fortawesome/free-regular-svg-icons @fortawesome/free-brands-svg-icons
npm i @fortawesome/react-fontawesome

6) aos
npm install aos --save

7) slick
npm install react-slick --save
npm install slick-carousel

8) swiper
npm install swiper
