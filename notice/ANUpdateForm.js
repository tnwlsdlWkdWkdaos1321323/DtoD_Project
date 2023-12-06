import React from 'react';
import { useEffect } from 'react';
import { useState } from 'react';
import { Button, Container } from 'react-bootstrap';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import '../../css/notice_css/anUpdate.css';
import '../../css/pages_css/reset.css';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

const ANUpdateForm = (props) => {

    const [aNotice, setANotice] = useState({
        notitle:'',
        nocontent:'',
        nowriter:'',
    });

    const nobno = props.match.params.nobno;

    useEffect(() => {
        fetch("http://localhost:9005/admin/adminNotice/"+nobno).then(res => res.json()).then(res => {
            setANotice(res);
        });
    }, []);

    const changeValue = (e) => {
        e.preventDefault();
        setANotice({
            ...aNotice,
            [e.target.name]: e.target.value
        })
    }

    const submitANotice = (e) => {
        e.preventDefault(); // submit이 action을 안타고 자기 할일을 그만함.
        fetch("http://localhost:9005/admin/adminNotice/"+nobno,{
            method: "PUT",
            headers:{
                "Content-Type": "application/json; charset=utf-8"
            }, 
            body: JSON.stringify(aNotice) // java script object를 json으로 변경해서 던진다는 것. 
        }).then(res => {
            console.log(1,res);
            if(res.status === 200){
                return res.json();
            }else{
                return null;
            }
        }).then(res=> { // Catch는 여기서 오류가 나야 실행됨. 
            console.log(2,res);
            if(res !== null){
                props.history.push("/admin/adminNotice/"+nobno);
            }else{
                alert("공지사항 수정에 실패하였습니다.");
            }
        });
    }

    return (
        <>
        <Header />
        <Container>
        <Form onSubmit={submitANotice} className='anUpdate mt100 mb150'>
            
            <Form.Group className="mb-3 formSmall anUpTitle mt25" controlId="exampleForm.formGroupTitle">
                <Form.Control type="text" name="notitle" onChange={changeValue} value={aNotice.notitle} />
            </Form.Group>
            <Form.Group className="mb-3 anUpContent" controlId="exampleForm.formGroupwriter">
                <Form.Control as="textarea" name="nocontent" onChange={changeValue} value={aNotice.nocontent} rows={13} />
            </Form.Group>
                <Form.Group controlId="formFile" className="mb-3 file" id="file" name="file">
                <Form.Control type="file" />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.formGroupwriter">
                <Row xs="auto">
                    <Col className='anUpWriterParent'>
                        <Form.Control type="text" name="nowriter" onChange={changeValue} value={aNotice.nowriter} readOnly className='anUpWriter'/>
                    </Col>
                </Row>
            </Form.Group>

            <div className="d-grid gap-2">
                <Row xs="auto">
                    <Col md={{ span: 5, offset: 5 }}>
                        <Button type="submit" className='anUpBtn'>수정하기</Button>
                        <Link to='/admin/notice' className='anUpLink'>목록보기</Link>
                    </Col>
                </Row>
            </div>
        </Form>
        </Container>
        <Footer />
        </>
    );
};

export default ANUpdateForm;