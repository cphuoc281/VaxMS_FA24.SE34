import layoutAdmin from '../layout/admin/Layout';
import layoutLogin from '../layout/customer/loginlayout/login';

// Admin components
import homeAdmin from '../pages/admin/index';
import userAdmin from '../pages/admin/user';
import lichTiemChungAdmin from '../pages/admin/lichtiemchung';
import addLichTiemChungAdmin from '../pages/admin/addlichtiemchung';

// Public components
import login from '../pages/public/login';
import index from '../pages/public/index';
import LandingPage from '../pages/public/landingPage'; // Import Landing Page

// Customer components
import dangkytiemchung from '../pages/customer/dangkytiemchung';
import taikhoan from '../pages/customer/taikhoan';

const publicRoutes = [
    { path: "/", component: LandingPage }, // Đặt Landing Page làm trang chính
    { path: "/index", component: index },
    { path: "/login", component: login, layout: layoutLogin },
];

const customerRoutes = [
    { path: "/dang-ky-tiem-chung", component: dangkytiemchung },
    { path: "/tai-khoan", component: taikhoan },
];

const adminRoutes = [
    { path: "/admin/index", component: homeAdmin, layout: layoutAdmin },
    { path: "/admin/user", component: userAdmin, layout: layoutAdmin },
    { path: "/admin/lich-tiem-chung", component: lichTiemChungAdmin, layout: layoutAdmin },
    { path: "/admin/add-lich-tiem-chung", component: addLichTiemChungAdmin, layout: layoutAdmin },
];

export { publicRoutes, adminRoutes, customerRoutes };
