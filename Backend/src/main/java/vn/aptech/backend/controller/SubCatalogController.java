package vn.aptech.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vn.aptech.backend.annotation.Admin;
import vn.aptech.backend.dto.SubCatalogDto;
import vn.aptech.backend.dto.request.SubCatalog.SubCatalogCreateRequest;
import vn.aptech.backend.dto.request.SubCatalog.SubCatalogUpdateRequest;
import vn.aptech.backend.service.SubCatalogService;

@RestController
@RequestMapping("/api")
public class SubCatalogController {

    @Autowired
    private SubCatalogService service;

    @GetMapping("/subCatalogs")
    public ResponseEntity<?> getAllSubCatalogs() {
        return service.fillAll();
    }

    @Admin
    @PostMapping("/subCatalog/create")
    public ResponseEntity<?> create(@Validated @RequestBody SubCatalogCreateRequest request) {
        return service.create(request);
    }

    @Admin
    @PostMapping("/admin/subCatalog/update")
    public ResponseEntity<?> update(@RequestBody SubCatalogUpdateRequest request) {
        return service.update(request);
    }

    @Admin
    @GetMapping("/subCatalog/search")
    public ResponseEntity<?> findBySubCatalogName(String name) {
        return service.findBySubCatalogName(name);
    }

    @GetMapping("subCatalog/{id}")
    public ResponseEntity<SubCatalogDto> getSubCatalogById(@PathVariable("id") Long id) {
        return service.findById(id);
    }
}
