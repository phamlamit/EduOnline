package vn.aptech.backend.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import vn.aptech.backend.dto.SubCatalogDto;
import vn.aptech.backend.dto.request.SubCatalog.SubCatalogUpdateRequest;
import vn.aptech.backend.dto.request.SubCatalog.SubCatalogCreateRequest;

public interface SubCatalogService {
    ResponseEntity<?> create(SubCatalogCreateRequest request);

    ResponseEntity<?> fillAll();

    ResponseEntity<?> findBySubCatalogName(String name);

    ResponseEntity<?> update(SubCatalogUpdateRequest request);

    ResponseEntity<SubCatalogDto> findById(Long id);
}
