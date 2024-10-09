import React, { useState } from 'react';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { postMethodPayload } from '../../services/request';
import Swal from 'sweetalert2';
import '../../layout/customer/styles/register.scss';// Create and link your CSS file for specific styles

async function handleRegister(event) {
    event.preventDefault();
    const payload = {
        email: event.target.elements.email.value,
        username: event.target.elements.username.value,
        password: event.target.elements.password.value,
        repeatPassword: event.target.elements.repeatPassword.value,
    };

    if (payload.password !== payload.repeatPassword) {
        toast.error('Passwords do not match');
        return;
    }

    const res = await postMethodPayload('/api/user/register', payload);
    
    var result = await res.json();
    if (res.status >= 400) {
        Swal.fire({
            title: "Registration Failed",
            text: result.errorMessage,
        });
    } else {
        toast.success('Registration successful! Please check your email to activate your account.');
        await new Promise(resolve => setTimeout(resolve, 1500));
        window.location.href = '/login'; // Redirect to login
    }
}

function Register() {
    return (
        <div className="register-container">
            <div className="register-card">
                <h1>Create your account</h1>
                <p>Registration is easy.</p>
                <form onSubmit={handleRegister} autoComplete="off">
                    <label>Email address <span>*</span></label>
                    <input type="email" name="email" required />

                    <label>UserName <span>*</span></label>
                    <input type="text" name="username" required />

                    <label>Password <span>*</span></label>
                    <input type="password" name="password" required />

                    <label>Repeat Password <span>*</span></label>
                    <input type="password" name="repeatPassword" required />

                    <button type="submit" className="register-btn">Register</button>
                </form>

                <p>OR</p>
                <button className="google-btn">
                    <i className="fab fa-google"></i> Continue with Google
                </button>

                <p>By clicking Sign in, Continue with Google, you agree to our <a href="/terms">Terms of Use</a> and <a href="/privacy">Privacy Policy</a>.</p>
            </div>
        </div>
    );
}

export default Register;
