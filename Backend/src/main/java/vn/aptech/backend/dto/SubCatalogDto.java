package vn.aptech.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubCatalogDto {
    private Long id;
    private CatalogDto catalog;
    private String name;
    private String description;
}
