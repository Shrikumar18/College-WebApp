/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import General.AcademicYear;
import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vignesh
 */
public class University {
    
    private String rollno;
    private String sem;
    private String subcode;
    private String result;
    private String semester;
    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }
    public String getSem()
    {
        return sem;
    }
    public void setSem(String sem)
    {
        this.sem = sem;
    }
    
    public String getSubcode() {
        return subcode;
    }

    public void setSubcode(String subcode) {
        this.subcode = subcode;
    }
    public String getResult()
    {
        return result;
    }
    public void setResult(String result)
    {
        this.result = result;
    }
    public String getSemester()
    {
        return semester;
    }
    public void setSemester(String semester)
    {
        this.semester = semester;
    }
    public String insertOrUpdateMarks(String dept, University m) throws SQLException {
        Connection con = new dbcon().getConnection(dept);
        PreparedStatement st1 = null, st = null, st2 = null,st3 = null;
        try {
            if (!University.isMarkAvailable(dept, m)) {
                String sql = "insert into univ_result values(?,?,?,?,?)";
                st = con.prepareStatement(sql);
                st.setString(1, m.getRollno());
                st.setString(2, m.getSem());
                st.setString(3, m.getSubcode());
                st.setString(4, m.getResult());
                st.setString(5, m.getSemester());
                st.executeUpdate();
                System.out.println("Updated-"+m.getRollno()+"-"+m.getSem()+"-"+m.getSubcode()+"-"+m.getResult()+"-"+m.getSemester());
                return "Updated";
            } else {
                String newmark = m.getResult();
                String oldmark = University.getUserMark(dept, m).getResult();
                String sql2 = "update univ_result set result=? ,recentSemOfExam=? where rollno=? and subcode=? and sem=? ";
                st2 = con.prepareStatement(sql2);
                st2.setString(1, oldmark+","+newmark);
                st2.setString(3, m.getRollno());
                st2.setString(4, m.getSubcode());
                st2.setString(5, m.getSem());
                st2.setString(2, m.getSemester());
                int i = st2.executeUpdate();
                System.out.println("Updated-"+m.getRollno()+"-"+m.getSubcode()+"-"+m.getSem()+"-"+oldmark+","+newmark+"-"+m.getSemester());
                if (i == 1) {
                    return "Updated";
                } else {
                    return "Not Updated";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                ;//con.close();
            }
            if (st != null) {
                st.close();
            }
            if (st1 != null) {
                st1.close();
            }
            if (st2 != null) {
                st2.close();
            }
        }
        return "Not Updated";
    }

    public  void fetchMark(){
        try {
            this.setResult(getUserMark("", this ).getResult());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public static University getUserMark(String dept, University m) throws SQLException {
        Connection con = new dbcon().getConnection(Find.sdept(m.getRollno()));
        PreparedStatement st1 = null;
        try {
            String sql1 = "select * from univ_result where rollno=? and subcode=? and sem=? ";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            st1.setString(3, m.getSem());
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                m.setResult(rs.getString("result"));
            }else{
                m.setResult(null);
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st1 != null) {
                st1.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return m;
    }

    public static boolean isMarkAvailable(String dept, University m) throws SQLException {
        Connection con = new dbcon().getConnection(dept);
        PreparedStatement st1 = null;
        try {
            String sql1 = "select * from univ_result where rollno=? and subcode=? and sem=? ";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            st1.setString(3, m.getSem());
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st1 != null) {
                st1.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return false;
    }

    public static List<University> getExamMark(String dept, University m) throws SQLException {
        List<University> list = new ArrayList<University>();
        Connection con = new dbcon().getConnection(Find.sdept(m.getRollno()));
        PreparedStatement st1 = null;
        try {
            String sql1 = "select * from marks where rollno=? and subcode=? ";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            ResultSet rs = st1.executeQuery();
            while(rs.next()) {
                University mi = new University();
                mi.setRollno(m.getRollno());
                mi.setSubcode(rs.getString("subcode"));
                mi.setSem(rs.getString("sem"));
                mi.setResult(rs.getString("result"));
                list.add(mi);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st1 != null) {
                st1.close();
            }
            if (con != null) {
                ;//con.close();
            }
        }
        return list;
    }
    public static String deleteMark(University m){
        try {
            Connection con = new dbcon().getConnection(Find.sdept(m.getRollno()));
            PreparedStatement st1 = null;
            String sql1 = "delete from univ_result where  rollno=? and  subcode=? and  sem=?";
            st1 = con.prepareStatement(sql1);
            st1.setString(1, m.getRollno());
            st1.setString(2, m.getSubcode());
            st1.setString(3, m.getSem());
            int i  = st1.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Mark.class.getName()).log(Level.SEVERE, null, ex);
        }
       return "Updated";
    }
    public static String getCurrentSem(String batch,String ayear)
    {
           
         //String semest = Integer.toString(s);
        String semset = AcademicYear.getCurrentYear().getCurrent();
        int seme = Find.getSem(batch, ayear, semset);
        String semester = Integer.toString(seme); 
    return semester;
    }
}
