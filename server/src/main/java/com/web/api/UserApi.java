package com.web.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.web.dto.SuccessResponse;
import com.web.dto.ActivateAccountDto;
import com.web.dto.ErrorResponse;
import com.web.dto.ForgotPasswordDto;
import com.web.dto.LoginDto;
import com.web.dto.PasswordDto;
import com.web.dto.TokenDto;
import com.web.dto.UserRequest;
import com.web.dto.UserUpdate;
import com.web.entity.Authority;
import com.web.entity.User;
import com.web.exception.MessageException;
import com.web.jwt.JwtTokenProvider;
import com.web.repository.AuthorityRepository;
import com.web.repository.UserRepository;
import com.web.service.GoogleOAuth2Service;
import com.web.service.UserService;
import com.web.utils.MailService;
import com.web.utils.UserUtils;


@RestController
@RequestMapping("/api/user")
@CrossOrigin// Đảm bảo origin đúng
public class UserApi {

    private final UserRepository userRepository;

    private final JwtTokenProvider jwtTokenProvider;

    private final UserUtils userUtils;

    private final MailService mailService;

    @Autowired
    private AuthorityRepository authorityRepository;

    @Autowired
    private UserService userService;

    public UserApi(UserRepository userRepository, JwtTokenProvider jwtTokenProvider, UserUtils userUtils, MailService mailService) {
        this.userRepository = userRepository;
        this.jwtTokenProvider = jwtTokenProvider;
        this.userUtils = userUtils;
        this.mailService = mailService;
    }

    @Autowired
    private GoogleOAuth2Service googleOAuth2Service;

    @PostMapping("/login/google")
    public ResponseEntity<?> loginWithGoogle(@RequestBody String credential) throws Exception {
        GoogleIdToken.Payload payload = googleOAuth2Service.verifyToken(credential);
        if(payload == null){
            throw new MessageException("Đăng nhập thất bại");
        }
        TokenDto tokenDto = userService.loginWithGoogle(payload);
        return new ResponseEntity(tokenDto, HttpStatus.OK);
    }


    @PostMapping("/login/email")
    public ResponseEntity<?> loginWithEmail(@RequestBody LoginDto loginDto) throws Exception {
        TokenDto tokenDto = userService.login(loginDto.getEmail(), loginDto.getPassword());
        System.out.println("login email");
        return new ResponseEntity(tokenDto, HttpStatus.OK);
    }

    @PostMapping("/admin/update-role")
    public ResponseEntity<?> updateRole(@RequestParam Long userId, @RequestParam Long authorityId) throws Exception {
        userService.updateRole(userId, authorityId);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PostMapping("/public/register")
    public ResponseEntity<?> registerUser(@RequestBody UserRequest userRequest) {
        User result = userService.registerUser(userRequest);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }




    @PostMapping("/public/active-account")
    public ResponseEntity<?> activeAccount(@RequestBody ActivateAccountDto activateAccountDto) {
        try {
            userService.activeAccount(activateAccountDto.getKey(), activateAccountDto.getEmail());
            SuccessResponse successResponse = new SuccessResponse("Kích hoạt thành công");
            return new ResponseEntity<>(successResponse, HttpStatus.OK);
        } catch (MessageException e) {
//            ErrorResponse errorResponse = new ErrorResponse(e.getMessage(), e.getStatus());
            return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
        } catch (Exception e) {
            ErrorResponse errorResponse = new ErrorResponse("Đã xảy ra lỗi", HttpStatus.INTERNAL_SERVER_ERROR.value());
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


//    @PostMapping("/public/send-request-forgot-password")
//    public ResponseEntity<?> quenMatKhau(@RequestBody ForgotPasswordDto forgotPasswordDto){
//        userService.guiYeuCauQuenMatKhau(forgotPasswordDto.getEmail(), forgotPasswordDto.getUrl());
//        return new ResponseEntity<>(HttpStatus.OK);
//    }
//
//    @PostMapping("/public/complete-forgot-password")
//    public ResponseEntity<?> datLaiMatKhau(@RequestParam String email, @RequestParam String key,
//                                           @RequestParam String password) {
//        userService.xacNhanDatLaiMatKhau(email, password, key);
//        return new ResponseEntity<>(HttpStatus.OK);
//    }

    @PostMapping("/public/send-forgot-password-request")
    public ResponseEntity<?> sendForgotPasswordRequest(@RequestBody ForgotPasswordDto forgotPasswordDto){
        userService.sendForgotPasswordRequest(forgotPasswordDto.getEmail(), forgotPasswordDto.getUrl());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/public/confirm-reset-password")
    public ResponseEntity<?> confirmResetPassword(@RequestParam String email, @RequestParam String key,
                                                  @RequestParam String password) {
        userService.confirmResetPassword(email, password, key);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @PostMapping("/all/user-logged")
    public ResponseEntity<?> inforLogged()  {
        return new ResponseEntity<>(userUtils.getUserWithAuthority(),HttpStatus.OK);
    }

    @PostMapping("/all/update-infor")
    public void updateThongTin(@RequestBody UserUpdate userUpdate){
        userService.updateInfor(userUpdate);
    }

    @PostMapping("/all/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordDto passwordDto){
        userService.changePass(passwordDto.getOldPass(), passwordDto.getNewPass());
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @PostMapping("/admin/lockOrUnlockUser")
    public void activeOrUnactiveUser(@RequestParam("id") Long id){
        User user = userRepository.findById(id).get();
        if(user.getActived() == true){
            user.setActived(false);
            userRepository.save(user);
            return;
        }
        else{
            user.setActived(true);
            userRepository.save(user);
        }
    }

    @PostMapping("/admin/change-role")
    public void changeRole(@RequestParam("id") Long id, @RequestParam String role){
        User user = userRepository.findById(id).get();
        Authority authority = authorityRepository.findByName(role);
        user.setAuthorities(authority);
        userRepository.save(user);
    }


    @GetMapping("/admin/get-user-by-role")
    public ResponseEntity<?> getUserByRole(@RequestParam(value = "role", required = false) String role){
        List<User> users = userService.getUserByRole(role);
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        try {
            userRepository.deleteById(id);
        }catch (Exception e){
            throw new MessageException("Tài khoản đã liên kết dữ liệu không thể xóa");
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/admin/check-role-admin"
)
    public void checkRoleAdmin(){
        System.out.println("admin");
    }

    @GetMapping("/user/check-role-user")
    public void checkRoleUser(){
        System.out.println("user");
    }

    @GetMapping("/employee/check-role-employee")
    public void checkRoleEmp(){
        System.out.println("employee");
    }

    @GetMapping("/employee/check-role-staff")
    public void checkRoleStaff(){
        System.out.println("staff");
    }

    @GetMapping("/employee/check-role-doctor")
    public void checkRoleDoctor(){
        System.out.println("doctor");
    }

    @GetMapping("/employee/check-role-nurse")
    public void checkRoleNurse(){
        System.out.println("nurse");
    }
}