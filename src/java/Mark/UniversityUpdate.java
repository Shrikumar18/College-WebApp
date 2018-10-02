/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import Actor.Student;
import General.Batch;
import Subjects.Subjects;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vignesh
 */
public class UniversityUpdate extends HttpServlet{
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     //   processRequest(request, response);
     response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
       // String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
        String semester = University.getCurrentSem(batch, ayear);
        String regulation = Batch.getRegulation(batch);
            String mark;
            int count = 0;
            Subjects s = new Subjects();
            s.setAyear(ayear);
            s.setRegulation(regulation);
            s.setSem(sem);
            List<String> Subcodelist;
                                Subcodelist= Subjects.getLabSubCode(dept, s);
                                int l;
                                for(l=0;l<Subjects.getTherorySubCode(dept, s).size();l++)
                                    Subcodelist.add(Subjects.getTherorySubCode(dept, s).get(l));
                                
                               // Subcodelist= Subjects.getTherorySubCode(dept, s);
        for (String subcode : Subcodelist) {
                List<Student> list = Student.getAll(dept, batch, sec);
                for (Student stu : list) {
                    String a1 = stu.getId() + "_" + count;
                    mark = request.getParameter(a1);
                    if (mark == null) {
                        continue;
                    }else if(mark.equals("null")){
                    continue;
                    }else if(mark.equals("")){
                    continue;
                    }else if(mark.equalsIgnoreCase("NA")){
                    University m = new University();
                    m.setRollno(stu.getId());
                    m.setSubcode(subcode);
                    m.setSem(sem);
                    m.setSemester("0"+semester);
                    String x = University.deleteMark(m);
                    continue;
                    }
                    
                    University m = new University();
                    m.setRollno(stu.getId());
                    m.setSubcode(subcode);
                    m.setSem(sem);
                    m.setResult(mark);
                    m.setSemester("0"+semester);
                    University m1 = new University();
                    m1.insertOrUpdateMarks(dept, m);
                }
                count++;
            }
            response.getWriter().println("<center><h1>UPDATED SUCCESSFULLY</h1></center>");
        } catch (SQLException ex) {
            response.getWriter().print(ex);
        } catch (IOException ex) {
            response.getWriter().print(ex);
        }
    }
}
