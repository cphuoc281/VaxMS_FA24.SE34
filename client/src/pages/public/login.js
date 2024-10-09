import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';
import '../../layout/customer/styles/login.scss'; // Assuming you created a login.scss file for custom styles.

async function handleLogin(event) {
    event.preventDefault();
    const payload = {
      email: event.target.elements.username.value,
      password: event.target.elements.password.value
    };
    const res = await postMethodPayload('/api/user/login/email', payload);
    
    const result = await res.json();
    console.log(result);
  
    if (res.status === 417) {
      if (result.errorCode === 300) {
        Swal.fire({
          title: "Notification",
          text: "Your account is not activated, please proceed to activate your account!",
          preConfirm: () => {
            window.location.href = `confirm?email=${event.target.elements.username.value}`;
          }
        });
      } else {
        toast.warning(result.defaultMessage);
      }
    } else if (res.status < 300) {
      toast.success('Login successful!');
      await new Promise(resolve => setTimeout(resolve, 1500));
      localStorage.setItem('token', result.token);
      localStorage.setItem('user', JSON.stringify(result.user));
  
      // Redirect based on role
      const { name } = result.user.authorities;
      if (name === 'Admin') {
        window.location.href = '/admin/index';
      } else if (name === 'Customer') {
        window.location.href = '/index';
      } else if (name === 'Doctor' || name === 'Nurse' || name === 'Support Staff') {
        // Handle other roles accordingly
      }
    }
  }
  
  function Login() {
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
              <label htmlFor="username">Email address</label>
              <input type="email" id="username" name="username" required placeholder="Email" />
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
            <button type="submit" className="login-btn">Sign in</button>
            <div className="forgot-password">
              <a href="/forgot-password">Forgot your password?</a>
            </div>
          </form>
          <div className="or-divider">
            <span>OR</span>
          </div>
          <button className="google-login-btn">
            <i className="google-icon"></i> Continue with Google
          </button>
          <p className="login-footer">
            By clicking Sign in, Continue with Google, you agree to our <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>.
          </p>
        </div>
      </div>
    );
  }
  
  export default Login;