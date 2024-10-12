import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import logo from '../../../assest/images/vnvc-logo.png';
import vietnamFlag from '../../../assest/images/vietnam-flag.png';
import engFlag from '../../../assest/images/engflag2.jpg'; // English flag
import '../styles/styleuser.scss';
import 'bootstrap/dist/css/bootstrap.min.css';
import topbanner from '../../../assest/images/topbanner.png';

function Header() {
  const [searchValue, setSearchValue] = useState('');
  const { t, i18n } = useTranslation();
  const [showDropdown, setShowDropdown] = useState(false);
  const [currentLang, setCurrentLang] = useState(i18n.language);
  const [user, setUser] = useState(null);

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
          <div className="row align-items-center w-100">
            <div className="col-3">
              <Link to="/" className="navbar-brand">
                <img src={logo} className="imagelogoheader" alt="VNVC Logo" />
              </Link>
            </div>
            <div className="col-6">
              <div className="search-bar d-flex align-items-center">
                <input
                  type="text"
                  className="form-control rounded-pill"
                  placeholder={t('header.search_placeholder')}
                  value={searchValue}
                  onChange={(e) => setSearchValue(e.target.value)}
                />
                <button className="btn btn-link" type="submit">
                  <i className="fa fa-search"></i>
                </button>
              </div>
            </div>
            <div className="col-3 nav-right d-flex justify-content-end align-items-center">
              <Link to="/dang-ky-tiem-chung" className="itemheader me-3">
                <i className="fa fa-calendar"></i> <span>{t('header.register_vaccine')}</span>
              </Link>

              {user ? (
                <>
                  <span className="itemheader me-3">{user.email}</span>
                  <button onClick={handleLogout} className="itemheader me-3">
                    Đăng xuất
                  </button>
                </>
              ) : (
                <>
                  <Link to="/login" className="itemheader me-3">
                    <i className="fa fa-sign-in"></i> <span>{t('header.login')}</span>
                  </Link>
                  <Link to="/register" className="itemheader me-3">
                    <i className="fa fa-user-plus"></i> <span>{t('header.register')}</span>
                  </Link>
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
                  <img src={currentLangFlag} alt="Current Language" className="flag-icon" />
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
        </div>
      </nav>

      {/* Bottom Navigation */}
      <div className="container-fluid container-bottom-header bg-light py-2">
        <div className="row justify-content-center">
          <Link to="/" className="col itemheader">{t('header.home')}</Link>
          <Link to="/gioi-thieu" className="col itemheader">{t('header.introduction')}</Link>
          <Link to="/vaccine-tre-em" className="col itemheader">{t('header.children_vaccine')}</Link>
          <Link to="/vaccine-nguoi-lon" className="col itemheader">{t('header.adult_vaccine')}</Link>
          <Link to="/goi-vaccine" className="col itemheader">{t('header.vaccine_packages')}</Link>
          <Link to="/cam-nang" className="col itemheader">{t('header.vaccine_schedule')}</Link>
          <Link to="/bang-gia" className="col itemheader">{t('header.price_list')}</Link>
          <Link to="/benh-hoc" className="col itemheader">{t('header.diseases')}</Link>
          <Link to="/tin-tuc" className="col itemheader">{t('header.news')}</Link>
        </div>
      </div>
    </div>
  );
}

export default Header;
