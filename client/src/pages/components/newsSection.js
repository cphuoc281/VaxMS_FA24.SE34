import React from 'react';
import news1Image from '../../assest/covid.jpeg';
import news2Image from '../../assest/child.jpg';
import health1Image from '../../assest/phecau.jpg';
import health2Image from '../../assest/6in1.jpg';

const NewsSection = () => {
  const news = [
    { id: 1, title: 'Cập nhật về tiêm vắc xin COVID-19', description: 'Thông tin mới nhất về vắc xin COVID-19...', image: news1Image },
    { id: 2, title: 'Tiêm chủng cho trẻ em', description: 'Lợi ích của việc tiêm chủng cho trẻ em...', image: news2Image }
  ];

  const healthTopics = [
    { id: 1, title: 'Vắc xin phế cầu có tác dụng gì?', description: 'Tìm hiểu về vắc xin phế cầu...', image: health1Image },
    { id: 2, title: 'Tiêm phế cầu 6in1 cho trẻ', description: 'Thông tin về vắc xin 6in1...', image: health2Image }
  ];

  return (
    <>
      <section className="news-section">
        <h2>Tin Tức</h2>
        <div className="news-cards">
          {news.map((item) => (
            <div className="news-card" key={item.id}>
              <img src={item.image} alt={item.title} />
              <h3>{item.title}</h3>
              <p>{item.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="health-section">
        <h2>Bệnh Học</h2>
        <div className="health-cards">
          {healthTopics.map((topic) => (
            <div className="health-card" key={topic.id}>
              <img src={topic.image} alt={topic.title} />
              <h3>{topic.title}</h3>
              <p>{topic.description}</p>
            </div>
          ))}
        </div>
      </section>
    </>
  );
};

export default NewsSection;
