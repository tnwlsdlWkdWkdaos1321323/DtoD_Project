import React from 'react';
import { useState } from 'react';
import { Button, Container } from 'react-bootstrap';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { Link } from 'react-router-dom/cjs/react-router-dom';
import '../../css/notice_css/anSaveForm.css';
import '../../css/pages_css/reset.css';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

const ANSaveForm = (props) => {

    const [aNotice, setANotice] = useState({
        notitle:'',
        nocontent:'',
        nowriter:'',
    });

    const changeValue = (e) => {
        e.preventDefault();
        setANotice({
            ...aNotice,
            [e.target.name]: e.target.value
        })
    }

    const submitANotice = (e) => {
        e.preventDefault(); // submit이 action을 안타고 자기 할일을 그만함.
        fetch("http://localhost:9005/adminNotice",{
            method: "POST",
            headers:{
                "Content-Type": "application/json; charset=utf-8"
            }, 
            body: JSON.stringify(aNotice) // java script object를 json으로 변경해서 던진다는 것. 
        }).then(res => {
            console.log(1,res);
            if(res.status === 201){
                return res.json();
            }else{
                return null;
            }
        }).then(res=> { // Catch는 여기서 오류가 나야 실행됨. 
            console.log(2,res);
            if(res !== null){
                props.history.push("/admin/notice");
            }else{
                alert("공지사항 등록에 실패하였습니다.");
            }
        });
    }

    return (
        <>
        <Header />
        <Container>
        <Form onSubmit={submitANotice} className='anUpdate mt100 mb150'>
            <Form.Group className="mb-3 formSmall anUpTitle mt25" controlId="exampleForm.formGroupTitle">
                <Form.Control type="text" name="notitle" onChange={changeValue} placeholder='제목을 입력해주세요' />
            </Form.Group>
            <Form.Group className="mb-3 anUpContent" controlId="exampleForm.formGroupwriter">
                <Form.Control as="textarea" name="nocontent" onChange={changeValue} rows={13} placeholder='내용을 입력해주세요' />
            </Form.Group>
                <Form.Group controlId="formFile" className="mb-3" id="file" name="file">
                <Form.Control type="file" className='anSaFile' />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.formGroupwriter">
                <Row xs="auto">
                    <Col>
                        <Form.Control type="text" name="nowriter" onChange={changeValue} className='anSaWriter' placeholder='이름을 입력해주세요'/>
                    </Col>
                </Row>
            </Form.Group>
            

            <div className="d-grid gap-2">
                <Row xs="auto">
                    <Col md={{ span: 5, offset: 5 }}>
                        <Button type="submit" className='anSaBtn'>등록하기</Button>
                        <Link to='/admin/notice' className='anSaLink'>목록보기</Link>
                    </Col>
                </Row>
            </div>
        </Form>
        </Container>
        <Footer />
        </> 
    );
};

export default ANSaveForm;