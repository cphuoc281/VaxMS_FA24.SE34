import React, { useState } from 'react';
import '../../layout/customer/styles/chatbox.scss';

function ChatBox() {
  const [isOpen, setIsOpen] = useState(false);

  const toggleChat = () => {
    setIsOpen(!isOpen);
  };

  return (
    <div className="chat-container">
      {/* Chat Icon */}
      <div className="chat-icon" onClick={toggleChat}>
        <img src="../../assest/chat-icon.png" alt="Chat Icon" />
      </div>

      {/* Chatbox */}
      {isOpen && (
        <div className="chatbox">
          <div className="chatbox-header">
            <h3>Trò Chuyện</h3>
            <button className="close-btn" onClick={toggleChat}>✕</button>
          </div>
          <div className="chatbox-body">
            <form>
              <label>Tên</label>
              <input type="text" placeholder="Nhập tên của bạn" />

              <label>Họ</label>
              <input type="text" placeholder="Nhập họ của bạn" />

              <label>Di Động</label>
              <input type="text" placeholder="Nhập số di động" />

              <label>Email</label>
              <input type="email" placeholder="Nhập email của bạn" />

              <label>Ngày tiêm gần nhất</label>
              <input type="date" />

              <label>Nội dung hỗ trợ</label>
              <select>
                <option>Tình trạng vắc xin</option>
                <option>Hỗ trợ khác</option>
              </select>

              <button type="submit">Bắt Đầu Trò Chuyện</button>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}

export default ChatBox;
