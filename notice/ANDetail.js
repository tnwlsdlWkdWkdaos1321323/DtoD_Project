import React, { useState, useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import '../../css/notice_css/anDetail.css'
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

const ANDetail = (props) => {

    const nobno = props.match.params.nobno;

    const [aNotice, setANotice] = useState({
        notitle:"",
        nocontent:"",
        nowriter:"",
        nodate:"",
        noupdate:""
    });

    useEffect(() => {
        fetch("http://localhost:9005/admin/adminNotice/"+nobno).then(res => res.json()).then(res => {
            setANotice(res);
        });
    }, []);

    const deleteANotice = () => {
        fetch("http://localhost:9005/admin/adminNotice/"+nobno, {
            method:"DELETE",
        }).then((res) => res.text()).then((res) => {
            if(res === "ok"){
                props.history.push("/admin/notice");
            }else{
                alert("삭제 실패하였습니다.");
            }
        });
    }

    const updateANotice = () => {
        props.history.push("/admin/updateForm/"+nobno);
    }

    return (
        <div>
            <Header />
            <Container className='mt100 mb150'>
                <Row >
                    <Col className='andTitle'>{aNotice.notitle}</Col>
                </Row>
                <Row xs="auto" className='anRow'>
                    <div>{aNotice.nodate}</div>
                </Row>
                <Row className='andContent'>
                    <Col>{aNotice.nocontent}</Col>
                </Row>
                <Row xs="auto" className='mt40'>
                    <Col md={{ span: 4, offset: 4 }}>
                        <Button onClick={updateANotice} className='andBtn'>수정하기</Button>
                        <Button onClick={deleteANotice} className='andBtn'>삭제하기</Button>
                        <Link to='/admin/notice' className='andLink'>목록보기</Link>
                    </Col>
                </Row>
            </Container>
            <Footer />
        </div>
    );
};

export default ANDetail;