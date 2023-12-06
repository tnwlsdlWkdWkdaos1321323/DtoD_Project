import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import "../css/common.css";
import React, { useEffect, useState } from "react";

function Header({ fn_signOut }) {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  // 로그인 상태를 가져오는 useEffect
  useEffect(() => {
    // 세션 스토리지에서 로그인 상태를 가져옴
    const storedIsLoggedIn = sessionStorage.getItem('isLoggedIn');
    setIsLoggedIn(storedIsLoggedIn === 'true');
  }, [sessionStorage.getItem('isLoggedIn'), setIsLoggedIn]);

  // 추가: isLoggedIn이 변경될 때마다 호출되는 useEffect
  useEffect(() => {
    console.log('Header useEffect - isLoggedIn 상태 변경:', isLoggedIn);
}, [isLoggedIn]);

  // 여기에 위치한 console.log에서 에러가 발생하지 않아야 합니다.
  console.log('isLoggedIn:', isLoggedIn);

  return (
    <Navbar bg="light" expand="lg" id='nav'>
        <Container>
            <Navbar.Brand href="/" className='logo'><img src='/images/logo.svg' alt='로고이미지' /></Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="me-auto">
                    {isLoggedIn ? (
                        <>
                            <Nav.Link href="/" onClick={fn_signOut}>로그아웃</Nav.Link>
                            <Nav.Link href="http://localhost">사용자로 이동</Nav.Link>
                            <Nav.Link href="/admin/notice">공지사항</Nav.Link>
                            <Nav.Link href="/admin/contactUs">문의 관리</Nav.Link>
                            <Nav.Link href="/admin/subscribe">회원 구독 정보</Nav.Link>
                        </>
                    ) : (
                      <>
                        <Nav.Link href="/admin/login">로그인</Nav.Link>
                        <Nav.Link href="http://localhost">사용자로 이동</Nav.Link>
                      </>
                    )}
                </Nav>
            </Navbar.Collapse>
        </Container>
    </Navbar>
  );
}

export default Header;