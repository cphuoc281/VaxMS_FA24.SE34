import React from 'react';
import { createRoot } from 'react-dom/client'; // Import từ 'react-dom/client'
import Apps from './App';

import reportWebVitals from './reportWebVitals';
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
