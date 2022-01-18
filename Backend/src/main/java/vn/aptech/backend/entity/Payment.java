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
    private float amount;
    private float fee;
    @Column(name = "total_amount")
    private float totalAmount;
    @Column(name = "date_payment")
    private Date datePayment;
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "name_holder")
    private String nameHolder;
    @Column(name = "expiration_date")
    private String expirationDate;
    @Column(name = "cvv")
    private String cvv;
    private boolean status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private AppUser user;
}
