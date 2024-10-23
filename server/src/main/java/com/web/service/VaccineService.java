package com.web.service;

import com.web.dto.VaccineTypeResponse;
import com.web.entity.AgeGroup;
import com.web.entity.Manufacturer;
import com.web.entity.Vaccine;
import com.web.entity.VaccineInventory;
import com.web.entity.VaccineType;
import com.web.exception.MessageException;
import com.web.models.CreateVaccineRequest;
import com.web.models.CreateVaccineResponse;
import com.web.models.DeleteVaccineRequest;
import com.web.models.DetailVaccineRequest;
import com.web.models.DetailVaccineResponse;
import com.web.models.ListVaccineRequest;
import com.web.models.ListVaccineResponse;
import com.web.models.PlusVaccineRequest;
import com.web.models.PlusVaccineResponse;
import com.web.models.UpdateVaccineRequest;
import com.web.models.UpdateVaccineResponse;
import com.web.repository.AgeGroupRepository;
import com.web.repository.ManufacturerRepository;
import com.web.repository.VaccineInventoryRepository;
import com.web.repository.VaccineRepository;
import com.web.repository.VaccineTypeRepository;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.criteria.Predicate;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class VaccineService {



    private final ModelMapper modelMapper;
    private final VaccineRepository vaccineRepository;
    private final ManufacturerRepository manufacturerRepository;
    private final AgeGroupRepository ageGroupRepository;
    private final VaccineTypeRepository vaccineTypeRepository;
    private final VaccineInventoryRepository vaccineInventoryRepository;


    public List<Vaccine> findAll() {
        return vaccineRepository.findAll();
    }

    public List<Vaccine> findByType(Long typeId) {
        return vaccineRepository.findByType(typeId);
    }

    public List<VaccineTypeResponse> allVaccinType() {
        List<VaccineTypeResponse> list = new ArrayList<>();
        List<VaccineType> vaccineTypes = vaccineTypeRepository.findAll();
        for (VaccineType v : vaccineTypes) {
            VaccineTypeResponse n = new VaccineTypeResponse();
            List<Vaccine> vc = vaccineRepository.findByType(v.getId());
            n.setVaccines(vc);
            n.setVaccineType(v);
            list.add(n);
        }
        return list;
    }

    public List<Vaccine> searchVaccines(String keyword) {
        return vaccineRepository.searchVaccines(keyword);
    }
    public Page<ListVaccineResponse> listVaccine(ListVaccineRequest requestBody) {
        if (ObjectUtils.isEmpty(requestBody)) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Đã có lỗi");
        }
        Pageable pageable = PageRequest.of(requestBody.getPage() - 1, requestBody.getLimit());

        Page<Vaccine> vaccinePage = vaccineRepository.findAll(specificationVaccineList(requestBody), pageable);
        List<ListVaccineResponse> vaccines = vaccinePage.getContent().stream().map(e
                -> ListVaccineResponse.builder()
                .id(e.getId())
                .nameVaccine(e.getName())
                .price(e.getPrice())
                .description(e.getDescription())
                .status(e.getStatus())
                .image(e.getImage())
                .inventory(e.getInventory())
                .createdDate(e.getCreatedDate())
                .vaccineType(e.getVaccineType())
                .manufacturer(e.getManufacturer())
                .ageGroup(e.getAgeGroup())
                .build()
        ).toList();
        return new PageImpl<>(vaccines, pageable, vaccinePage.getTotalElements());
    }

    public CreateVaccineResponse createVaccine(CreateVaccineRequest requestBody) {
        if (ObjectUtils.isEmpty(requestBody)) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Đã có lỗi");
        }
        if (StringUtils.isEmpty(requestBody.getName())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhập tên vaccine");
        }
        if (ObjectUtils.isEmpty(requestBody.getPrice())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhập giá vaccine");
        }
        if (ObjectUtils.isEmpty(requestBody.getVaccineTypeId())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chọn loại vaccine");
        }
        if (ObjectUtils.isEmpty(requestBody.getManufacturerId())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chọn nhà sản xuất");
        }
        if (ObjectUtils.isEmpty(requestBody.getAgeGroupId())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chọn nhóm tuổi");
        }
        Optional<VaccineType> optionalVaccineType = vaccineTypeRepository.findById(requestBody.getVaccineTypeId());
        if (optionalVaccineType.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Loại vaccine không tồn tại");
        }
        Optional<Manufacturer> optionalManufacturer = manufacturerRepository.findById(requestBody.getManufacturerId());
        if (optionalManufacturer.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhà sản xuất không tồn tại");
        }
        Optional<AgeGroup> optionalAgeGroup = ageGroupRepository.findById(requestBody.getAgeGroupId());
        if (optionalAgeGroup.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhóm tuổi không tồn tại");
        }
        Vaccine vaccine = new Vaccine();
        vaccine.setName(requestBody.getName());
        vaccine.setPrice(requestBody.getPrice());
        vaccine.setImage(requestBody.getImage());
        vaccine.setDescription(requestBody.getDescription());
        vaccine.setStatus(requestBody.getStatus());
        vaccine.setVaccineType(optionalVaccineType.get());
        vaccine.setManufacturer(optionalManufacturer.get());
        vaccine.setAgeGroup(optionalAgeGroup.get());
        vaccine.setInventory(0);
        vaccine.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        vaccineRepository.save(vaccine);

        return modelMapper.map(vaccine, CreateVaccineResponse.class);
    }

    public UpdateVaccineResponse updateVaccine(UpdateVaccineRequest requestBody) {
        if (ObjectUtils.isEmpty(requestBody)) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Đã có lỗi");
        }
        if (StringUtils.isEmpty(requestBody.getName())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhập tên vaccine");
        }
        if (ObjectUtils.isEmpty(requestBody.getPrice())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhập giá vaccine");
        }
        if (ObjectUtils.isEmpty(requestBody.getVaccineTypeId())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chọn loại vaccine");
        }
        if (ObjectUtils.isEmpty(requestBody.getManufacturerId())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chọn nhà sản xuất");
        }
        if (ObjectUtils.isEmpty(requestBody.getAgeGroupId())) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chọn nhóm tuổi");
        }
        Optional<VaccineType> optionalVaccineType = vaccineTypeRepository.findById(requestBody.getVaccineTypeId());
        if (optionalVaccineType.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Loại vaccine không tồn tại");
        }
        Optional<AgeGroup> optionalAgeGroup = ageGroupRepository.findById(requestBody.getAgeGroupId());
        if (optionalAgeGroup.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhóm tuổi không tồn tại");
        }
        Optional<Manufacturer> optionalManufacturer = manufacturerRepository.findById(requestBody.getManufacturerId());
        if (optionalManufacturer.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhà sản xuất không tồn tại");
        }
        Optional<Vaccine> optionalVaccine = vaccineRepository.findById(requestBody.getId());
        if (optionalVaccine.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Vaccine không tồn tại");
        }
        Vaccine vaccine = optionalVaccine.get();
        vaccine.setName(requestBody.getName());
        vaccine.setPrice(requestBody.getPrice());
        vaccine.setImage(requestBody.getImage());
        vaccine.setDescription(requestBody.getDescription());
        vaccine.setStatus(requestBody.getStatus());
        vaccine.setVaccineType(optionalVaccineType.get());
        vaccine.setManufacturer(optionalManufacturer.get());
        vaccine.setAgeGroup(optionalAgeGroup.get());

        vaccineRepository.save(vaccine);

        return modelMapper.map(vaccine, UpdateVaccineResponse.class);
    }

    public boolean deleteVaccine(DeleteVaccineRequest requestBody) {
        if (ObjectUtils.isEmpty(requestBody)) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Đã có lỗi");
        }
        Optional<Vaccine> optionalVaccine = vaccineRepository.findById(requestBody.getId());
        if (optionalVaccine.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Vaccine không tồn tại");
        }
        Vaccine vaccine = optionalVaccine.get();

        if (ObjectUtils.equals(vaccine.getStatus(), "DELETE")) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Vaccine đã xóa rồi");
        }
        if (ObjectUtils.equals(vaccine.getStatus(), "ACTIVE")) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chỉ được xóa vaccine ngừng kinh doanh");
        }
        vaccine.setStatus("DELETE");
        try {
            vaccineRepository.save(vaccine);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public PlusVaccineResponse plusVaccine(PlusVaccineRequest requestBody) {
        if (ObjectUtils.isEmpty(requestBody)) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Đã có lỗi");
        }
        Optional<Vaccine> optionalVaccine = vaccineRepository.findByName(requestBody.getName());
        if (optionalVaccine.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Vaccine không tồn tại");
        }
        Optional<VaccineInventory> optionalVaccineInventory = vaccineInventoryRepository.findByVaccine(optionalVaccine.get());
        if (optionalVaccineInventory.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Vaccine trong kho không tồn tại");
        }
        if (optionalVaccineInventory.get().getQuantity() == 0) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Số lượng vaccine trong kho đã hết");
        }
        if (requestBody.getQuantity() > optionalVaccineInventory.get().getQuantity()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Số lượng vaccine trong kho không đủ");
        }
        Vaccine vaccine = optionalVaccine.get();

        if (ObjectUtils.equals(vaccine.getStatus(), "INACTIVE")) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Chỉ được thêm số lượng cho vaccine còn kinh doanh");
        }

        vaccine.setInventory(vaccine.getInventory() + requestBody.getQuantity());
        vaccineRepository.save(vaccine);

        VaccineInventory vaccineInventory = optionalVaccineInventory.get();
        vaccineInventory.setQuantity(vaccineInventory.getQuantity() - requestBody.getQuantity());
        vaccineInventoryRepository.save(vaccineInventory);
        return PlusVaccineResponse.builder()
                .id(vaccine.getId())
                .vaccineType(vaccine.getVaccineType())
                .image(vaccine.getImage())
                .inventory(vaccine.getInventory())
                .name(vaccine.getName())
                .price(vaccine.getPrice())
                .status(vaccine.getStatus())
                .manufacturer(vaccine.getManufacturer())
                .ageGroup(vaccine.getAgeGroup())
                .description(vaccine.getDescription())
                .vaccineType(vaccine.getVaccineType())
                .createdDate(vaccine.getCreatedDate())
                .build();
    }

    public DetailVaccineResponse detailVaccine(DetailVaccineRequest requestBody) {
        if (ObjectUtils.isEmpty(requestBody)) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Đã có lỗi");
        }
        Optional<Vaccine> optionalVaccine = vaccineRepository.findById(requestBody.getId());
        if (optionalVaccine.isEmpty()) {
            throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Vaccine không tồn tại");
        }
        return modelMapper.map(optionalVaccine.get(), DetailVaccineResponse.class);
    }

    public void importExcelData(MultipartFile file) throws IOException {
        try (InputStream inputStream = file.getInputStream();
             Workbook workbook = new XSSFWorkbook(inputStream)) {

            Sheet sheet = workbook.getSheetAt(0); // Lấy sheet đầu tiên
            List<Vaccine> vaccines = new ArrayList<>();

            for (Row row : sheet) {
                // Bỏ qua hàng tiêu đề (nếu có)
                if (row.getRowNum() == 0) continue;

                // Lấy dữ liệu từ các ô
                String name = getCellValue(row.getCell(1));
                Integer price = (int) getCellValueAsDouble(row.getCell(2));
                String description = getCellValue(row.getCell(3));
                String status = getCellValue(row.getCell(4));
                Integer invetory = (int) getCellValueAsDouble(row.getCell(5));
                String vaccineTypeName = getCellValue(row.getCell(6));
                String manufacturerName = getCellValue(row.getCell(7));
                String ageRange = getCellValue(row.getCell(8));
                if (StringUtils.isBlank(name)) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Tên không được bỏ trống tại hàng " + (row.getRowNum() + 1));
                }
                if (ObjectUtils.isEmpty(price)) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Giá không được bỏ trống tại hàng " + (row.getRowNum() + 1));
                }
                if (ObjectUtils.isEmpty(invetory)) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Số lượng không được bỏ trống tại hàng " + (row.getRowNum() + 1));
                }
                if (StringUtils.isBlank(vaccineTypeName)) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Loại vaccine không được bỏ trống tại hàng " + (row.getRowNum() + 1));
                }
                if (StringUtils.isBlank(manufacturerName)) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhà sản xuất không được bỏ trống tại hàng " + (row.getRowNum() + 1));
                }
                if (StringUtils.isBlank(ageRange)) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhóm người dùng không được bỏ trống tại hàng " + (row.getRowNum() + 1));
                }
                Optional<VaccineType> optionalVaccineType = vaccineTypeRepository.findByTypeName(vaccineTypeName);
                if (optionalVaccineType.isEmpty()) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Loại vaccine không tồn tại hàng " + (row.getRowNum() + 1));
                }
                Optional<Manufacturer> optionalManufacturer = manufacturerRepository.findByName(manufacturerName);
                if (optionalManufacturer.isEmpty()) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhà sản xuất không tồn tại hàng " + (row.getRowNum() + 1));
                }
                Optional<AgeGroup> optionalAgeGroup = ageGroupRepository.findByAgeRange(ageRange);
                if (optionalAgeGroup.isEmpty()) {
                    throw new MessageException(HttpStatus.BAD_REQUEST.value(), "Nhóm người dùng không tồn tại hàng " + (row.getRowNum() + 1));
                }

                Vaccine vaccine = new Vaccine();
                vaccine.setName(name);
                vaccine.setPrice(price);
                vaccine.setDescription(description);
                vaccine.setStatus(status);
                vaccine.setInventory(invetory);
                vaccine.setVaccineType(optionalVaccineType.get());
                vaccine.setManufacturer(optionalManufacturer.get());
                vaccine.setAgeGroup(optionalAgeGroup.get());
                vaccine.setCreatedDate(new Timestamp(System.currentTimeMillis()));
                vaccines.add(vaccine);
            }

            vaccineRepository.saveAll(vaccines);
        }
    }

    private String getCellValue(Cell cell) {
        if (cell == null) {
            return null;
        }
        return switch (cell.getCellType()) {
            case STRING -> cell.getStringCellValue();
            case NUMERIC -> String.valueOf(cell.getNumericCellValue());
            default -> null;
        };
    }

    private Integer getCellValueAsDouble(Cell cell) {
        if (cell == null) {
            return null;
        }
        switch (cell.getCellType()) {
            case NUMERIC -> {
                return (int) cell.getNumericCellValue();
            }
            case STRING -> {
                try {
                    return Integer.valueOf(cell.getStringCellValue());
                } catch (NumberFormatException e) {
                    return null;
                }
            }
            default -> {
                return null;
            }
        }
    }

    public Specification<Vaccine> specificationVaccineList(ListVaccineRequest requestBody) {
        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotEmpty(requestBody.getName())) {
                String searchValue = "%" + requestBody.getName() + "%";
                predicates.add(criteriaBuilder.like(root.get("name"), searchValue));
            }
            predicates.add(criteriaBuilder.and(criteriaBuilder.notEqual(root.get("status"), "DELETE")));
            if (ObjectUtils.isNotEmpty(requestBody.getPrice())) {
                predicates.add(criteriaBuilder.and(criteriaBuilder.equal(root.get("price"), requestBody.getPrice())));
            }
            if (ObjectUtils.isNotEmpty(requestBody.getStatus())) {
                predicates.add(criteriaBuilder.and(criteriaBuilder.equal(root.get("status"), requestBody.getStatus())));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }
}
