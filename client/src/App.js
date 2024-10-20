import { ToastContainer, toast } from 'react-toastify';
import { Routes, Route, BrowserRouter as Router } from 'react-router-dom'
import DefaultLayout from './layout/customer/defaultLayout/defaultLayout'
import { publicRoutes, adminRoutes, customerRoutes, staffRoutes, componentRouter } from './router/index';
import AdminLayout from './layout/admin/Layout'
import "./App.css"
import 'bootstrap/dist/css/bootstrap.min.css';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          {publicRoutes.map((route, index) => {
            const Layout = route.layout || DefaultLayout
            const Page = route.component
            return <Route key={index} path={route.path} element={
              <Layout>
                <Page />
              </Layout>
            } />
          })}



          {customerRoutes.map((route, index) => {
            const Layout = route.layout || DefaultLayout
            const Page = route.component
            return <Route key={index} path={route.path} element={
              <Layout>
                <Page />
              </Layout>
            } />
          })}


          {adminRoutes.map((route, index) => {
            const Layout = route.layout || AdminLayout
            const Page = route.component
            return <Route key={index} path={route.path} element={
              <Layout>
                <Page />
              </Layout>
            } />
          })}
          {/* Component Router Routes */}
          {componentRouter.map((route, index) => {
            const Layout = route.layout || DefaultLayout;
            const Page = route.component;
            return (
              <Route
                key={`component-${index}`}
                path={route.path}
                element={
                  <Layout>
                    <Page />
                  </Layout>
                }
              />
            );
          })}
          {staffRoutes.map((route, index) => {
            const Layout = route.layout
            const Page = route.component
            return <Route key={index} path={route.path} element={
              <Layout>
                <Page />
              </Layout>
            } />
          })}

        </Routes>
      </div>
      <ToastContainer />
    </Router>

  );

}

export default App;
