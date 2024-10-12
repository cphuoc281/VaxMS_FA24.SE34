import React, { useState, useEffect } from 'react';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';
import '../../layout/customer/styles/login.scss'; // Assuming you created a login.scss file for custom styles.

function Login() {
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    /* Initialize Google SignIn */
    window.google.accounts.id.initialize({
      client_id: '950156521822-d34se9kv73udmtsavta0dr9cq9h2ujqc.apps.googleusercontent.com', // Replace with your Google OAuth Client ID
      callback: handleGoogleLoginResponse,
    });
    window.google.accounts.id.renderButton(
      document.getElementById('googleSignInButton'),
      { theme: 'outline', size: 'large' }
    );
  }, []);

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
        localStorage.setItem('token', result.token);
        localStorage.setItem('user', JSON.stringify(result.user));
        window.location.href = '/';
      } else {
        const result = await res.json();
        Swal.fire({
          icon: 'error',
          title: 'Login Failed',
          text: result.message || 'Invalid email or password',
        });
      }
    } catch (error) {
      Swal.fire({
        icon: 'error',
        title: 'Login Failed',
        text: 'Unable to connect to the server',
      });
    } finally {
      setLoading(false);
    }
  }

  async function handleGoogleLoginResponse(response) {
    try {
      const res = await postMethodPayload('/api/user/login/google', response.credential);
      if (res.ok) {
        const result = await res.json();
        localStorage.setItem('token', result.token);
        localStorage.setItem('user', JSON.stringify(result.user));
        window.location.href = '/';
      } else {
        const result = await res.json();
        Swal.fire({
          icon: 'error',
          title: 'Google Sign-In Failed',
          text: result.message || 'Unable to log in with Google',
        });
      }
    } catch (error) {
      Swal.fire({
        icon: 'error',
        title: 'Google Sign-In Failed',
        text: 'Unable to connect to the server',
      });
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

        {/* Google Sign-In Button */}
        <div id="googleSignInButton"></div>

        <p className="login-footer">
          By clicking Sign in or Continue with Google, you agree to our <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>.
        </p>
      </div>
    </div>
  );
}

export default Login;
