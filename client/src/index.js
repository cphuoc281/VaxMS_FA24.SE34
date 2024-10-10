import React from 'react';
import ReactDOM from 'react-dom';
import Apps from './App';
import reportWebVitals from './reportWebVitals';
import 'bootstrap/dist/css/bootstrap.min.css';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "./services/locales/lang"


// const root = ReactDOM.createRoot(document.getElementById('root'));
// root.render(
//   // <React.StrictMode>
//       <Apps />
//   // </React.StrictMode>
// );
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Apps />
  </React.StrictMode>
);
reportWebVitals();
