import { ToastContainer } from 'react-toastify';
import { Routes, Route, BrowserRouter as Router } from 'react-router-dom';
import DefaultLayout from './layout/customer/defaultLayout/defaultLayout';
import AdminLayout from './layout/admin/Layout';
import { publicRoutes, adminRoutes, customerRoutes } from './router/index';

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          {/* Public Routes */}
          {publicRoutes.map((route, index) => {
            const Layout = route.layout || DefaultLayout;
            const Page = route.component;
            return (
              <Route
                key={index}
                path={route.path}
                element={
                  <Layout>
                    <Page />
                  </Layout>
                }
              />
            );
          })}

          {/* Customer Routes */}
          {customerRoutes.map((route, index) => {
            const Layout = route.layout || DefaultLayout;
            const Page = route.component;
            return (
              <Route
                key={index}
                path={route.path}
                element={
                  <Layout>
                    <Page />
                  </Layout>
                }
              />
            );
          })}

          {/* Admin Routes */}
          {adminRoutes.map((route, index) => {
            const Layout = route.layout || AdminLayout;
            const Page = route.component;
            return (
              <Route
                key={index}
                path={route.path}
                element={
                  <Layout>
                    <Page />
                  </Layout>
                }
              />
            );
          })}
        </Routes>
      </div>
      {/* Toast notifications */}
      <ToastContainer />
    </Router>
  );
}

export default App;
