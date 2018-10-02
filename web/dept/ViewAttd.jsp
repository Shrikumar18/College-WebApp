<%-- 
    Document   : UpdateAttd
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            String batch = request.getParameter("batch");
            String sec = request.getParameter("section");
            String sem = request.getParameter("sem");


        %>       
        <div id="yourTableIdName1">
            <center><h1><u>CSE <%=sec%></u></h1></center>
            <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
            <center><h1>ATTENDANCE REPORT</h1></center>
        </div>

        <form action="UpdatedAttendance.jsp">
            <center>
                <table class="bordered">
                    <thead>

                        <tr>
                            <th name="cc">Roll No</th>
                            <th>Name</th>

                            <%

                                Connection con = new dbcon().getConnection("cse");
                              //  Statement st = con.createStatement();
                             //   Statement st1 = con.createStatement();
                               // Statement st2 = con.createStatement();

                                int count = 0;
                                String dept=request.getSession().getAttribute("deptname").toString();
                                String sql = "select * from student_personal where batch=? and dept=? and sec=? group by rollno";
                                PreparedStatement st=con.prepareStatement(sql);
                                st.setString(1, batch);
                                st.setString(2, dept);
                                st.setString(3, sec);
                                ResultSet rs = st.executeQuery();
                                ResultSet rs1, rs2;
                                String rollno = null, name = null, subject = null;
                                //String[] str1=new String[100];
                                //String[] str2=new String[100];
                                String sql2 = "select * from subject_sem_table where sem=?";
                                PreparedStatement st2=con.prepareStatement(sql2);
                                st2.setString(1, sem);
                                rs2 = st2.executeQuery();
                                while (rs2.next()) {
                            %>
                            <th><%=rs2.getString("subcode")%></th>
                                <%
                                    }
                                %>
                        </tr>
                    </thead>
                    <%
                        while (rs.next()) {

                            String rn = rs.getString(1);

                            rs2.beforeFirst();

                            rollno = rs.getString("rollno");
                            name = rs.getString("name");
                    %>
                    <tr>
                        <td><%=rollno%></td>
                        <td><%=name%></td>
                        <%
                            while (rs2.next()) {
                                String sql1 = "select * from hourattendence where rollno=? and sem=?";
                                PreparedStatement st1=con.prepareStatement(sql1);
                                st1.setString(1, rn);
                                st1.setString(2, sem);
                                
                                rs1 = st1.executeQuery();
                                subject = rs2.getString("subcode");
                                count = 0;
                                while (rs1.next()) {

                                    for (int j = 3; j <= 12; j++) {
                                        if (rs1.getString(j) != null && rs1.getString(j).equals(subject)) {
                                            count++;
                                        }
                                    }

                                }
                        %>
                        <td><%=count%></td>
                        <%
                            }
                        %>


                    </tr>  



                    <%
                        }
                        session.setAttribute("count", count);
                        rs.close();

                        if (st != null) {
                            st.close();
                        }
                        if (con != null) {
                            ;//con.close();
                        }
                    %>





                </table></center>
        </form>
    </body>
</html>
