package com.web.api;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.web.dto.*;
import com.web.entity.Authority;
import com.web.entity.User;
import com.web.exception.MessageException;
import com.web.jwt.JwtTokenProvider;
import com.web.repository.AuthorityRepository;
import com.web.repository.UserRepository;
import com.web.service.GoogleOAuth2Service;
import com.web.service.UserService;
import com.web.utils.Contains;
import com.web.utils.MailService;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
<<<<<<< HEAD
=======
import java.util.Arrays;
import java.util.Collections;
>>>>>>> feature-admin-code
import java.util.List;

@RestController
@RequestMapping("/api/user")
@CrossOrigin
public class UserApi {

    private final UserRepository userRepository;

    private final JwtTokenProvider jwtTokenProvider;

    private final UserUtils userUtils;

    private final MailService mailService;

    @Autowired
    private AuthorityRepository authorityRepository;

    @Autowired
    private UserService userService;

<<<<<<< HEAD
    public UserApi(UserRepository userRepository, JwtTokenProvider jwtTokenProvider, UserUtils userUtils, MailService mailService) {
=======
    public UserApi(UserRepository userRepository, JwtTokenProvider jwtTokenProvider, UserUtils userUtils,
            MailService mailService) {
>>>>>>> feature-admin-code
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
<<<<<<< HEAD
        if(payload == null){
=======
        if (payload == null) {
>>>>>>> feature-admin-code
            throw new MessageException("Đăng nhập thất bại");
        }
        TokenDto tokenDto = userService.loginWithGoogle(payload);
        return new ResponseEntity(tokenDto, HttpStatus.OK);
    }

    @PostMapping("/login/email")
    public ResponseEntity<?> loginWithEmail(@RequestBody LoginDto loginDto) throws Exception {
        TokenDto tokenDto = userService.login(loginDto.getEmail(), loginDto.getPassword());
        return new ResponseEntity(tokenDto, HttpStatus.OK);
    }
<<<<<<< HEAD
    @PostMapping("/admin/update-role")
    public ResponseEntity<?> updateRole(@RequestParam Long userId, @RequestParam Long authorityId) throws Exception {
        userService.updateRole(userId, authorityId);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PostMapping("/public/regis")
    public ResponseEntity<?> regisUser(@RequestBody UserRequest userRequest) {
        User result= userService.regisUser(userRequest);
        return new ResponseEntity(result, HttpStatus.OK);
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

    @PostMapping("/public/send-request-forgot-password")
    public ResponseEntity<?> quenMatKhau(@RequestBody ForgotPasswordDto forgotPasswordDto){
=======

    @PostMapping("/public/regis")
    public ResponseEntity<?> regisUser(@RequestBody UserRequest userRequest) {
        User result = userService.regisUser(userRequest);
        return new ResponseEntity(result, HttpStatus.OK);
    }

    @PostMapping("/public/active-account")
    public ResponseEntity<?> activeAccount(@RequestParam String email, @RequestParam String key) {
        userService.activeAccount(key, email);
        return new ResponseEntity<>("kích hoạt thành công", HttpStatus.OK);
    }

    @PostMapping("/public/send-request-forgot-password")
    public ResponseEntity<?> quenMatKhau(@RequestBody ForgotPasswordDto forgotPasswordDto) {
>>>>>>> feature-admin-code
        userService.guiYeuCauQuenMatKhau(forgotPasswordDto.getEmail(), forgotPasswordDto.getUrl());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/public/complete-forgot-password")
    public ResponseEntity<?> datLaiMatKhau(@RequestParam String email, @RequestParam String key,
<<<<<<< HEAD
                                           @RequestParam String password) {
=======
            @RequestParam String password) {
>>>>>>> feature-admin-code
        userService.xacNhanDatLaiMatKhau(email, password, key);
        return new ResponseEntity<>(HttpStatus.OK);
    }

<<<<<<< HEAD
    // @PostMapping("/public/send-forgot-password-request")
    // public ResponseEntity<?> sendForgotPasswordRequest(@RequestBody ForgotPasswordDto forgotPasswordDto){
    //     userService.sendForgotPasswordRequest(forgotPasswordDto.getEmail(), forgotPasswordDto.getUrl());
    //     return new ResponseEntity<>(HttpStatus.OK);
    // }

    // @PostMapping("/public/confirm-reset-password")
    // public ResponseEntity<?> confirmResetPassword(@RequestParam String email, @RequestParam String key,
    //                                               @RequestParam String password) {
    //     userService.confirmResetPassword(email, password, key);
    //     return new ResponseEntity<>(HttpStatus.OK);
    // }
    @PostMapping("/all/user-logged")
    public ResponseEntity<?> inforLogged()  {
        return new ResponseEntity<>(userUtils.getUserWithAuthority(),HttpStatus.OK);
    }

    @PostMapping("/all/update-infor")
    public void updateThongTin(@RequestBody UserUpdate userUpdate){
=======
    @PostMapping("/all/user-logged")
    public ResponseEntity<?> inforLogged() {
        return new ResponseEntity<>(userUtils.getUserWithAuthority(), HttpStatus.OK);
    }

    @PostMapping("/all/update-infor")
    public void updateThongTin(@RequestBody UserUpdate userUpdate) {
>>>>>>> feature-admin-code
        userService.updateInfor(userUpdate);
    }

    @PostMapping("/all/change-password")
<<<<<<< HEAD
    public ResponseEntity<?> changePassword(@RequestBody PasswordDto passwordDto){
=======
    public ResponseEntity<?> changePassword(@RequestBody PasswordDto passwordDto) {
>>>>>>> feature-admin-code
        userService.changePass(passwordDto.getOldPass(), passwordDto.getNewPass());
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @PostMapping("/admin/lockOrUnlockUser")
<<<<<<< HEAD
    public void activeOrUnactiveUser(@RequestParam("id") Long id){
        User user = userRepository.findById(id).get();
        if(user.getActived() == true){
            user.setActived(false);
            userRepository.save(user);
            return;
        }
        else{
=======
    public void activeOrUnactiveUser(@RequestParam("id") Long id) {
        User user = userRepository.findById(id).get();
        if (user.getActived() == true) {
            user.setActived(false);
            userRepository.save(user);
            return;
        } else {
>>>>>>> feature-admin-code
            user.setActived(true);
            userRepository.save(user);
        }
    }

    @PostMapping("/admin/change-role")
<<<<<<< HEAD
    public void changeRole(@RequestParam("id") Long id, @RequestParam String role){
=======
    public void changeRole(@RequestParam("id") Long id, @RequestParam String role) {
>>>>>>> feature-admin-code
        User user = userRepository.findById(id).get();
        Authority authority = authorityRepository.findByName(role);
        user.setAuthorities(authority);
        userRepository.save(user);
    }

<<<<<<< HEAD

    @GetMapping("/admin/get-user-by-role")
    public ResponseEntity<?> getUserByRole(@RequestParam(value = "role", required = false) String role){
=======
    @GetMapping("/admin/get-user-by-role")
    public ResponseEntity<?> getUserByRole(@RequestParam(value = "role", required = false) String role) {
>>>>>>> feature-admin-code
        List<User> users = userService.getUserByRole(role);
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @DeleteMapping("/admin/delete")
<<<<<<< HEAD
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        try {
            userRepository.deleteById(id);
        }catch (Exception e){
=======
    public ResponseEntity<?> delete(@RequestParam("id") Long id) {
        try {
            userRepository.deleteById(id);
        } catch (Exception e) {
>>>>>>> feature-admin-code
            throw new MessageException("Tài khoản đã liên kết dữ liệu không thể xóa");
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

<<<<<<< HEAD

    @GetMapping("/admin/check-role-admin")
    public void checkRoleAdmin(){
=======
    @GetMapping("/admin/check-role-admin")
    public void checkRoleAdmin() {
>>>>>>> feature-admin-code
        System.out.println("admin");
    }

    @GetMapping("/user/check-role-user")
<<<<<<< HEAD
    public void checkRoleUser(){
        System.out.println("user");
    }

    @GetMapping("/employee/check-role-employee")
    public void checkRoleEmp(){
=======
    public void checkRoleUser() {
        System.out.println("user");
    }

    @GetMapping("/{accountId}/roles")
    public ResponseEntity<List<String>> getUserRoles(@PathVariable Long accountId) {
        List<String> roles = userService.getRolesByAccountId(accountId);
        if (roles.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Collections.singletonList("Không tìm thấy quyền cho tài khoản này."));
        }
        return ResponseEntity.ok(roles);
    }

    @GetMapping("/employee/check-role-employee")
    public void checkRoleEmp() {
>>>>>>> feature-admin-code
        System.out.println("user");
    }

}
