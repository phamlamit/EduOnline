package vn.aptech.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Entity
@Table(name = "Payment")
public class Payment extends BaseEntity {
    private Double amount;
    @Column(name = "date_payment")
    @Temporal(TemporalType.DATE)
    private Date datePayment;
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "name_holder")
    private String nameHolder;
    @Column(name = "expiration_date")
    private String expirationDate;
    private String cvv;
    private boolean status;
    private String zipcode;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private AppUser user;

    @OneToOne(mappedBy = "payment", cascade = CascadeType.ALL)
    private Orders order;
}
