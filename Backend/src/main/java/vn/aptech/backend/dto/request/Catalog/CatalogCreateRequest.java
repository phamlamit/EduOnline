package vn.aptech.backend.dto.request.Catalog;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CatalogCreateRequest {
    private String name;
    private String description;
}
