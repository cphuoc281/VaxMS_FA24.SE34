import React from 'react';
import ReactDOM from 'react-dom';
import Apps from './App';
import reportWebVitals from './reportWebVitals';
import { createRoot } from 'react-dom/client'; 
import 'bootstrap/dist/css/bootstrap.min.css';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "./services/locales/lang"

const container = document.getElementById('root');
const root = createRoot(container); // Sử dụng createRoot từ 'react-dom/client'
root.render(
  <React.StrictMode>
    <Apps />
  </React.StrictMode>
);
reportWebVitals();
