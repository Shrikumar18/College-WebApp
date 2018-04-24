/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author irshed
 */
public class InnotymResponse {
    private String rollno;
    private String mupno;
    private String txn_amt;
    private String status;
    private String hash;
    private String bankRefno;
    private String responseMsg;
    private String time;
    private String merId;
    private String trackId;
    private String paymentOption;

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getMupno() {
        return mupno;
    }

    public void setMupno(String mupno) {
        this.mupno = mupno;
    }

    public String getTxn_amt() {
        return txn_amt;
    }

    public void setTxn_amt(String txn_amt) {
        this.txn_amt = txn_amt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getBankRefno() {
        return bankRefno;
    }

    public void setBankRefno(String bankRefno) {
        this.bankRefno = bankRefno;
    }

    public String getResponseMsg() {
        return responseMsg;
    }

    public void setResponseMsg(String responseMsg) {
        this.responseMsg = responseMsg;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getMerId() {
        return merId;
    }

    public void setMerId(String merId) {
        this.merId = merId;
    }

    public String getTrackId() {
        return trackId;
    }

    public void setTrackId(String trackId) {
        this.trackId = trackId;
    }

    public String getPaymentOption() {
        return paymentOption;
    }

    public void setPaymentOption(String paymentOption) {
        this.paymentOption = paymentOption;
    }
    
     public boolean insert() {
        Connection conn = null;
        Statement stmt = null;
        int update = 0;
        try {
            conn = new dbcon().getConnection("sjitportal");
            stmt = conn.createStatement();

            String sql;
            sql = "insert into innotym values('" + rollno + "','" +mupno+ "','" + txn_amt
                    + "','" + status + "','" + hash + "','" + bankRefno + "','" + time
                    + "','" + responseMsg + "','" + merId + "','" + trackId + "','" + paymentOption +"')";
            update += stmt.executeUpdate(sql);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null)
                   ;//conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
        if (update == 1) {
            return true;
        } else {
            return false;
        }
    }

    
    
}
