import { useState, useEffect } from 'react';
import ReactPaginate from 'react-paginate';
import { toast } from 'react-toastify';
import Select from 'react-select';
import { getMethod, postMethodPayload } from '../../services/request';
import logomini from '../../assest/images/logomini.svg';

function DangKyTiem() {
  const [vacxinType, setVacxinType] = useState([]);
  const [vacxin, setVacxin] = useState([]);
  const [vacxinSchedule, setVacxinSchedule] = useState([]);
  const [vacxinScheduleChoose, setVacxinScheduleChoose] = useState(null);
  const [activeIndex, setActiveIndex] = useState(null);
  const [customer, setCustomer] = useState(null);
  const [isScheduleVisible, setIsScheduleVisible] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [typeResponse, customerResponse] = await Promise.all([
          getMethod('/api/vaccine-type/find-all'),
          getMethod('/api/customer-profile/customer/find-by-user')
        ]);
        setVacxinType(await typeResponse.json());
        setCustomer(await customerResponse.json());
      } catch (error) {
        console.error('Lỗi khi tải dữ liệu', error);
      }
    };
    fetchData();
  }, []);

  const handleChonLoai = async (option) => {
    const response = await getMethod(`/api/vaccine/all/find-by-type?typeId=${option.value}`);
    setVacxin(await response.json());
    setVacxinChoose(null);
  };

  const handleChonVacxin = async (option) => {
    const response = await getMethod(`/api/vaccine-schedule/all/find-by-vacxin?idVacxin=${option.value}`);
    const result = await response.json();
    setVacxinSchedule(result);
    setIsScheduleVisible(result.length > 0);
    setVacxinChoose(null);
  };

  const setVacxinChoose = (item, index) => {
    setActiveIndex(index);
    setVacxinScheduleChoose(item);
  };

  async function taoLichTiemChung(event) {
    event.preventDefault();
    if (!vacxinScheduleChoose) {
      toast.error("Bạn chưa chọn lịch tiêm");
      return;
    }
    // logic xử lý dữ liệu biểu mẫu
  }

  function splitTimeStamp(date) {
    const [datePart, timePart] = date.split("T");
    return `${timePart} ${datePart}`;
  }

  return (
    <div className='container-fluid'>
      {/* Cấu trúc JSX còn lại của bạn */}
    </div>
  );
}

export default DangKyTiem;
