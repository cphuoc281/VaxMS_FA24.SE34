import React, { useState, useEffect } from 'react';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { postMethod } from '../../services/request';
import Swal from 'sweetalert2';
import '../../layout/customer/styles/login.scss'; // Assuming you created a login.scss file for custom styles.

function ConfirmRegis() {

  useEffect(() => {
    
  }, []);

  async function handleConfirm(event) {
    event.preventDefault();
    var uls = new URL(document.URL)
    var email = uls.searchParams.get("email");
    var key = event.target.elements.maxt.value
    var url = '/api/user/public/active-account?email=' + email + '&key=' + key
    const res = await postMethod(url)
    if (res.status == 417) {
        var result = await res.json()
        toast.error(result.defaultMessage);
    }
    if(res.status < 300){
        Swal.fire({
            title: "Thông báo",
            text: "Xác nhận tài khoản thành công!",
            preConfirm: () => {
                window.location.href = 'login'
            }
        });
    }
  }

  return (
    <div class="contentweb">
        <div class="container">
            <div class="dangnhapform">
                <div class="divctlogin">
                    <p class="labeldangnhap">xÁC NHÂN</p>
                    <form onSubmit={handleConfirm} autocomplete="off">
                        <label class="lbform">Mã xác thực</label>
                        <input required name='maxt' class="inputlogin"/>
                        <button class="btndangnhap">XÁC NHẬN</button>
                        <button type="button"  onClick={()=>{window.location.href = 'login'}} class="btndangky">ĐĂNG NHẬP</button>
                    </form><br/><br/><br/>
                    <hr/>
                </div>
            </div>
        </div>
    </div>
  );
}

export default ConfirmRegis;
