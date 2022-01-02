package vn.aptech.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vn.aptech.backend.annotation.Admin;
import vn.aptech.backend.dto.CatalogDto;
import vn.aptech.backend.dto.PageDto;
import vn.aptech.backend.dto.request.Catalog.CatalogUpdateRequest;
import vn.aptech.backend.dto.request.Catalog.CatalogCreateRequest;
import vn.aptech.backend.service.CatalogService;

@RestController
@RequestMapping("/api")
public class CatalogController {
    @Autowired
    private CatalogService service;

    @GetMapping("/catalogs")
    public ResponseEntity<?> getAllCatalogs() {
        return service.fillAll();
    }

    @Admin
    @PostMapping("/catalog/create")
    public ResponseEntity<?> create(@Validated @RequestBody CatalogCreateRequest request) {
        return service.create(request);
    }

    @Admin
    @PostMapping("/admin/catalog/update")
    public ResponseEntity<?> update(@RequestBody CatalogUpdateRequest request) {
        return service.update(request);
    }

    @Admin
    @GetMapping("/catalog/search")
    public ResponseEntity<?> findByCatalogName(String name) {
        return service.findByCatalogName(name);
    }

    @Admin
    @GetMapping("catalog/{id}")
    public ResponseEntity<CatalogDto> getCatalogById(@PathVariable("id") Long id) {
        return service.findById(id);
    }
}
