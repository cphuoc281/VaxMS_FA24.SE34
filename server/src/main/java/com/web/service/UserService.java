package com.web.service;


import java.sql.Date;
import java.util.List;
import java.util.Optional;

import com.web.entity.Authority;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.web.dto.CustomUserDetails;
import com.web.dto.TokenDto;
import com.web.dto.UserRequest;
import com.web.dto.UserUpdate;
import com.web.entity.User;
import com.web.enums.UserType;
import com.web.exception.MessageException;
import com.web.jwt.JwtTokenProvider;
import com.web.repository.AuthorityRepository;
import com.web.repository.UserRepository;
import com.web.utils.Contains;
import com.web.utils.MailService;
import com.web.utils.UserUtils;
@Component
public class UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorityRepository authorityRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MailService mailService;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    public TokenDto login(String email, String password) throws Exception {
        Optional<User> users = userRepository.findByEmail(email);
        if (users.isPresent()) {
            if (users.get().getUserType().equals(UserType.google)) {
                throw new MessageException("Hãy đăng nhập bằng google");
            }
        }
        // check infor user
        System.out.println(email);
//        checkUser(users.get());
//        if(passwordEncoder.matches(password, users.get().getPassword())){
        if (password.equalsIgnoreCase(users.get().getPassword())) {
            CustomUserDetails customUserDetails = new CustomUserDetails(users.get());
            String token = jwtTokenProvider.generateToken(customUserDetails);
            TokenDto tokenDto = new TokenDto();
            tokenDto.setToken(token);
            tokenDto.setUser(users.get());
            return tokenDto;
        } else {
            throw new MessageException("Mật khẩu không chính xác", 400);
        }
    }




    public TokenDto loginWithGoogle(GoogleIdToken.Payload payload) throws Exception {
        User user = new User();
        user.setEmail(payload.getEmail());
//        user.setAvatar(payload.get("picture").toString());
//        user.setFullName(payload.get("name").toString());
        user.setActived(true);
        user.setAuthorities(authorityRepository.findByName(Contains.ROLE_CUSTOMER));
        user.setCreatedDate(new Date(System.currentTimeMillis()));
        user.setUserType(UserType.google);

        Optional<User> users = userRepository.findByEmail(user.getEmail());
        // check infor user
        if (users.isPresent()) {
            if (users.get().getActived() == false) {
                throw new MessageException("Tài khoản đã bị khóa");
            }
            CustomUserDetails customUserDetails = new CustomUserDetails(users.get());
            String token = jwtTokenProvider.generateToken(customUserDetails);
            TokenDto tokenDto = new TokenDto();
            tokenDto.setToken(token);
            tokenDto.setUser(users.get());
            return tokenDto;
        } else {
            User u = userRepository.save(user);
            CustomUserDetails customUserDetails = new CustomUserDetails(u);
            String token = jwtTokenProvider.generateToken(customUserDetails);
            TokenDto tokenDto = new TokenDto();
            tokenDto.setToken(token);
            tokenDto.setUser(u);
            return tokenDto;
        }
    }

    public Boolean checkUser(User user) {
        if (user.getActivationKey() != null && !user.getActived()) {
            throw new MessageException("Tài khoản chưa được kích hoạt", 300);
        } else if (!user.getActived() && user.getActivationKey() == null) {
            throw new MessageException("Tài khoản đã bị khóa", 500);
        }
        return true;
    }




    public User registerUser(UserRequest userRequest) {
        // Kiểm tra email đã tồn tại chưa
        userRepository.findByEmail(userRequest.getEmail())
                .ifPresent(exist -> {
                    if (exist.getActivationKey() != null) {
                        throw new MessageException("Tài khoản chưa được kích hoạt", 330);
                    }
                    throw new MessageException("Email đã được sử dụng", 400);
                });

        // Tạo đối tượng User mới
        User user = new User();
        user.setUserType(UserType.standard);
        user.setPassword(passwordEncoder.encode(userRequest.getPassword())); // Mã hóa mật khẩu
        user.setAuthorities(authorityRepository.findByName(Contains.ROLE_CUSTOMER));
        user.setActived(false);
        user.setEmail(userRequest.getEmail());
        user.setCreatedDate(new Date(System.currentTimeMillis()));
        user.setActivationKey(userUtils.randomKey());

        // Lưu người dùng vào cơ sở dữ liệu
        User result = userRepository.save(user);

        // Gửi email kích hoạt tài khoản
        mailService.sendEmail(user.getEmail(), "Xác nhận tài khoản của bạn",
                "Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi:<br>" +
                        "Để kích hoạt tài khoản của bạn, hãy nhập mã xác nhận bên dưới để xác thực tài khoản của bạn<br><br>" +
                        "<a style=\"background-color: #2f5fad; padding: 10px; color: #fff; font-size: 18px; font-weight: bold;\">" +
                        user.getActivationKey() + "</a>", false, true);

        return result;
    }


    public void activeAccount(String key, String email) {
        logger.info("Bắt đầu kích hoạt tài khoản cho email: {}", email);
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> {
                    logger.error("Không tìm thấy user với email: {}", email);
                    return new MessageException("Email không tồn tại", 404);
                });

        logger.info("User tìm thấy: {}", user.getEmail());
        logger.info("Mã kích hoạt từ yêu cầu: {}, Mã kích hoạt trong DB: {}", key, user.getActivationKey());

        if (user.getActived()) {
            logger.warn("User đã được kích hoạt: {}", email);
            throw new MessageException("Tài khoản đã được kích hoạt trước đó", 400);
        }
        if (user.getActivationKey() == null || !key.equals(user.getActivationKey())) {
            logger.warn("Key kích hoạt không hợp lệ cho email: {}", email);
            throw new MessageException("Mã kích hoạt không hợp lệ", 400);
        }

        user.setActived(true);
        user.setActivationKey(null);
        userRepository.save(user);
        logger.info("Trạng thái tài khoản sau khi lưu: Actived = {}, Activation Key = {}", user.getActived(), user.getActivationKey());
        logger.info("User đã được kích hoạt thành công: {}", email);

    }


    public void sendForgotPasswordRequest(String email, String url) {
        Optional<User> optionalUser = userRepository.findByEmail(email);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            if (user.getUserType().equals(UserType.google)) {
                throw new MessageException("Tài khoản đăng nhập bằng Google, không thể thực hiện chức năng này");
            }

            // Kiểm tra trạng thái của người dùng (ví dụ: đã kích hoạt hay chưa)
            checkUser(user);

            String resetKey = userUtils.randomKey();
            user.setRememberKey(resetKey);
            userRepository.save(user);

            String resetLink = url + "?email=" + email + "&key=" + resetKey;
            String content = "Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi:<br>" +
                    "Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu của bạn.<br>" +
                    "Hãy nhấp vào liên kết dưới đây để đặt lại mật khẩu mới của bạn:<br><br>" +
                    "<a href='" + resetLink + "' style=\"background-color: #2f5fad; padding: 10px; color: #fff; font-size: 18px; font-weight: bold;\">Đặt lại mật khẩu</a>";

            mailService.sendEmail(email, "Đặt lại mật khẩu", content, false, true);
        } else {
            throw new MessageException("Email không tồn tại", 404);
        }
    }


    public void confirmResetPassword(String email, String password, String key) {
        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            checkUser(user);
            if (user.getRememberKey().equals(key)) {
//                user.setPassword(passwordEncoder.encode(password));
                user.setPassword(password);
                user.setRememberKey(null); // Xóa key sau khi sử dụng
                userRepository.save(user);
            } else {
                throw new MessageException("Mã xác thực không chính xác");
            }
        } else {
            throw new MessageException("Email không tồn tại", 404);
        }
    }

    public void guiYeuCauQuenMatKhau(String email, String url) {
        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            if (user.getUserType().equals(UserType.google)) {
                throw new MessageException("Tài khoản đăng nhập bằng google, không thể thực hiện chức năng này");
            }

            checkUser(user);
            String random = userUtils.randomKey();
            user.setRememberKey(random);
            userRepository.save(user);

            mailService.sendEmail(email, "Đặt lại mật khẩu", "Cảm ơn bạn đã tin tưởng và xử dụng dịch vụ của chúng tôi:<br>" +
                    "Chúng tôi đã tạo một mật khẩu mới từ yêu cầu của bạn<br>" +
                    "Hãy lick vào bên dưới để đặt lại mật khẩu mới của bạn<br><br>" +
                    "<a href='" + url + "?email=" + email + "&key=" + random + "' style=\"background-color: #2f5fad; padding: 10px; color: #fff; font-size: 18px; font-weight: bold;\">Đặt lại mật khẩu</a>", false, true);
        } else {
            throw new MessageException("Email không tồn tại", 404);
        }
    }


    public void xacNhanDatLaiMatKhau(String email, String password, String key) {
        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            checkUser(user);
            if (user.getRememberKey().equals(key)) {
                user.setPassword(passwordEncoder.encode(password));
                userRepository.save(user);
            } else {
                throw new MessageException("Mã xác thực không chính xác");
            }
        } else {
            throw new MessageException("Email không tồn tại", 404);
        }
    }


    public void updateInfor(UserUpdate userUpdate) {
        User user = userUtils.getUserWithAuthority();
//        user.setFullName(userUpdate.getFullName());
//        user.setAvatar(userUpdate.getAvatar());
//        user.setAddress(userUpdate.getAddress());
        userRepository.save(user);
    }

    public void changePass(String oldPass, String newPass) {
        User user = userUtils.getUserWithAuthority();
        if (user.getUserType().equals(UserType.google)) {
            throw new MessageException("Xin lỗi, chức năng này không hỗ trợ đăng nhập bằng Google");
        }
        if (passwordEncoder.matches(oldPass, user.getPassword())) {
            user.setPassword(passwordEncoder.encode(newPass));
            userRepository.save(user);
        } else {
            throw new MessageException("Mật khẩu cũ không chính xác", 500);
        }
    }


    public List<User> getUserByRole(String role) {
        if (role == null) {
            return userRepository.findAll();
        }
        return userRepository.getUserByRole(role);
    }

    public void updateRole(Long userId, Long authorityId) {
        User user = userRepository.findById(userId).get();
        Authority authority = authorityRepository.findById(authorityId).get();
        user.setAuthorities(authority);
        userRepository.save(user);
    }
}