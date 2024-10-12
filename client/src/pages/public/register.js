import React, { useState } from 'react';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';
import '../../layout/customer/styles/register.scss';

function Register() {
    const [loading, setLoading] = useState(false);

    async function handleRegister(event) {
        event.preventDefault();
        setLoading(true);

        const payload = {
            email: event.target.elements.email.value.trim(),
            username: event.target.elements.username.value.trim(),
            password: event.target.elements.password.value,
            repeatPassword: event.target.elements.repeatPassword.value,
        };

        // Kiểm tra mật khẩu có trùng khớp không
        if (payload.password !== payload.repeatPassword) {
            toast.error('Mật khẩu không trùng khớp');
            setLoading(false);
            return;
        }

        // Kiểm tra độ mạnh của mật khẩu (tùy chọn)
        if (payload.password.length < 6) {
            toast.error('Mật khẩu phải có ít nhất 6 ký tự');
            setLoading(false);
            return;
        }

        try {
            const res = await postMethodPayload('/api/user/public/register', payload);

            if (!res.ok) {
                const result = await res.json();
                Swal.fire({
                    icon: 'error',
                    title: 'Đăng ký thất bại',
                    text: result.errorMessage || 'Đã xảy ra lỗi trong quá trình đăng ký',
                });
            } else {
                toast.success('Đăng ký thành công! Vui lòng kiểm tra email để kích hoạt tài khoản.');
                setTimeout(() => {
                    window.location.href = '/activate-account?email=' + encodeURIComponent(payload.email);
                }, 1500);
            }
            
        } catch (error) {
            Swal.fire({
                icon: 'error',
                title: 'Đăng ký thất bại',
                text: 'Không thể kết nối đến server',
            });
        } finally {
            setLoading(false);
        }
    }

    return (
        <div className="register-container">
            <div className="register-card">
                <h1>Tạo tài khoản của bạn</h1>
                <p>Đăng ký thật dễ dàng.</p>
                <form onSubmit={handleRegister} autoComplete="off">
                    <label>Email <span>*</span></label>
                    <input type="email" name="email" required />

                    <label>Tên người dùng <span>*</span></label>
                    <input type="text" name="username" required />

                    <label>Mật khẩu <span>*</span></label>
                    <input type="password" name="password" required />

                    <label>Nhập lại mật khẩu <span>*</span></label>
                    <input type="password" name="repeatPassword" required />

                    <button type="submit" className="register-btn" disabled={loading}>
                        {loading ? 'Đang đăng ký...' : 'Đăng ký'}
                    </button>
                </form>

                <p>HOẶC</p>

                <button className="google-login-btn">
                    <img
                        src={require('../../assest/images/gglogo.png')}
                        alt="Google Icon"
                        className="google-icon"
                    />
                    Tiếp tục với Google
                </button>
                <p>Bằng cách nhấp vào Đăng ký, bạn đồng ý với <a href="/terms">Điều khoản sử dụng</a> và <a href="/privacy">Chính sách bảo mật</a> của chúng tôi.</p>
            </div>
        </div>
    );
}

export default Register;
