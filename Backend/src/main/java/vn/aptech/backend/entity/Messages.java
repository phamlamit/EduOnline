package vn.aptech.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Entity
@Table(name = "Messages")
public class Messages extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id_from")
    private AppUser userFrom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id_to")
    private AppUser userTo;

    private String message;

    private boolean replied;
}
