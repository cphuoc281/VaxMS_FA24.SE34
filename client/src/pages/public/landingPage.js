import React, { useState } from 'react';
import VaccineSection from '../components/vaccineSection';
import ServiceSection from '../components/serviceSection';
import NewsSection from '../components/newsSection';
import ChatBox from '../components/chatbox';
import aboutImage from '../../assest/images/about-image.jpg'; // Hình ảnh của bạn

const LandingPage = () => {
  const [showMore, setShowMore] = useState(false);

  const toggleShowMore = () => {
    setShowMore(!showMore);
  };

  return (
    <div className="landing-page">
      {/* About Section */}
      <section className="about-section">
        <div className="container-web about-container">
          <h2 className="about-title">GIỚI THIỆU</h2>
          <div className="about-content">
            <div className="about-text">
              <p>
                Hệ thống tiêm chủng VaxMS được ra đời với mục tiêu cung cấp giải pháp quản lý tiêm chủng hiện đại, 
                nhằm đáp ứng nhu cầu ngày càng cao về sức khỏe và phòng bệnh tại Việt Nam. Trong bối cảnh các dịch bệnh gây nguy hiểm, 
                VaxMS đảm bảo mang đến những giải pháp tốt nhất cho việc tiêm chủng an toàn và hiệu quả.
              </p>
              {showMore && (
                <p>
                  VaxMS cung cấp giải pháp quản lý tiêm chủng hiện đại, giúp tối ưu hóa quy trình đăng ký, tra cứu và nhắc lịch tiêm chủng.
                  Hệ thống đảm bảo chất lượng vắc xin với đầy đủ chứng nhận an toàn và quy chuẩn y tế, giúp khách hàng an tâm hơn trong việc lựa chọn vắc xin phù hợp.
                </p>
              )}
              <button onClick={toggleShowMore} className="show-more-btn">
                {showMore ? 'Thu gọn' : 'Xem thêm'}
              </button>
            </div>
            {/* Hiển thị hình ảnh đã được import */}
            <img src={aboutImage} alt="About Us" className="about-image" />
          </div>
        </div>
      </section>

      
    </div>
  );
};

export default LandingPage;
