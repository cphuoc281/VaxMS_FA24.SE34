import { useState } from 'react';
import { toast } from 'react-toastify';

function ForgotPassword() {
    const [email, setEmail] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        const response = await fetch('http://localhost:8080/api/user/public/forgot-password', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, resetUrl: 'http://localhost:3000/reset-password' }),
        });
        if (response.ok) {
            toast.success('Email đặt lại mật khẩu đã được gửi');
        } else {
            toast.error('Đã xảy ra lỗi');
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <h1>Quên mật khẩu</h1>
            <input
                type="email"
                placeholder="Nhập email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
            />
            <button type="submit">Gửi</button>
        </form>
    );
}
