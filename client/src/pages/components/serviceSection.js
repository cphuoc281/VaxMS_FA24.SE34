import React from 'react';
import service1Image from '../../assest/ycau.jpg';
import service2Image from '../../assest/mthai.png';
import service3Image from '../../assest/adullt.jpg';
import service4Image from '../../assest/treem.jpg';

const ServiceSection = () => {
  const services = [
    { id: 1, name: 'Tiêm chủng theo yêu cầu', image: service1Image },
    { id: 2, name: 'Tiêm cho người chuẩn bị mang thai', image: service2Image },
    { id: 3, name: 'Tiêm trọn gói cho người lớn', image: service3Image },
    { id: 4, name: 'Tiêm trọn gói cho trẻ em', image: service4Image }
  ];

  return (
    <section className="service-section">
      <h2>Dịch Vụ Tiêm Chủng</h2>
      <div className="service-cards">
        {services.map((service) => (
          <div className="service-card" key={service.id}>
            <img src={service.image} alt={service.name} />
            <h3>{service.name}</h3>
          </div>
        ))}
      </div>
    </section>
  );
};

export default ServiceSection;
