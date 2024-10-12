import React, { useState, useEffect } from 'react';
import Slider from 'react-slick';
import { useTranslation } from 'react-i18next';
import aboutImage from '../../assest/images/about-image.jpg';
import bannerImage1 from '../../assest/images/banner.jpg';
import bannerImage2 from '../../assest/images/banner1.png';
import bannerImage3 from '../../assest/images/banner2.jpg';
import nurseImage from '../../assest/images/nurse.png'; // Nurse image import
import pregnantIcon from '../../assest/images/pregnant.png';
import babyIcon from '../../assest/images/baby.png';
import requestIcon from '../../assest/images/request.png';
import adultIcon from '../../assest/images/adult.png';
import tdap from '../../assest/images/tdapt.jpg';
import flu from '../../assest/images/flu.jfif';
import heB from '../../assest/images/heB.jpg';
import mordena from '../../assest/images/mordena.webp';
import hiB from '../../assest/images/hiB.jpg';
import meni from '../../assest/images/meni.jpg';
import mmr from '../../assest/images/mmr.jpg';
import chicken from '../../assest/images/chicken.jpeg';
import tdapDi from '../../assest/images/tdapDi.webp';
import polio from '../../assest/images/polio.jfif';
import rota from '../../assest/images/rota.webp';
import pcv13 from '../../assest/images/pcv13.webp';
import rabi from '../../assest/images/rabi.jfif';
import jaban from '../../assest/images/jaban.jfif';
import typho from '../../assest/images/typho.jfif';
import yello from '../../assest/images/yello.jfif';
import hepa from '../../assest/images/hepa.jfif';
import cholera from '../../assest/images/cholera.webp';
import shingles from '../../assest/images/shingles.jpg';
import PPSV23 from '../../assest/images/PPSV23.avif';
import hpv from '../../assest/images/hpv.jpg';
import avab from '../../assest/images/avab.jpg';
import mening from '../../assest/images/mening.jpg';
import seas from '../../assest/images/seas.jfif';
import partnerLogo1 from '../../assest/images/partner1.png';
import partnerLogo2 from '../../assest/images/partner2.png';
import partnerLogo3 from '../../assest/images/partner3.png';
import partnerLogo4 from '../../assest/images/partner4.png';
// import partnerLogo5 from '../../assest/images/partner5.png';
// import partnerLogo6 from '../../assest/images/partner6.png';
import newsImage1 from '../../assest/images/news1.jpg'; // Example news images
import newsImage2 from '../../assest/images/news2.jpg';
import newsImage3 from '../../assest/images/news3.jpg';
import bhoc1Image from '../../assest/images/bhoc1.webp';
import bhoc2Image from '../../assest/images/bhoc2.jpg';
import bhoc3Image from '../../assest/images/bhoc3.jpg';


const vaccineData = {
  pregnant: [
    { name: 'Pertussis (Tdap)', image: tdap },
    { name: 'Flu Vaccine (Inactivated Influenza Vaccine)', image: flu },
    { name: 'Hepatitis B', image: heB },
    { name: 'COVID-19 Vaccine (Moderna)', image: mordena },
    { name: 'Hib (Haemophilus influenzae type b)', image: hiB },
    { name: 'Meningococcal Vaccine', image: meni },
  ],
  children: [
    { name: 'MMR (Measles, Mumps, Rubella)', image: mmr },
    { name: 'Varicella (Chickenpox)', image: chicken },
    { name: 'Diphtheria (DTaP)', image: tdapDi },
    { name: 'Polio (IPV - Inactivated Polio Vaccine)', image: polio },
    { name: 'Rotavirus Vaccine', image: rota },
    { name: 'Pneumococcal Conjugate Vaccine (PCV13)', image: pcv13 },
  ],
  custom: [
    { name: 'Rabies Vaccine', image: rabi },
    { name: 'Japanese Encephalitis Vaccine', image: jaban },
    { name: 'Typhoid Vaccine', image: typho },
    { name: 'Yellow Fever Vaccine', image: yello },
    { name: 'Hepatitis A Vaccine', image: hepa },
    { name: 'Cholera Vaccine', image: cholera },
  ],
  adult: [
    { name: 'Shingles (Herpes Zoster Vaccine)', image: shingles },
    { name: 'Pneumococcal Polysaccharide Vaccine (PPSV23)', image: PPSV23 },
    { name: 'Human Papillomavirus (HPV) Vaccine', image: hpv },
    { name: 'Hepatitis A & B Combination Vaccine', image: avab },
    { name: 'Meningococcal ACWY Vaccine', image: mening },
    { name: 'Seasonal Influenza Vaccine', image: seas },
  ],
};
const partnerLogos = [
  { image: partnerLogo1, alt: 'Partner 1' },
  { image: partnerLogo2, alt: 'Partner 2' },
  { image: partnerLogo3, alt: 'Partner 3' },
  { image: partnerLogo4, alt: 'Partner 4' },
  // { image: partnerLogo5, alt: 'Partner 5' },
  // { image: partnerLogo6, alt: 'Partner 6' },
];



// Slider configuration
const newsSettings = {
  dots: true,
  infinite: true,
  speed: 500,
  slidesToShow: 3,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 3000,
};
// Slider configuration for showing 4 at a time
const benhHocSettings = {
  dots: true,
  infinite: true,
  speed: 500,
  slidesToShow: 3,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 2000,
};




const LandingPage = () => {
  const [showMore, setShowMore] = useState(false);
  const { t, i18n } = useTranslation();

  const changeLanguage = (lng) => {
    console.log(`Changing language to: ${lng}`);
    i18n.changeLanguage(lng);
  };
  useEffect(() => {
    console.log('Current language:', i18n.language);
  }, [i18n.language]);

  const toggleShowMore = () => {
    setShowMore(!showMore);
  };
  const [selectedCategory, setSelectedCategory] = useState('pregnant');

  const handleCategoryClick = (category) => {
    setSelectedCategory(category);
  };
  const [showScrollButton, setShowScrollButton] = useState(false);

  // Scroll to top function
  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    });
  };

  // Handle scroll event
  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 300) {
        setShowScrollButton(true);
      } else {
        setShowScrollButton(false);
      }
    };

    // Add event listener on component mount
    window.addEventListener('scroll', handleScroll);

    // Remove event listener on component unmount
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);
  const newsData = [
    {
      title: t('landing.news_1_title'),
      date: '19 Th09',
      author: 'Admin',
      comments: 3,
      snippet: t('landing.news_1_snippet'),
      image: newsImage1,
    },
    {
      title: t('landing.news_2_title'),
      date: '19 Th09',
      author: 'Admin',
      comments: 5,
      snippet: t('landing.news_2_snippet'),
      image: newsImage2,
    },
    {
      title: t('landing.news_3_title'),
      date: '20 Th09',
      author: 'Admin',
      comments: 1,
      snippet: t('landing.news_3_snippet'),
      image: newsImage3,
    },
  ];
  const partnerSettings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 4, // Shows 4 logos at a time
    slidesToScroll: 1, // Scrolls one slide at a time
    autoplay: true,
    autoplaySpeed: 3000, // Adjust the speed as necessary
    arrows: false, // Hide arrows if desired
  };

  // Slider configuration
  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2500,
    fade: true,
  };

  // Scroll-to-Top Button Logic


  return (
    <div className="landing-page">
      {/* Slider Section */}
      <div className="banner-section">
        <Slider {...settings} className="large-banner-slider">
          <div>
            <img src={bannerImage1} alt="Banner 1" className="large-banner" />
          </div>
          <div>
            <img src={bannerImage2} alt="Banner 2" className="large-banner" />
          </div>
          <div>
            <img src={bannerImage3} alt="Banner 3" className="large-banner" />
          </div>
        </Slider>
      </div>

      {/* About Section */}
      <section className="about-section">
        <div className=" about-container">
          <h2 className="about-title"><span>{t('landing.introduction')}</span></h2>
          <div className="about-content">
            <div className="about-text">
              <p>
                {t('landing.about_description_1')}
              </p>
              {showMore && (
                <p>
                  {t('landing.about_description_2')}
                </p>
              )}
              <button onClick={toggleShowMore} className="show-more-btn">
                {showMore ? t('landing.show_less') : t('landing.show_more')}
              </button>
            </div>
            <img src={aboutImage} alt="About Us" className="about-image" />
          </div>
        </div>
      </section>

      {/* Vaccine Packages Section */}
      <div className="vaccine-packages-full-width">
        <div className="vaccine-packages-section ">
          <div className="vaccine-packages-content">
            <h2 className="section-title">{t('landing.vaccine_services')}</h2>
            <div className="nurse-image-container">
              <img src={nurseImage} alt="Nurse" className="nurse-image" />
            </div>
            {/* Vaccine Categories */}
            <div className="vaccine-options">
              <div onClick={() => handleCategoryClick('pregnant')} className="vaccine-option">
                <img src={pregnantIcon} alt="Pregnant Vaccine" />
                <p>{t('landing.vaccine_for_pregnant')}</p>
              </div>
              <div onClick={() => handleCategoryClick('children')} className="vaccine-option">
                <img src={babyIcon} alt="Children Vaccine" />
                <p>{t('landing.vaccine_for_children')}</p>
              </div>
              <div onClick={() => handleCategoryClick('custom')} className="vaccine-option">
                <img src={requestIcon} alt="Custom Vaccine" />
                <p>{t('landing.vaccine_on_demand')}</p>
              </div>
              <div onClick={() => handleCategoryClick('adult')} className="vaccine-option">
                <img src={adultIcon} alt="Adult Vaccine" />
                <p>{t('landing.vaccine_for_adults')}</p>
              </div>
            </div>

            {/* Vaccine List based on selected category */}
            <div className="white-overlay">
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <h3>{t('landing.vaccine_list')}</h3>
                <a href="/all-vaccines" className="view-all">{t('landing.view_all')}</a>
              </div>
              <div className="vaccine-list">
                {vaccineData[selectedCategory].map((vaccine, index) => (
                  <div className="vaccine-card" key={index}>
                    <img src={vaccine.image} alt={vaccine.name} />
                    <p>{vaccine.name}</p>
                    <p>{vaccine.description}</p>
                    <button>{t('landing.book_appointment')}</button>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="partners-section">
        <Slider {...partnerSettings}>
          {partnerLogos.map((logo, index) => (
            <div key={index} className="partner-logo-container">
              <img src={logo.image} alt={logo.alt} className="partner-logo" />
            </div>
          ))}
        </Slider>
      </div>

      <div className="news-section">
        <h2 className="news-title">{t('landing.latest_news')}</h2>
        <div className="news-slider">
          <Slider {...newsSettings}>
            {newsData.map((news, index) => (
              <div key={index} className="news-card">
                <img src={news.image} alt={news.title} className="news-image" />
                <div className="news-content">
                  <div className="news-meta">
                    <span className="news-date">{news.date}</span>
                    <span className="news-author">👤 {news.author}</span>
                    <span className="news-comments">💬 {news.comments} {t('landing.news_comments')}</span>
                  </div>
                  <h3 className="news-headline">{news.title}</h3>
                  <p className="news-snippet">{news.snippet}</p>
                </div>
              </div>
            ))}
          </Slider>
        </div>
      </div>
      {/* Bệnh Học Section */}
      <div className="benh-hoc-section">
        <h2>{t('landing.disease_section')}</h2>
        <Slider {...benhHocSettings}>
          <div className="benh-hoc-card">
            <img src={bhoc1Image} alt={t('landing.disease_1_title')}/>
            <h3>{t('landing.disease_1_title')}</h3>
            <p>{t('landing.disease_1_snippet')}</p>
          </div>
          <div className="benh-hoc-card">
            <img src={bhoc2Image} alt={t('landing.disease_2_title')}/>
            <h3>{t('landing.disease_2_title')}</h3>
            <p>{t('landing.disease_2_snippet')}</p>
          </div>
          <div className="benh-hoc-card">
            <img src={bhoc3Image} alt={t('landing.disease_3_title')}/>
            <h3>{t('landing.disease_3_title')}</h3>
            <p>{t('landing.disease_3_snippet')}</p>
          </div>
        </Slider>
      </div>

      <div className="landing-page">
        {/* Your other content goes here */}

        {/* Scroll to top button */}
        {showScrollButton && (
          <button className="scroll-top-btn" onClick={scrollToTop}>
            ▲
          </button>
        )}
      </div>


    </div>
  );
};

export default LandingPage;
