import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import logo from '../../../assest/images/vaxmslogo.png';
import vietnamFlag from '../../../assest/images/vietnam-flag.png';
import engFlag from '../../../assest/images/engflag2.jpg';
import 'bootstrap/dist/css/bootstrap.min.css';
import './header.scss';
import topbanner from '../../../assest/images/topbanner.png';
import LoginModal from '../../../pages/public/LoginModal';
import RegisterModal from '../../../pages/public/RegisterModal';

function Header() {
  const [searchValue, setSearchValue] = useState('');
  const { t, i18n } = useTranslation();
  const [showDropdown, setShowDropdown] = useState(false);
  const [currentLang, setCurrentLang] = useState(i18n.language);
  const [user, setUser] = useState(null);
  const [showLoginModal, setShowLoginModal] = useState(false);
  const [showRegisterModal, setShowRegisterModal] = useState(false);
  const [keyword, setKeyword] = useState('');

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    }
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    setUser(null);
    window.location.href = '/';
  };


  const handleSearch = () => {
    window.location.href = `/search?keyword=${encodeURIComponent(keyword)}`;
  };
  const changeLanguage = (lang) => {
    i18n.changeLanguage(lang);
    setCurrentLang(lang);
    setShowDropdown(false);
  };

  const currentLangFlag = i18n.language === 'en' ? engFlag : vietnamFlag;
  const currentLangText = i18n.language === 'en' ? 'English' : 'Tiếng Việt';

  return (
    <div id="headerweb">
      {/* Top section with working hours and hotline */}
      <div className="top-bar d-flex justify-content-between align-items-center p-2">
        <span className="working-hours text-primary ms-4">
          {t('header.working_hours')}
        </span>
        <a href="tel:02871026595" className="hotlineheader text-danger fw-bold me-4">
          {t('header.hotline')}
        </a>
      </div>

      {/* Banner Section */}
      <div className="top-banner">
        <img src={topbanner} alt="Top Banner" className="top-banner" />
      </div>

      {/* Main Header with Logo, Search Bar, and Navigation */}
      <nav className="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div className="container">
          <Link to="/" className="navbar-brand d-flex align-items-center">
            <img src={logo} className="imagelogoheader" alt="Vaxms" />
          </Link>

          <div className="search-bar flex-grow-1 me-5 position-relative">
            <form action='tim-kiem-vaccine'>
              <input
                type="text"
                name='search'
                className="form-control rounded-pill"
                placeholder={t('header.search_placeholder')}
                value={keyword}
                onChange={(e) => setKeyword(e.target.value)}
                style={{ paddingRight: '50px' }} // Thêm khoảng trống bên phải cho nút
              />
              <button onClick={handleSearch} className="btn btn-primary search-button" type="submit">
                <i className="fa fa-search"></i>
              </button>
            </form>
          </div>

          <div className="nav-right d-flex align-items-center">
            <Link to="/dang-ky-tiem-chung" className="btn btn-outline-primary me-2">
              <i className="fa fa-calendar"></i> <span>{t('header.register_vaccine')}</span>
            </Link>

            {user ? (
              <>
                <span className="itemheader me-2">{user.email}</span>
                <button onClick={handleLogout} className="btn btn-outline-danger me-2">
                  {t('header.signout')}
                </button>
              </>
            ) : (
              <>
                <button className="btn btn-outline-primary me-2" onClick={() => setShowLoginModal(true)}>
                  <i className="fa fa-sign-in"></i> <span>{t('header.login')}</span>
                </button>
                <button className="btn btn-primary me-2" onClick={() => setShowRegisterModal(true)}>
                  <i className="fa fa-user-plus"></i> <span>{t('header.register')}</span>
                </button>
              </>
            )}


            <div className="language-switcher dropdown">
              <button
                className="btn btn-light dropdown-toggle d-flex align-items-center"
                type="button"
                id="languageDropdown"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <img src={currentLangFlag} alt="Current Language" className="flag-icon me-1" />
                {currentLangText}
              </button>
              <ul className="dropdown-menu dropdown-menu-end rounded shadow" aria-labelledby="languageDropdown">
                <li>
                  <button className="dropdown-item d-flex align-items-center" onClick={() => changeLanguage('vi')}>
                    <img src={vietnamFlag} alt="Vietnam Flag" className="flag-icon me-2" />
                    Tiếng Việt
                  </button>
                </li>
                <li>
                  <button className="dropdown-item d-flex align-items-center" onClick={() => changeLanguage('en')}>
                    <img src={engFlag} alt="English Flag" className="flag-icon me-2" />
                    English
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>

      {/* Bottom Navigation */}
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <div className="container">
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#bottomNavbar"
            aria-controls="bottomNavbar"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="bottomNavbar">
            <ul className="navbar-nav mx-auto">
              <li className="nav-item">
                <Link to="/" className="nav-link itemheader">{t('header.home')}</Link>
              </li>
              <li className="nav-item">
                <Link to="/intro" className="nav-link itemheader">{t('header.introduction')}</Link>
              </li>
              <li className="nav-item">
                <Link to="/vaccine" className="nav-link itemheader">{t('header.vaccine_packages')}</Link>
              </li>
              <li className="nav-item">
                <Link to="/guide" className="nav-link itemheader">{t('header.guide')}</Link>
              </li>
              <li className="nav-item">
                <Link to="/price" className="nav-link itemheader">{t('header.price_list')}</Link>
              </li>
              <li className="nav-item">
                <Link to="/diseases" className="nav-link itemheader">{t('header.diseases')}</Link>
              </li>
              <li className="nav-item">
                <Link to="/news" className="nav-link itemheader">{t('header.news')}</Link>
              </li>
            </ul>
          </div>
        </div>
      </nav>


      {/* Login and Register Modals */}
      <LoginModal show={showLoginModal} onClose={() => setShowLoginModal(false)} />
      <RegisterModal show={showRegisterModal} onClose={() => setShowRegisterModal(false)} />
    </div>
  );
}

export default Header;