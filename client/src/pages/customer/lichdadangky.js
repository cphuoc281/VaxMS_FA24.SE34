import Footer from '../../layout/customer/footer/footer'
import logomini from '../../assest/images/logomini.svg'
import { useState, useEffect } from 'react'
import { Parser } from "html-to-react";
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import Select from 'react-select';
import {getMethod, postMethod} from '../../services/request';
import Swal from 'sweetalert2'


function LichDaDangKy(){
    const [customerSchedule, setCustomerSchedule] = useState([]);
    useEffect(()=>{
        const getItem= async() =>{
            var response = await getMethod('/api/customer-schedule/customer/my-schedule');
            var result = await response.json();
            setCustomerSchedule(result)
        };
        getItem();
    }, []);
  
    async function hoanTiem(id) {
        var con = window.confirm("Xác nhận hoãn tiêm?");
        if(con == false){
            return;
        }
        var res = await postMethod('/api/customer-schedule/customer/cancel?id='+id)
        if (res.status < 300) {
            Swal.fire({
                title: "Thông báo",
                text: "Đã hủy lịch tiêm thành công!",
                preConfirm: () => {
                    getLichDangKy();
                }
            });
        } else {
            if(res.status == 417){
                var result = await res.json();
                toast.error(result.defaultMessage);
            }
            else{
                toast.error("Đăng ký lịch tiêm thất bại");
            }
        }
    }

    const getLichDangKy= async() =>{
        var response = await getMethod('/api/customer-schedule/customer/my-schedule');
        var result = await response.json();
        setCustomerSchedule(result)
    };
    return(
        <>
            <div class="tablediv">
                <div class="headertable">
                    <span class="lbtable">Danh sách lịch tiêm chủng</span>
                </div>
                <div class="divcontenttable">
                    <table id="example" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Vacxin</th>
                                <th>Trung tâm</th>
                                <th>Ngày đăng ký</th>
                                <th>Ngày tiêm</th>
                                <th>Thanh toán</th>
                                <th>Trạng thái</th>
                                <th>Hoãn tiêm</th>
                            </tr>
                        </thead>
                        <tbody>
                        {customerSchedule.map((item, index)=>{
                            return <tr>
                                <td>{item.vaccineSchedule.vaccine.name}</td>
                                <td>{item.vaccineSchedule.center.centerName}</td>
                                <td>{item.createdDate}</td>
                                <td>{item.vaccineSchedule.startDate} đến {item.vaccineSchedule.endDate}</td>
                                <td>{item.payStatus == false?'Chưa thanh toán':'Đã thanh toán'}</td>
                                <td>{item.statusCustomerSchedule}</td>
                                <td>
                                    {
                                    item.payStatus == false && 
                                    (item.statusCustomerSchedule == 'pending' || item.statusCustomerSchedule == 'confirmed')?
                                    <button onClick={()=>hoanTiem(item.id)} className='btn btn-primary'>xác nhận</button>:<></>
                                    }
                                </td>
                            </tr>
                         })}
                        </tbody>
                    </table>
                </div>
            </div>
        </>
    );
}

export default LichDaDangKy;
