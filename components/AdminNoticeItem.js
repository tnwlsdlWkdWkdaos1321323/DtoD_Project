import React from 'react';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import '../css/notice_css/anList.css'
import '../css/pages_css/reset.css'

const AdminNoticeItem = (props) => {
    const {nobno, notitle, nowriter, nodate} = props.aNotice;

    return (
        <>
        <Container>
            <Row className='anItem'>
                <Col xs={1} className='colorMain anNum'>{nobno}</Col>
                <Col xs={7}><Link to={'/admin/adminNotice/'+nobno} className='anLink'>{notitle}</Link></Col>
                <Col>{nowriter}</Col>
                <Col>{nodate}</Col>
            </Row>
        </Container>
        </>
    );
};
 
export default AdminNoticeItem;