import React, { useState, useEffect } from 'react';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { Link } from 'react-router-dom';
import Header from '../../components/Header';
import Footer from '../../components/Footer';
import AdminNoticeItem from '../../components/AdminNoticeItem';
import { Pagination, PaginationItem, PaginationLink } from 'reactstrap';

const ANList = () => {
  const [aNotice, setANotice] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [noticesPerPage] = useState(10);
  const [totalPages, setTotalPages] = useState(0);

  useEffect(() => {
    fetch("http://localhost:9005/admin/adminNotice")
      .then((res) => res.json())
      .then((res) => {
        console.log("Total Notices:", res.totalNotices);
        setTotalPages(Math.ceil(res.totalNotices / noticesPerPage));
        
        // 페이지 수를 설정한 후에 공지사항 목록을 불러오도록 변경
        fetch(`http://localhost:9005/admin/adminNotice?page=${currentPage - 1}&size=${noticesPerPage}`)
          .then((res) => res.json())
          .then((res) => {
            console.log("Fetched Notices:", res);
            setANotice(res);
          });
      });
  }, [currentPage, noticesPerPage]);

  const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
  };

  const renderPageNumbers = () => {
    const pageNumbers = [];
    for (let i = 1; i <= totalPages; i++) {
      pageNumbers.push(
        <PaginationItem key={i} active={i === currentPage}>
          <PaginationLink onClick={() => handlePageChange(i)}>
            {i}
          </PaginationLink>
        </PaginationItem>
      );
    }
    console.log("Page Numbers:", pageNumbers); // 확인 포인트 추가
    return pageNumbers;
  };

    return (
      <div className='wrap'>
        <Header />
        <Container className='mt150'>
          <Row className='mb80'>
            <Col md={4} className='antitle'>공지사항</Col>
          </Row>
          <Row className='antop btnPurple fontPurple mb10'>
              <Col xs={1} className='anTextLeft '>번호</Col>
              <Col xs={7} className='anTextCenter'>제목</Col>
              <Col className='anTextLeft anTextWriter'>작성자</Col>
              <Col className='anTextLeft'>등록일</Col>
          </Row>
          {aNotice.map((aNotice) => (
          <AdminNoticeItem key={aNotice.nobno} aNotice={aNotice} />
        ))}
        <Pagination className='unPagination'>
          <PaginationItem disabled={currentPage === 1}>
            <PaginationLink previous onClick={() => handlePageChange(currentPage - 1)} />
          </PaginationItem>
          {renderPageNumbers()}
          <PaginationItem disabled={currentPage === totalPages}>
            <PaginationLink next onClick={() => handlePageChange(currentPage + 1)} />
          </PaginationItem>
        </Pagination>

        <Row xs="auto" className="anWriteParent">
          <Col className='mt20'><Link to="/admin/anSaveForm" className='anwrite'>글쓰기</Link></Col>
        </Row>
        </Container>
        <Footer />
      </div>
    );
};

export default ANList;