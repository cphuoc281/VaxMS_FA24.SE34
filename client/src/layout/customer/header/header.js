import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import logo from '../../../assest/images/vnvc-logo.png';
import vietnamFlag from '../../../assest/images/vietnam-flag.png'; // Đường dẫn tới icon cờ
import '../styles/styleuser.scss';
import 'bootstrap/dist/css/bootstrap.min.css';

function Header() {
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [searchValue, setSearchValue] = useState('');

  const handleFocus = () => setShowSuggestions(true);
  const handleBlur = () => setTimeout(() => setShowSuggestions(false), 200);

  return (
    <div id="headerweb">
      {/* Top section với thời gian làm việc và hotline */}
      <div className="top-bar d-flex justify-content-between align-items-center p-2">
        <span className="working-hours text-primary ms-4">
          Mở cửa 7h30 - 17h00 / T2 - CN xuyên trưa
        </span>
        <a href="tel:02871026595" className="hotlineheader text-danger fw-bold me-4">
          Hotline: 028 7102 6595
        </a>
      </div>
      {/* Slot cho hình ảnh dài */}
      <div className="top-banner">
        {/* Bạn có thể chèn hình ảnh vào đây */}
      </div>

      {/* Main header với logo, search bar, và navigation */}
      <nav className="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div className="container-web">
          <Link to="/" className="navbar-brand">
            <img src={logo} className="imagelogoheader" alt="VNVC Logo" />
          </Link>

          {/* Search Bar */}
          <div className="search-bar d-flex align-items-center">
            <input
              type="text"
              className="form-control rounded-pill"
              placeholder="Tìm kiếm vaccine theo tên, độ tuổi, nhà sản xuất..."
              value={searchValue}
              onChange={(e) => setSearchValue(e.target.value)}
              onFocus={handleFocus}
              onBlur={handleBlur}
            />
            <button className="btn btn-link" type="submit">
              <i className="fa fa-search"></i>
            </button>
          </div>

          {/* Navigation Right (Đăng ký tiêm và các mục khác) */}
          <div className="nav-right d-flex align-items-center">
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
      </nav>

      {/* Bottom Navigation */}
      <div className="container-web container-bottom-header bg-light py-2">
        <Link to="/" className="itemheader">Trang chủ</Link>
        <Link to="/gioi-thieu" className="itemheader">Giới thiệu</Link>
        <Link to="/vaccine-tre-em" className="itemheader">Vắc xin trẻ em</Link>
        <Link to="/vaccine-nguoi-lon" className="itemheader">Vắc xin người lớn</Link>
        <Link to="/goi-vaccine" className="itemheader">Gói vắc xin</Link>
        <Link to="/cam-nang" className="itemheader">Cẩm nang</Link>
        <Link to="/bang-gia" className="itemheader">Bảng giá</Link>
        <Link to="/benh-hoc" className="itemheader">Bệnh học</Link>
        <Link to="/tin-tuc" className="itemheader">Tin tức</Link>
      </div>
    </div>
  );
}

export default Header;
