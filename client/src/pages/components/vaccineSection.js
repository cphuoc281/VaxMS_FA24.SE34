import React from 'react';
import { Link } from 'react-router-dom';
import pfizerImage from '../../assest/prizer.jpg';
import modernaImage from '../../assest/Moderna.jpg';
import astrazenecaImage from '../../assest/AstraZeneca.jpg';
import sputnikImage from '../../assest/Sputnik.jpeg';
import jjImage from '../../assest/J&J.jpg';
import sinovacImage from '../../assest/Sinovac.jfif';
import sinopharmImage from '../../assest/Sinopharm.jpg';
import covaxinImage from '../../assest/Covaxin.jpg';

const VaccineSection = () => {
  const vaccines = [
    { id: 1, name: 'Vắc xin Pfizer', description: 'Vắc xin ngừa COVID-19', image: pfizerImage },
    { id: 2, name: 'Vắc xin Moderna', description: 'Vắc xin ngừa COVID-19', image: modernaImage },
    { id: 3, name: 'Vắc xin AstraZeneca', description: 'Vắc xin ngừa COVID-19', image: astrazenecaImage },
    { id: 4, name: 'Vắc xin Sputnik V', description: 'Vắc xin ngừa COVID-19', image: sputnikImage },
    { id: 5, name: 'Vắc xin J&J', description: 'Vắc xin ngừa COVID-19', image: jjImage },
    { id: 6, name: 'Vắc xin Sinovac', description: 'Vắc xin ngừa COVID-19', image: sinovacImage },
    { id: 7, name: 'Vắc xin Sinopharm', description: 'Vắc xin ngừa COVID-19', image: sinopharmImage },
    { id: 8, name: 'Vắc xin Covaxin', description: 'Vắc xin ngừa COVID-19', image: covaxinImage }
  ];

  return (
    <section className="vaccine-section">
      <h2>Danh Mục Vaccine Nổi Bật</h2>
      <div className="vaccine-cards">
        {vaccines.map((vaccine) => (
          <div className="vaccine-card" key={vaccine.id}>
            <img src={vaccine.image} alt={vaccine.name} />
            <h3>{vaccine.name}</h3>
            <p>{vaccine.description}</p>
          </div>
        ))}
      </div>
      <div className="view-all">
        <Link to="/danh-sach-vaccine">Xem tất cả</Link>
      </div>
    </section>
  );
};

export default VaccineSection;
