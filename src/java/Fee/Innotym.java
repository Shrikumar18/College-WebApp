/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import Actor.Student;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author irshed
 */
public class Innotym {

    private final String merKey = "SJCOI";
    private String trackId;
    private final String paymentChannel = "WEB";
    private String transactionAmount;
    private String productInfo = "Tution Fee";
    private String firstName;
    private String email;
    private String phone;
    private String redirectUrl;
    private String lastName = "";
    private String address1 = "St. Joseph's Institute of Technology";
    private String address2 = "OMR,Semancherry";
    private String city = "Chennai";
    private String state = "Tamilnadu";
    private String country = "India";
    private String zipcode = "600119";
    private String udf1 = "PURCHASE TRANSACTION";
    private String udf2;
    private String udf3;
    private String udf4 = "ST JOSEPH INSTITUTE OMR CHENNAI";
    private String udf5 = "MWPAY";
    private String mode = "2";
    private String paymentOption = "";
    private String hash;
    private String paymentId="";

    public String getTrackId() {
        return trackId;
    }

    public void setTrackId(String trackid) {
        this.trackId = trackid;
    }

    public String getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(String transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public String getUdf1() {
        return udf1;
    }

    public void setUdf1(String udf1) {
        this.udf1 = udf1;
    }

    public String getUdf2() {
        return udf2;
    }

    public void setUdf2(String udf2) {
        this.udf2 = udf2;
    }

    public String getUdf3() {
        return udf3;
    }

    public void setUdf3(String udf3) {
        this.udf3 = udf3;
    }

    public String getUdf4() {
        return udf4;
    }

    public void setUdf4(String udf4) {
        this.udf4 = udf4;
    }

    public String getUdf5() {
        return udf5;
    }

    public void setUdf5(String udf5) {
        this.udf5 = udf5;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPaymentOption() {
        return paymentOption;
    }

    public void setPaymentOption(String paymentOption) {
        this.paymentOption = paymentOption;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Innotym(String firstName, String Amount,String trackid) throws NoSuchAlgorithmException {
        this.transactionAmount = Amount;
        this.firstName = firstName;
        this.trackId = trackid;
        Student s = Student.getById(firstName);
        this.phone = s.getFatherDetails().getMobile();
        this.udf2 = s.getMailid();
        this.udf3 = s.getMobile();
        this.email = s.getMailid();
        this.phone = s.getMobile();
        String hashString = merKey + "|" + trackId + "|" + transactionAmount + "|" + phone + "|" + mode;
         MessageDigest m = MessageDigest.getInstance("SHA-512");
        byte[] data = hashString.getBytes();
        m.update(data, 0, data.length);
        BigInteger i = new BigInteger(1, m.digest());
        String hash = String.format("%1$032X", i);
        if (hash.length() == 127) {
            hash = "0" + hash;
        }
        this.hash = hash;
    }

    public String getActionUrl() {
        String url = "https://pay.innotym.com/api/public/prePaymentRequest?merchantKey=" + merKey + "&trackId=" + trackId + "&paymentChannel=" + paymentChannel + ""
                + "&transactionAmount=" + transactionAmount + "&firstName=" + firstName + "&phone=" + phone + "&redirectUrl=" + redirectUrl + ""
                + "&productInfo=" + productInfo + "&lastName=" + lastName + "&address1=" + address1 + "&address2=" + address2 + "&city=" + city + "&state=" + state + "&country=" + country + "&zipcode=" + zipcode
                + "&udf1=" + udf1 + "&udf2=" + udf2 + "&udf3=" + udf3 + "&udf4=" + udf4 + "&udf5=" + udf5 + "&paymentOption=" + paymentOption + "&mode=" + mode + "&email=" + email + "&paymentId="+paymentId+"&hash=" + hash + "";
        return url;
    }

}
