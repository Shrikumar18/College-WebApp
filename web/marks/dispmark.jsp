<%-- 
    Document   : dispmark
    Created on : 31 Jul, 2018, 11:30:31 AM
    Author     : vignesh
--%>

<%@page import="Mark.University"%>
<%-- 
    Document   : getmarks
    Created on : 26 May, 2015, 2:39:34 PM
    Author     : aravind
--%>


<%@page import="Mark.Mark"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%@page import="Subjects.Subjects"%>
<%@page import="com.action.Find"%>
<%@page import="General.Batch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Mark</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        if (dept == null) {
            dept = session.getAttribute("dept").toString();
        }
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
        //String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
        String regulation = Batch.getRegulation(batch);
        session.setAttribute("regulation", regulation);
        session.setAttribute("sem", sem);
        session.setAttribute("batch", batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept", dept);
        //session.setAttribute("exam", exam);
        /*String sss = exam.toUpperCase();
        if(exam.contains("unit")){
           sss = exam.replace("unit","IAE");
        }*/
    %>
    <body>
    <center> <img src="../images/logo2.png" height="165px" width="700px" /></center>
    <div id="yourTableIdName1">
        <center><h2 style="font-size: 22px;">DEPARTMENT OF <%=Find.getDeptFullForm(dept).toUpperCase()%> </h2></center>
        <center><h3>MARKS REPORT - UNIVERSITY EXAM</h3></center>
        <center><h3 style="">BATCH: <%=batch%>      
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Academic Year: 20<%=ayear%>-20<%=(Integer.valueOf(ayear) + 1)%></h3>
            <% for (Batch b : Batch.getAll()) {
                    if (b.getBatch().equals(batch)) {
            %>
        <h3 style="">Year/Sec: <%=b.getStatus()%>-<%=dept.toUpperCase()%>-<%=sec%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Max Marks:
        </h3>
        <%
                }
            }
        %>
    </center> 
    </div>
    <center>
            <table class="bordered">
                <thead>

                    <tr>
                        <th>S.No</th>
                        <th name="cc">Register No</th>
                        <th>Name</th>
                            <%
                                Subjects s = new Subjects();
                                s.setAyear(ayear);
                                s.setRegulation(regulation);
                                s.setSem(sem);
                                List<String> Subcodelist;
                               Subcodelist= Subjects.getLabSubCode(dept, s);
                                int l;
                                for(l=0;l<Subjects.getTherorySubCode(dept, s).size();l++)
                                    Subcodelist.add(Subjects.getTherorySubCode(dept, s).get(l));
                                for (String subcode : Subcodelist) {
                            %>
                        <th><%=subcode%></th>
                            <%
                                }
                            %>
                        <th>Signature</th>
                    </tr>
                </thead>
                <%
                    int i = 0;
                    List<Student> list = Student.getAll(dept, batch, sec);
                    for (Student stu : list) {
                %>
                <tr>
                    <td><%= i+1 %></td>
                    <td><%=stu.getRegno()%></td>        
                    <td><%=stu.getName()%></td>
                    <%
                        for (String subcode : Subcodelist) {
                            University m = new University();
                            m.setRollno(stu.getId());
                            m.setSubcode(subcode);
                            m.setSem(sem);
                    %>
                    <td><%=University.getUserMark(dept, m).getResult()%></td>
                    <%
                        } i++;
                    %><td></td>
                    <%                        
                    }
                    %>

                </tr>        
            </table>
    </center>
</body>
</html>
