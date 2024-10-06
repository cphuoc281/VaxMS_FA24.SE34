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
        <div className='container-web'>
          <div className='row'>
            <div className='col-sm-9'>
              <p className='link-head-section'>
                <a href="https://vnvc.vn/">Trang chủ</a>
                <span class="separator"> » </span>
                <span class="last">Đăng ký thông tin tiêm chủng</span>
              </p>
              <div className='section-content-web'>
                <div className='flex-section'>
                  <div className='divsc-dkytiem'><img src={logomini} className='img-section-dky-tiem'/></div>
                  <h2 className='title-dki-tiem-chung'>ĐĂNG KÝ TIÊM CHỦNG</h2>
                </div>
              </div>
              <p className='ghi-chu-tiem-chung'>Đăng ký thông tin tiêm chủng để tiết kiệm thời gian khi đến làm thủ tục tại quầy Lễ tân cho Quý Khách hàng, việc đăng ký thông tin tiêm chủng chưa hỗ trợ đặt lịch hẹn chính xác theo giờ.</p>
              <p className='title-form-dki-tiem'>THÔNG TIN NGƯỜI TIÊM</p>
              <form className='form-dky-tiem' onSubmit={taoLichTiemChung} method='post'>
                <div className='row'>
                  <div className='col-sm-6'>
                    <label className='lb-form-dky-tiem'><span>*</span> Họ tên người tiêm</label>
                    <input name='hotendki' defaultValue={customer==null?'':customer.fullName} className='form-control' />
                  </div>
                  <div className='col-sm-6'>
                    <label className='lb-form-dky-tiem'><span>*</span> Ngày sinh người tiêm</label>
                    <input name='ngaysinhnt' defaultValue={customer==null?'':customer.birthdate} className='form-control' type='date' />
                  </div>
                  <div className='col-sm-6'>
                    <label className='lb-form-dky-tiem'><span>*</span> Địa chỉ</label>
                    <input name='diachint' defaultValue={customer==null?'':customer.street+', '+customer.ward+', '+customer.district+', '+customer.city} className='form-control' />
                  </div>
                  <div className='col-sm-6'>
                    <label className='lb-form-dky-tiem'><span>*</span> Số điện thoại</label>
                    <input name='sdtnt' defaultValue={customer==null?'':customer.contactPhone} className='form-control' />
                  </div>
                  <div className='col-sm-12'><p className='title-form-dki-tiem dichvu-dky-tiem'>THÔNG TIN DỊCH VỤ</p></div>
                  <div className='col-sm-6'>
                    <label className='lb-form-dky-tiem'><span>*</span> Loại vắc xin muốn đăng ký</label>
                    <Select
                        options={vacxinType.map((item) => ({
                          label: item.typeName,
                          value: item.id,
                        }))}
                        onChange={handleChonLoai}
                        placeholder="Chọn loại vacxin"
                        name='centerselect'
                        isSearchable={true}
                    />
                  </div>
                  <div className='col-sm-6'>
                    <label className='lb-form-dky-tiem'><span>*</span> Tên vacxin</label>
                    <Select
                        options={vacxin.map((item) => ({
                          label: item.name,
                          value: item.id,
                        }))}
                        onChange={handleChonVacxin}
                        placeholder="Tên vacxin"
                        name='centerselect'
                        isSearchable={true}
                    />
                  </div>
                  <div className='col-sm-12'>
                    <div className='chonthoigiantiem'>
                      <div className='row'>
                        {vacxinSchedule.map((item, index)=>{
                          return <div className='col-sm-3'>
                            <div key={item.id}
                                 className={`singletgtiem ${activeIndex === index ? 'activetiem' : ''}`}
                                 onClick={() => setVacxinChoose(item, index)}>
                              Từ: {splitTimeStamp(item.startDate)} <br/>
                              Đến: {splitTimeStamp(item.endDate)} <br/>
                              Địa điểm:{item.center.centerName}
                            </div>
                          </div>
                        })}
                        <div className='hiddendiv' id='thongbaokhongtimthay'>
                          <p>Xin lỗi! Không tìm thấy lịch tiêm nào với vacxin này</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id='btndangkytiem'>
                    <div className='row'>
                      <div className='col-sm-6'>
                        <label className='lb-form-dky-tiem'><span>*</span> Hình thức thanh toán</label>
                        <select name='loaithanhtoan' className='form-control'>
                          <option value={1}>Thanh toán ngay</option>
                          <option value={0}>Thanh toán sau khi tiêm</option>
                        </select>
                      </div>
                      <div className='col-sm-6'>
                        <label className='lb-form-dky-tiem'><span>*</span> Chọn giờ tiêm</label>
                        <input name='registime' className='form-control' type='datetime-local'/>
                      </div>
                      <div className='col-sm-6'>
                        <br/><button className='btn btn-primary form-control'>Đăng Ký Tiêm Chủng</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
  );

}

export default DangKyTiem;
