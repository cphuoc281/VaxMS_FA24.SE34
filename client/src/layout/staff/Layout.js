import lich from "../../assest/images/lich.png";
import avatar from "../../assest/images/user.svg";
import {useEffect, useState} from "react";

function Header({ children }) {
  const [isCssLoaded, setCssLoaded] = useState(false);
  useEffect(() => {
    if (!isCssLoaded) {
      import("../staff/layout.scss").then(() => setCssLoaded(true));
    }
  }, [isCssLoaded]);
  function getDateTime() {
    const now = new Date();
    const format = (val) => (val.toString().length === 1 ? "0" + val : val);
    const year = now.getFullYear();
    const month = format(now.getMonth() + 1);
    const day = format(now.getDate());
    const hour = format(now.getHours());
    const minute = format(now.getMinutes());
    const second = format(now.getSeconds());

    return `${year}/${month}/${day} ${hour}:${minute}:${second}`;
  }
  setInterval(function () {
    var currentTime = getDateTime();
    document.getElementById("digital-clock").innerHTML = currentTime;
  }, 1000);

  var date = new Date();

  var current_day = date.getDay();

  var day_name = "";

  switch (current_day) {
    case 0:
      day_name = "Chủ nhật";
      break;
    case 1:
      day_name = "Thứ hai";
      break;
    case 2:
      day_name = "Thứ ba";
      break;
    case 3:
      day_name = "Thứ tư";
      break;
    case 4:
      day_name = "Thứ năm";
      break;
    case 5:
      day_name = "Thứ sáu";
      break;
    case 6:
      day_name = "Thứ bảy";
  }
  if (!isCssLoaded) {
    return <></>;
  }

  return (
    <>
      <div class="navleft" id="navleft">
        <div class="divroot">
         <img src={"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4hUp-MAkSvxl5dRdJldNsEN7K-BljNVZaEQ&s"}
          style={{borderRadius:"50%", height:"90%"}}
         />
        </div>
        <div class="listmenumain">
          <a href="chat">Tin nhắn</a>
          <a href="vaccine">Quản lý vaccine</a>
          <a href="vaccine-inventory">Kho vaccine</a>
          <a href="customer-schedule">Danh sách đăng ký</a>
          <a href="#" onClick={() => logout()}>
            Đăng xuất
          </a>
        </div>
      </div>
      <div class="contentadminweb">
        <div class="headerwebadmin" id="headerwebadmin">
          <div class="lichheader">
            <img class="iconlich" src={lich} />
            <p class="text-gray fst-italic mb-0">
              <p id="digital-clock"></p>
            </p>
          </div>
          <div class="userheader-admin">
            <a
              class="nav-link dropdown-toggle menucha"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <span class="tendangnhap">hieu</span>
              <img src={avatar} className="userlogo-admin" />
            </a>
            <ul
              class="dropdown-menu listitemtk"
              aria-labelledby="navbarDropdown"
            >
              <li>
                <a class="dropdown-item" onClick={() => logout()} href="#">
                  <i class="fa fa-sign-out"></i> Đăng xuất
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="contentmain">{children}</div>
      </div>
    </>
  );
}

async function checkAdmin() {
  var token = localStorage.getItem("token");
  var url = "http://localhost:8080/api/admin/check-role-admin";
  const response = await fetch(url, {
    headers: new Headers({
      Authorization: "Bearer " + token,
    }),
  });
  if (response.status > 300) {
    window.location.replace("../login");
  }
}

function logout() {
  localStorage.removeItem("token");
  localStorage.removeItem("user");
  window.location.replace("../login");
}

export default Header;
