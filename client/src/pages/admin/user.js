<<<<<<< HEAD
import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import $ from 'jquery'; 
import DataTable from 'datatables.net-dt';
import Swal from 'sweetalert2'
import {getMethod, postMethod} from '../../services/request'
import Select from 'react-select';


var token = localStorage.getItem("token");

async function loadUser(role){
    var url = 'http://localhost:8080/api/user/admin/get-user-by-role';
    if (role != "") {
        url += '?role=' + role
    }
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    return response;
=======
import { useState, useEffect } from 'react';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import $ from 'jquery';
import Swal from 'sweetalert2';

const token = localStorage.getItem("token");

async function loadUser(role) {
    let url = 'http://localhost:8080/api/user/admin/get-user-by-role';
    if (role) url += `?role=${role}`;

    try {
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);

        return await response.json();
    } catch (error) {
        console.error("Error fetching users:", error);
        throw error;
    }
>>>>>>> feature-admin-code
}

async function handleAddAccount(event) {
    event.preventDefault();
<<<<<<< HEAD
    if(event.target.elements.password.value != event.target.elements.repassword.value){
        toast.error("Mật khẩu không trùng khớp");
        return;
    }
    const payload = {
        fullname: event.target.elements.fullname.value,
        email: event.target.elements.email.value,
        phone: event.target.elements.phone.value,
        password: event.target.elements.password.value
    };
    const res = await fetch('http://localhost:8080/api/user/admin/addaccount', {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(payload)
    });
    var result = await res.json()
    console.log(result);
    if (res.status == 417) {
        toast.error(result.defaultMessage);
    }
    if(res.status < 300){
        Swal.fire({
            title: "Thông báo",
            text: "Tạo tài khoản thành công!",
            preConfirm: () => {
                window.location.reload();
            }
        });
    }
};

const AdminUser = ()=>{
    const [items, setItems] = useState([]);
    const [user, setUer] = useState(null);
    const [authority, setAuthority] = useState([]);
    const [selectedAuthority, setSelectedAuthority] = useState(null);
    useEffect(()=>{
        const getUser = async(role) =>{
            var response = await loadUser(role);
            var listUser = await response.json();
            setItems(listUser)
        };
        getUser(""); 
        const getAuthority = async() =>{
            var response = await getMethod('/api/authority/admin/all');
            var result = await response.json();
            setAuthority(result)
        };
        getAuthority();
    }, []);

    $( document ).ready(function() {
        if(items.length > 0){
            $('#example').DataTable();
        }
    });

    console.log(authority);
    
    async function filterUser(){
        $('#example').DataTable().destroy();
        var role = document.getElementById("role").value
        var response = await loadUser(role);
        var listUser = await response.json();
        setItems(listUser)
    }

    function setInitUser(item){
        setUer(item);
        setSelectedAuthority(item.authorities);
    }

    async function lockOrUnlock(id, type) {
        var con = window.confirm("Xác nhận hành động?");
        if (con == false) {
            return;
        }
        var url = 'http://localhost:8080/api/user/admin/lockOrUnlockUser?id=' + id;
        const response = await fetch(url, {
            method: 'POST',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        if (response.status < 300) {
            var mess = '';
            if (type == 1) {
                mess = 'Khóa thành công'
            } else {
                mess = 'Mở khóa thành công'
            }
            toast.success(mess);
=======
    const { password, repassword, fullname, email, phone } = event.target.elements;

    if (password.value !== repassword.value) {
        toast.error("Mật khẩu không trùng khớp");
        return;
    }

    const payload = {
        fullname: fullname.value,
        email: email.value,
        phone: phone.value,
        password: password.value
    };

    const res = await fetch('http://localhost:8080/api/user/admin/addaccount', {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
    });

    const result = await res.json();
    if (res.status === 417) {
        toast.error(result.defaultMessage);
    } else if (res.ok) {
        Swal.fire({
            title: "Thông báo",
            text: "Tạo tài khoản thành công!",
            preConfirm: () => window.location.reload()
        });
    }
}

const AdminUser = () => {
    const [editUser, setEditUser] = useState(null);
    const [items, setItems] = useState([]);
    const roles = ["Admin", "Doctor", "Nurse", "Customer", "Support Staff"];

    async function handleRoleChange(userId, newRole) {
        const res = await fetch(`http://localhost:8080/api/user/admin/change-role?id=${userId}&role=${newRole}`, {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            }
        });

        if (res.ok) {
            toast.success("Cập nhật quyền thành công!");
            filterUser();
        } else {
            const errorData = await res.json();
            toast.error(errorData.message || "Cập nhật quyền thất bại!");
        }
    }

    useEffect(() => {
        const getUser = async (role) => {
            try {
                const listUser = await loadUser(role);
                setItems(listUser);
            } catch (error) {
                console.error("Failed to load users:", error);
            }
        };

        getUser("");
    }, []);

    useEffect(() => {
        if (items.length > 0) {
            if ($.fn.DataTable.isDataTable('#example')) {
                $('#example').DataTable().clear().rows.add(items).draw();
            } else {
                $('#example').DataTable();
            }
        }
    }, [items]);

    async function filterUser() {
        if ($.fn.DataTable.isDataTable('#example')) {
            $('#example').DataTable().destroy();
        }
        const role = document.getElementById("role").value;
        const response = await loadUser(role);
        setItems(response);
    }

    async function handleDeleteUser(id) {
        const confirmation = window.confirm("Bạn có chắc chắn muốn xóa người dùng này?");
        if (!confirmation) return;

        const res = await fetch(`http://localhost:8080/api/user/admin/delete?id=${id}`, {
            method: 'DELETE',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        if (res.ok) {
            toast.success("Xóa thành công!");
            filterUser();
        } else {
            const errorData = await res.json();
            toast.error(errorData.message || "Xóa thất bại!");
        }
    }

    async function handleEditUser(event) {
        event.preventDefault();

        const payload = {
            id: editUser.id,
            fullname: event.target.elements.fullname.value,
            email: event.target.elements.email.value,
            phone: event.target.elements.phone.value,
        };

        const res = await fetch('http://localhost:8080/api/user/admin/all/update-infor', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        });

        if (res.ok) {
            toast.success("Cập nhật thông tin thành công!");
            filterUser();
            setEditUser(null);
            $('#editUserModal').modal('hide');
        } else {
            const errorData = await res.json();
            toast.error(errorData.message || "Cập nhật thông tin thất bại!");
        }
    }

    async function lockOrUnlock(id, type) {
        const confirmation = window.confirm("Xác nhận hành động?");
        if (!confirmation) return;

        const response = await fetch(`http://localhost:8080/api/user/admin/lockOrUnlockUser?id=${id}`, {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        if (response.ok) {
            toast.success(type === 1 ? 'Khóa thành công' : 'Mở khóa thành công');
>>>>>>> feature-admin-code
            filterUser();
        } else {
            toast.error("Thất bại");
        }
    }
<<<<<<< HEAD
    
    async function updateRole(event) {
        event.preventDefault();
     
        var url = '/api/user/admin/update-role?userId='+user.id+'&authorityId='+selectedAuthority.id
        const res = await postMethod(url)
        if(res.status < 300){
            Swal.fire({
                title: "Thông báo",
                text: "Thành công!",
                preConfirm: () => {
                    window.location.reload();
                }
            });
        }
        else{
            toast.error("Thất bại");
        }
    };

    return (
        <>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-6">
                    <label  class="lb-form" dangerouslySetInnerHTML={{__html:'&ThinSpace;'}}></label>
                    <a data-bs-toggle="modal" data-bs-target="#addtk" class="btn btn-primary"><i class="fa fa-plus"></i> Thêm admin</a>
                </div>
                <div class="col-md-3 col-sm-6 col-6">
                    <label class="lb-form">Chọn quyền</label>
                    <select onChange={()=>filterUser()} id='role' class="form-control">
=======

    return (
        <>
            <div className="row">
                <div className="col-md-3 col-sm-6 col-6">
                    <label className="lb-form" dangerouslySetInnerHTML={{ __html: '&ThinSpace;' }}></label>
                    <button data-bs-toggle="modal" data-bs-target="#addtk" className="btn btn-primary">
                        <i className="fa fa-plus"></i> Thêm admin
                    </button>
                </div>
                <div className="col-md-3 col-sm-6 col-6">
                    <label className="lb-form">Chọn quyền</label>
                    <select onChange={filterUser} id='role' className="form-control">
>>>>>>> feature-admin-code
                        <option value="">Tất cả quyền</option>
                        <option value="ROLE_USER">Tài khoản người dùng</option>
                        <option value="ROLE_ADMIN">Tài khoản admin</option>
                    </select>
                </div>
            </div>
<<<<<<< HEAD
            <div class="tablediv">
                <div class="headertable">
                    <span class="lbtable">Danh sách tài khoản</span>
                </div>
                <div class="divcontenttable">
                    <table id="example" class="table table-bordered">
=======
            <div className="tablediv">
                <div className="headertable">
                    <span className="lbtable">Danh sách tài khoản</span>
                </div>
                <div className="divcontenttable">
                    <table id="example" className="table table-bordered">
>>>>>>> feature-admin-code
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Email</th>
                                <th>Họ tên</th>
                                <th>Số điện thoại</th>
                                <th>Ngày tạo</th>
                                <th>Quyền</th>
<<<<<<< HEAD
=======
                                <th>Hành động</th>
>>>>>>> feature-admin-code
                                <th>Khóa</th>
                            </tr>
                        </thead>
                        <tbody>
<<<<<<< HEAD
                            {items.map((item=>{
                                var btn = '';
                                if (item.actived == 0) {
                                    var btn = <button onClick={()=>lockOrUnlock(item.id,0)} class="btn btn-danger"><i class="fa fa-unlock"></i> mở khóa</button>
                                } else {
                                    var btn = <button onClick={()=>lockOrUnlock(item.id,1)} class="btn btn-primary"><i class="fa fa-lock"></i> Khóa</button>
                                }
                                return  <tr>
=======
                            {items.map(item => (
                                <tr key={item.id}>
>>>>>>> feature-admin-code
                                    <td>{item.id}</td>
                                    <td>{item.email}</td>
                                    <td>{item.fullname}</td>
                                    <td>{item.phone}</td>
                                    <td>{item.createdDate}</td>
<<<<<<< HEAD
                                    <td>{item.authorities.name} <i onClick={()=>setInitUser(item)} data-bs-toggle="modal" data-bs-target="#updatequyen"  className='fa fa-edit pointer'></i></td>
                                    <td class="sticky-col">
                                        {btn}
                                    </td>
                                </tr>
                            }))}
=======
                                    <td>
                                        <select value={item.authorities.name} onChange={e => handleRoleChange(item.id, e.target.value)}>
                                            {roles.map(role => (
                                                <option key={role} value={role}>
                                                    {role.replace('ROLE_', '').replace('_', ' ')}
                                                </option>
                                            ))}
                                        </select>
                                    </td>
                                    <td>
                                        <button className="btn btn-warning" onClick={() => { setEditUser(item); $('#editUserModal').modal('show'); }}>
                                            <i className="fa fa-edit"></i> Sửa
                                        </button>
                                        <button className="btn btn-danger" onClick={() => handleDeleteUser(item.id)}>
                                            <i className="fa fa-trash"></i> Xóa
                                        </button>
                                    </td>
                                    <td className="sticky-col">
                                        <button onClick={() => lockOrUnlock(item.id, item.actived ? 0 : 1)} className={item.actived ? "btn btn-primary" : "btn btn-danger"}>
                                            <i className={item.actived ? "fa fa-lock" : "fa fa-unlock"}></i> {item.actived ? 'Khóa' : 'Mở khóa'}
                                        </button>
                                    </td>
                                </tr>
                            ))}
>>>>>>> feature-admin-code
                        </tbody>
                    </table>
                </div>
            </div>

<<<<<<< HEAD
            <div class="modal fade" id="addtk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm tài khoản quản trị</h5> <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
                        <div class="modal-body row">
                            <form onSubmit={handleAddAccount} class="col-sm-6" style={{margin:'auto'}}>
                                <label class="lb-form">Họ tên</label>
                                <input name='fullname' id="fullname" class="form-control"/>
                                <label class="lb-form">Số điện thoại</label>
                                <input name='phone' id="phone" class="form-control"/>
                                <label class="lb-form">Email</label>
                                <input name='email' required id="email" class="form-control"/>
                                <label class="lb-form">Mật khẩu</label>
                                <input name='password' required id="pass" type="password" class="form-control"/>
                                <label class="lb-form">Nhắc lại mật khẩu</label>
                                <input name='repassword' required id="repass" type="password" class="form-control"/>
                                <br/>
                                <button class="form-control btn btn-primary">Thêm tài khoản</button>
=======
            {/* Add Account Modal */}
            <div className="modal fade" id="addtk" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
                <div className="modal-dialog modal-lg">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">Thêm tài khoản quản trị</h5>
                            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body row">
                            <form onSubmit={handleAddAccount} className="col-sm-6" style={{ margin: 'auto' }}>
                                <label className="lb-form">Họ tên</label>
                                <input name='fullname' className="form-control" required />
                                <label className="lb-form">Số điện thoại</label>
                                <input name='phone' className="form-control" required />
                                <label className="lb-form">Email</label>
                                <input name='email' className="form-control" required />
                                <label className="lb-form">Mật khẩu</label>
                                <input name='password' type="password" className="form-control" required />
                                <label className="lb-form">Nhắc lại mật khẩu</label>
                                <input name='repassword' type="password" className="form-control" required />
                                <button className="form-control btn btn-primary">Thêm tài khoản</button>
>>>>>>> feature-admin-code
                            </form>
                        </div>
                    </div>
                </div>
            </div>

<<<<<<< HEAD

            <div class="modal fade" id="updatequyen" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thay đổi quyền</h5> <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
                        <div class="modal-body row">
                            <form onSubmit={updateRole} class="col-sm-6" style={{margin:'auto'}}>
                                <label class="lb-form">Chọn quyền</label>
                                <Select
                                    className="select-container" 
                                    options={authority}
                                    value={selectedAuthority}
                                    onChange={setSelectedAuthority}
                                    getOptionLabel={(option) => option.name} 
                                    getOptionValue={(option) => option.id}    
                                    closeMenuOnSelect={false}
                                    name='authority'
                                    placeholder="Chọn quyền"
                                />
                                <br/>
                                <button class="form-control btn btn-primary">Cập nhật</button>
                            </form>
=======
            {/* Edit User Modal */}
            <div className="modal fade" id="editUserModal" tabIndex="-1" aria-labelledby="editUserModalLabel" aria-hidden="false">
                <div className="modal-dialog modal-lg">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">Chỉnh sửa tài khoản</h5>
                            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body row">
                            {editUser && (
                                <form onSubmit={handleEditUser} className="col-sm-6" style={{ margin: 'auto' }}>
                                    <label className="lb-form">Họ tên</label>
                                    <input name='fullname' defaultValue={editUser.fullname} className="form-control" required />
                                    <label className="lb-form">Số điện thoại</label>
                                    <input name='phone' defaultValue={editUser.phone} className="form-control" required />
                                    <label className="lb-form">Email</label>
                                    <input name='email' defaultValue={editUser.email} className="form-control" required />
                                    <button className="form-control btn btn-warning">Cập nhật thông tin</button>
                                </form>
                            )}
>>>>>>> feature-admin-code
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
<<<<<<< HEAD
}

export default AdminUser;
=======
};

export default AdminUser;
>>>>>>> feature-admin-code
