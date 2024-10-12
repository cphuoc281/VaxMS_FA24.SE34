import React from 'react';
import { Modal } from 'react-bootstrap';
import Login from './login'; // Assuming you have the login form component

function LoginModal({ show, onClose }) {
    return (
        <Modal
            show={show}
            onHide={onClose}
            className="login-modal"
            dialogClassName="modal-dialog-centered" /* Center the modal */
        >
            <Modal.Header closeButton>
                <Modal.Title>Login</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Login /> {/* Assuming this is your login form component */}
            </Modal.Body>
        </Modal>


    );
}

export default LoginModal;
