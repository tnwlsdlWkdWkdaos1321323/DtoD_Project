import axios from "axios";
import React from "react";
import '../../css/user_css/login.css';
import '../../css/pages_css/reset.css';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from "react-bootstrap/Button";
import { Input } from "reactstrap";
import { Link, useHistory } from "react-router-dom";
import Header from '../../components/Header';
import Footer from '../../components/Footer';
import { useState, useEffect } from "react";

const Login = () => {
    const [isLoggedIn, setIsLoggedIn] = useState(false);
    const history = useHistory();

    const fn_signIn = () => {
        const userId = document.getElementById('userId').value;
        const userPassword = document.getElementById('userPassword').value;
        
        if (userId.length < 1) {
            alert("아이디를 입력해 주세요!");
            document.getElementById("userId").focus();
            return;
        }
        
        if (userPassword.length < 1) {
            alert("비밀번호를 입력해 주세요!");
            document.getElementById("userPassword").focus();
            return;
        }
        
        const form = new FormData();
        form.append('userId', userId);
        form.append('userPassword', userPassword);
        
        console.log("click login");
        
        axios.post('http://localhost:9005/loginAction.do', form, {
            headers: {
                'Content-type': 'multipart/form-data',
            }
        })
        .then((res) => {
            console.log(res.data);
            if (res.data !== "N") {
                if (userId === "admin") {
                    alert("관리자 계정으로 로그인하셨습니다!");
                    sessionStorage.setItem('isLoggedIn', 'true'); // 문자열로 저장
                    sessionStorage.setItem("user_Id", userId);
                    sessionStorage.setItem("name", res.data);
                    history.push("/");
        
                    console.log("로그인 성공 - setIsLoggedIn(true) 호출 전");
                    setIsLoggedIn(true); // 로그인 성공 시 상태를 변경
                    console.log("로그인 성공 - setIsLoggedIn(true) 호출 후");
                } else {
                    alert("일반 사용자입니다 다시 로그인 해주세요!");
                }
            } else {
                alert("존재하지 않는 계정입니다!");
            }
        })
        .catch((error) => {
            console.error("에러:", error);
        });
    };

    const fn_signOut = () => {
        console.log("로그아웃 버튼 클릭 확인");
        // 로그아웃 처리
        sessionStorage.removeItem("user_Id");
        sessionStorage.removeItem("name");
        sessionStorage.setItem('isLoggedIn', 'false'); // 문자열로 저장
    
        // React Router의 history 객체를 이용하여 페이지 이동
        history.push("/");
        console.log("로그아웃 후 isLoggedIn:", isLoggedIn); // 추가
        // history.push("/")가 완료된 이후에 상태 업데이트를 수행
        setIsLoggedIn(false); // 로그아웃 시 상태를 변경
    };
    
    // 추가: 로그아웃 후에 실행되는 useEffect
    useEffect(() => {
        // 세션 스토리지에서 로그인 상태를 가져옴
        const storedIsLoggedIn = sessionStorage.getItem('isLoggedIn');
        setIsLoggedIn(storedIsLoggedIn === 'true');
    }, []);

    return (
        <>
           <Header isLoggedIn={isLoggedIn} fn_signOut={fn_signOut} />
           <div className="login_header mt50">
                <p className="loginText pointFont bold pointColor">로그인</p>
           </div>
           {/* https://react-bootstrap.netlify.app/docs/layout/grid */}
           <Container fluid="sm" className="Font">
            <Row className="login_row mt25">
                <Col md={{span:4, offset:4}} id="login_div" >
                {/* https://react-bootstrap.netlify.app/docs/forms/form-control */}                
            <Form id='loginForm'>
                <Form.Group className="form-group mb-4">
                {/* https://reactstrap.github.io/?path=/docs/components-forms--input */}
                 <Input type="id" id="userId" placeholder="아이디를 입력해 주세요!" />
                </Form.Group>
                <Form.Group className="form-group mb-4">
                <Input type="password" id="userPassword" placeholder="비밀번호를 입력해 주세요!" />
                </Form.Group>
                <div className="form-group d-grid mb-4 ">
                    <Button id="id_btn" variant="primary" size="lg" onClick={fn_signIn} className="btn_login mt25">로그인</Button>
                </div>
                <div className="signup_center"><Link to="/" className="text_signup" >술결의 회원이 아니신가요? 지금 가입하세요!</Link></div> 
            </Form>
                </Col>
            </Row>
           </Container>
           <Footer />
        </>
    );
};

export default Login;