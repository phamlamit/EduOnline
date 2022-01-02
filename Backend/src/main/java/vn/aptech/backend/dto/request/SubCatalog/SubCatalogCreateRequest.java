package vn.aptech.backend.dto.request.SubCatalog;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubCatalogCreateRequest {
    @NotNull
    private Long catalogId;
    private String name;
    private String description;
}
