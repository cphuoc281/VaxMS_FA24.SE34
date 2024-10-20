import React from 'react';
import Slider from 'react-slick';
import image1 from '../../assest/new1.jpg';
import image2 from '../../assest/new2.jpg';
import image3 from '../../assest/new3.jpg';
import NextArrow from './NextArrow'; // Assuming you have a custom NextArrow component
import PrevArrow from './PrevArrow'; // Assuming you have a custom PrevArrow component

const NewsCarousel = () => {
  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 3, // Hiển thị 3 bài báo cùng lúc
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 4000,
    nextArrow: <NextArrow />,
    prevArrow: <PrevArrow />,
  };

  return (
    <div className="news-carousel">
      <Slider {...settings}>
        <div className="news-item">
          <img src={image1} alt="News 1" />
          <h3>Tiêu đề tin tức 1</h3>
          <p>Mô tả tin tức 1...</p>
        </div>
        <div className="news-item">
          <img src={image2} alt="News 2" />
          <h3>Tiêu đề tin tức 2</h3>
          <p>Mô tả tin tức 2...</p>
        </div>
        <div className="news-item">
          <img src={image3} alt="News 3" />
          <h3>Tiêu đề tin tức 3</h3>
          <p>Mô tả tin tức 3...</p>
        </div>
        {/* Thêm các bài báo khác */}
      </Slider>
    </div>
  );
};

export default NewsCarousel;