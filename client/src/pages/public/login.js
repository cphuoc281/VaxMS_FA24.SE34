import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import logologin from '../../assest/images/logologin.jpg'
import {postMethodPayload} from '../../services/request'
import Swal from 'sweetalert2'

async function handleLogin(event) {
    event.preventDefault();
    const payload = {
        email: event.target.elements.username.value,
        password: event.target.elements.password.value
    };
    const res = await postMethodPayload('/api/user/login/email', payload);
    
    var result = await res.json()
    console.log(result);
    if (res.status == 417) {
        if (result.errorCode == 300) {
            Swal.fire({
                title: "Thông báo",
                text: "Tài khoản chưa được kích hoạt, đi tới kích hoạt tài khoản!",
                preConfirm: () => {
                    window.location.href = 'confirm?email=' + event.target.elements.username.value
                }
            });
        } else {
            toast.warning(result.defaultMessage);
        }
    }
    if(res.status < 300){
        toast.success('Đăng nhập thành công!');
        await new Promise(resolve => setTimeout(resolve, 1500));
        localStorage.setItem("token", result.token);
        localStorage.setItem("user", JSON.stringify(result.user));
        if (result.user.authorities.name === "Admin") {
            window.location.href = 'admin/index';
        }
        if (result.user.authorities.name === "Customer") {
            window.location.href = '/index';
        }
        if (result.user.authorities.name === "Doctor") {
            
        }
        if (result.user.authorities.name === "Nurse") {

        }
        if (result.user.authorities.name === "Support Staff") {

        }
    }
};

function login(){
    return(
        <div class="contentweb">
        <div class="container">
            <div class="dangnhapform">
                <div class="divctlogin">
                    <p class="labeldangnhap">Đăng Nhập</p>
                    <form onSubmit={handleLogin} autocomplete="off">
                        <label class="lbform">Tên tài khoản</label>
                        <input required name='username' id="username" class="inputlogin"/>
                        <label class="lbform">Mật khẩu</label>
                        <input required name='password' type="password" id="password" class="inputlogin"/>
                        <button class="btndangnhap">ĐĂNG NHẬP</button>
                        <button type="button"  onClick={()=>{window.location.href = 'regis'}} class="btndangky">ĐĂNG KÝ</button>
                    </form>
                    <a href="forgot" class="lbquenmk">Quên mật khẩu ?</a>
                </div>
            </div>
        </div>
    </div>
    );
}
export default login;