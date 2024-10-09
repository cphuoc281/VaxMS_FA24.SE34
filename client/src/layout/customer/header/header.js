import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import logo from '../../../assest/images/vnvc-logo.png';
import vietnamFlag from '../../../assest/images/vietnam-flag.png'; // Đường dẫn tới icon cờ
import '../styles/styleuser.scss';
import 'bootstrap/dist/css/bootstrap.min.css';
import topbanner from '../../../assest/images/topbanner.png'; 

function Header() {
  const [searchValue, setSearchValue] = useState('');

  return (
    <div id="headerweb">
      {/* Top section with working hours and hotline */}
      <div className="top-bar d-flex justify-content-between align-items-center p-2">
        <span className="working-hours text-primary ms-4">
          Mở cửa 7h30 - 17h00 / T2 - CN xuyên trưa
        </span>
        <a href="tel:02871026595" className="hotlineheader text-danger fw-bold me-4">
          Hotline: 028 7102 6595
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
                  placeholder="Tìm kiếm vaccine theo tên, độ tuổi, nhà sản xuất..."
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
                <i className="fa fa-calendar"></i> <span>Đăng ký tiêm</span>
              </Link>
              <Link to="/login" className="itemheader me-3">
                <i className="fa fa-sign-in"></i> <span>Đăng nhập</span>
              </Link>
              <Link to="/register" className="itemheader me-3">
                <i className="fa fa-user-plus"></i> <span>Đăng ký</span>
              </Link>
              <img src={vietnamFlag} alt="Vietnam Flag" className="flag-icon" />
            </div>
          </div>
        </div>
      </nav>

      {/* Bottom Navigation */}
      <div className="container-fluid container-bottom-header bg-light py-2">
        <div className="row justify-content-center">
          <Link to="/" className="col itemheader">Trang chủ</Link>
          <Link to="/gioi-thieu" className="col itemheader">Giới thiệu</Link>
          <Link to="/vaccine-tre-em" className="col itemheader">Vắc xin trẻ em</Link>
          <Link to="/vaccine-nguoi-lon" className="col itemheader">Vắc xin người lớn</Link>
          <Link to="/goi-vaccine" className="col itemheader">Gói vắc xin</Link>
          <Link to="/cam-nang" className="col itemheader">Tra cứu lịch tiêm</Link>
          <Link to="/bang-gia" className="col itemheader">Bảng giá</Link>
          <Link to="/benh-hoc" className="col itemheader">Bệnh học</Link>
          <Link to="/tin-tuc" className="col itemheader">Tin tức</Link>
        </div>
      </div>
    </div>
  );
}

export default Header;
