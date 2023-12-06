import React from 'react';
import '../css/pages_css/main.css';
import Header from '../components/Header';
import Footer from '../components/Footer';

const Main = () => {
  return (
    <>
      <Header />
      {/* <img src='/gif/main1.mp4' alt='관리자 메인페이지 배너 이미지' className='main_banner_img'></img> */}
      <video autoPlay muted loop playsInline width="100%" src='/gif/main1.mp4' type="video/mp4" className='mainVideo' />
      <div className='banner_text'>
          <h2>Welcome to SulGyul</h2>
          <p>Explore the amazing features we offer.</p>
        </div>
      <Footer />
    </>
  );
};

export default Main;
