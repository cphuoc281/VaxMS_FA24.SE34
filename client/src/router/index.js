import 'bootstrap/dist/css/bootstrap.min.css';

import layoutAdmin from '../layout/admin/Layout';
import layoutLogin from '../layout/customer/loginlayout/login';
import layoutStaff from "../layout/staff/Layout";

//admin
import homeAdmin from '../pages/admin/index';
import userAdmin from '../pages/admin/user';
import lichTiemChungAdmin from '../pages/admin/lichtiemchung';
import addLichTiemChungAdmin from '../pages/admin/addlichtiemchung';

// Components 
import ActivateAccount from '../pages/components/ActivateAccount';
// Public components
import login from '../pages/public/login';
import register from '../pages/public/register';
import index from '../pages/public/index';
import TraCuuLichTiem from "../pages/public/tracuulichtiem";
import LichTiemDaQua from "../pages/public/lichtiemdaqua";

//customer
import dangkytiemchung from '../pages/customer/dangkytiemchung';
import taikhoan from '../pages/customer/taikhoan';
import thongbao from "../pages/customer/thongbao";

//staff
import StaffChat from "../pages/staff/chat";
import Vaccine from "../pages/staff/vaccine/vaccine";
import VaccineInventory from "../pages/staff/vaccineInventory/VaccineInventory";
import CustomerSchedule from "../pages/staff/customerSchedule/CustomerSchedule";

import LandingPage from '../pages/public/landingPage'; // Import Landing Page

// Customer components


const publicRoutes = [
    { path: "/", component: LandingPage }, // Đặt Landing Page làm trang chính
    { path: "/index", component: index },
    { path: "/login", component: login, layout: layoutLogin },
    { path: "/register", component: register },
    { path: "/tra-cuu-lich-tiem", component: TraCuuLichTiem },
    { path: "/lich-tiem-da-qua", component: LichTiemDaQua },
];

const customerRoutes = [
    { path: "/dang-ky-tiem-chung", component: dangkytiemchung },
    { path: "/tai-khoan", component: taikhoan },
    { path: "/thong-bao", component: thongbao },
];

const adminRoutes = [
    { path: "/admin/index", component: homeAdmin, layout: layoutAdmin },
    { path: "/admin/user", component: userAdmin, layout: layoutAdmin },
    {
        path: "/admin/lich-tiem-chung",
        component: lichTiemChungAdmin,
        layout: layoutAdmin,
    },
    {
        path: "/admin/add-lich-tiem-chung",
        component: addLichTiemChungAdmin,
        layout: layoutAdmin,
    },
];



const staffRoutes = [
    { path: "/staff/chat", component: StaffChat, layout: layoutStaff },
    { path: "/staff/vaccine", component: Vaccine, layout: layoutStaff },
    { path: "/staff/vaccine-inventory", component: VaccineInventory, layout: layoutStaff },
    { path: "/staff/customer-schedule", component: CustomerSchedule, layout: layoutStaff },
];

const componentRouter = [
    { path: "/activate-account", component: ActivateAccount },
];
export { publicRoutes, adminRoutes, customerRoutes, staffRoutes, componentRouter };







