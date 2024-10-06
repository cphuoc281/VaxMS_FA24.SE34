// DefaultLayout.js
import React from 'react';
import Header from "../header/header";
import Footer from "../footer/footer";

function DefaultLayout({ children }) {
  return (
    <div>
      <Header />
      <div className="container-web"> {/* Thêm class container-web vào đây */}
        <div className="main-content-web">
          {children}
        </div>
      </div>
      <Footer />
    </div>
  );
}

export default DefaultLayout;
