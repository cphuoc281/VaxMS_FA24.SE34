import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';
import '../../layout/customer/styles/login.scss'; // Assuming you created a login.scss file for custom styles.
import React, { useState } from 'react';

function Login() {
  const [loading, setLoading] = useState(false);

  async function handleLogin(event) {
    event.preventDefault();
    setLoading(true);

    const payload = {
      email: event.target.elements.email.value.trim(),
      password: event.target.elements.password.value,
    };

    try {
      const res = await postMethodPayload('/api/user/login/email', payload);
      if (res.ok) {
        const result = await res.json();
        // Lưu token và thông tin người dùng vào localStorage
        localStorage.setItem('token', result.token);
        localStorage.setItem('user', JSON.stringify(result.user));
        // Chuyển hướng đến trang chủ hoặc trang dành cho người dùng
        window.location.href = '/';
      } else {
        const result = await res.json();
        Swal.fire({
          icon: 'error',
          title: 'Đăng nhập thất bại',
          text: result.message || 'Email hoặc mật khẩu không đúng',
        });
      }
    } catch (error) {
      Swal.fire({
        icon: 'error',
        title: 'Đăng nhập thất bại',
        text: 'Không thể kết nối đến server',
      });
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="login-container">
      <div className="login-card">
        <div className="login-header">
          <h2>Sign in</h2>
          <button className="register-btn" onClick={() => window.location.href = '/register'}>
            Register
          </button>
        </div>
        <form onSubmit={handleLogin} autoComplete="off">
          <div className="form-group">
            <label htmlFor="email">Email address</label>
            <input type="email" id="email" name="email" required placeholder="Email" />
          </div>
          <div className="form-group">
            <label htmlFor="password">Password</label>
            <div className="password-wrapper">
              <input type="password" id="password" name="password" required placeholder="Password" />
              <i className="password-eye-icon" />
            </div>
          </div>
          <div className="stay-signed-in">
            <input type="checkbox" id="staySignedIn" />
            <label htmlFor="staySignedIn">Stay signed in</label>
          </div>
          <button type="submit" className="login-btn" disabled={loading}>
            {loading ? 'Loading...' : 'Sign in'}
          </button>
          <div className="forgot-password">
            <a href="/forgot-password">Forgot your password?</a>
          </div>
        </form>
        <div className="or-divider">
          <span>OR</span>
        </div>
        {/* Google Login Button */}
        <button className="google-login-btn">
          <img
            src={require('../../assest/images/gglogo.png')}
            alt="Google Icon"
            className="google-icon"
          />
          Continue with Google
        </button>
        <p className="login-footer">
          By clicking Sign in, Continue with Google, you agree to our <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>.
        </p>
      </div>
    </div>
  );
}

export default Login;
