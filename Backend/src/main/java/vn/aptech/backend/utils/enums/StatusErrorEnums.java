package vn.aptech.backend.utils.enums;

public enum StatusErrorEnums {
    //600-700 UserError
    USER_DETAILS_NOT_EXISTS(600, "User Details not exists"),
    USER_USERNAME_IS_ALREADY_TAKEN(601, "Username is already taken!"),
    USER_EMAIL_IS_ALREADY_USE(602, "Email is already use!"),
    USER_OLD_PASSWORD_IS_WRONG(603,"Old Password is wrong"),
    USER_CONFIRM_PASSWORD_DIFFERENT_NEW_PASSWORD(604,"Confirm password different new password"),
    USER_PASSWORD_DIFFERENT_NEW_PASSWORD(605,"Confirm password different password"),
    USER_ROLE_NOT_FOUND(606,"Role not found"),
    USER_IS_NOT_ENABLED(606,"USER IS NOT ENABLED"),
    USER_NOT_FOUND(607,"User not found"),


    //700-800 ProductError
    PRODUCT_700(700, "Product not exists"),

    //800-900 Payment Error
    PAYMENT_800(800, "Payment not exists"),

    //900-999 Other
    OTHER_900(900, "Some thing is wrong");

    private final int statusCode;
    private final String message;

    private StatusErrorEnums(int status, String message) {
        this.statusCode = status;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public int getStatusCode() {
        return statusCode;
    }

    @Override
    public String toString() {
        return statusCode + ": " + message;
    }
}
