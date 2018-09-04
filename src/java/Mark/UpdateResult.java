/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import com.action.Find;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vignesh
 */
public class UpdateResult extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String dept = request.getParameter("dept");
        String subcode = request.getParameter("subject");
        String mark = request.getParameter("mark");
        String sem = request.getParameter("sem");
        String semester = request.getParameter("semester");
        String rollno = request.getParameter("rollno");
        University m = new University();
        m.setRollno(rollno);
        m.setSubcode(subcode);
        m.setSem(sem);
        m.setResult(mark);
        m.setSemester("0"+semester);
        University m1 = new University();
        try {
            String result = m1.insertOrUpdateMarks(dept, m);

            if (result.equals("Updated")) {
                out.println("Updated");
            } else {
                out.println("NotUpdated");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
