import { useState } from 'react';
import { useLocation } from 'react-router-dom';
import { toast } from 'react-toastify';

function useQuery() {
    return new URLSearchParams(useLocation().search);
}

function ResetPassword() {
    const [newPassword, setNewPassword] = useState('');
    const query = useQuery();
    const email = query.get('email');
    const key = query.get('key');

    const handleSubmit = async (e) => {
        e.preventDefault();
        const response = await fetch('http://localhost:8080/api/user/public/reset-password', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, key, newPassword }),
        });
        if (response.ok) {
            toast.success('Đặt lại mật khẩu thành công');
            window.location.href = '/login';
        } else {
            toast.error('Đã xảy ra lỗi');
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <h1>Đặt lại mật khẩu</h1>
            <input
                type="password"
                placeholder="Nhập mật khẩu mới"
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
            />
            <button type="submit">Đặt lại mật khẩu</button>
        </form>
    );
}
