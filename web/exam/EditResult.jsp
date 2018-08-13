
<%-- 
    Document   : EditResult
    Created on : 31 Jul, 2018, 11:56:44 AM
    Author     : vignesh
--%>
<%@page import="java.util.Calendar"%>
<%@page import="com.action.Find"%>
<%@page import="Mark.University"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Actor.Student"%>
<%@page import="Mark.Mark"%>
<%@page import="Subjects.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="General.Batch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();
            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type = rsss.getString("type");
                }
                if (type.equals("exam")) {
    %>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Mark</title>
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#marks").submit(function () {
                    flag = 0;
                    $(".marks").each(function (index) {
                        var patt = /^[A-Za-z0-9,+]+$/;
                        var result = patt.test($(this).val());
                        var result1 = ($(this).val() === 'A' || $(this).val() === 'N' || $(this).val() === 'null'||($(this).val() === '' && $(this).attr('placeholder') ==="NULL"));
                        if ( ($(this).val() === '' && $(this).attr('placeholder') !=="NULL" ) || (result === false && result1 === false))
                        {
                            $(this).focus();
                            $(this).css({"border-color": "#9ecaed",
                                "box-shadow": " 0 0 10px #9ecaed"});
                            flag = 1;
                        } else {
                            $(this).css({"border-color": "",
                                "box-shadow": ""});
                        }
                    });
                    if (flag === 1)
                        return false;
                });
            });
        </script>
    </head>
    <%        
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
        //String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
        //String semester = request.getParameter("semester");
        int s1 = Calendar.getInstance().get(Calendar.MONTH);
         s1 = s1 + 1;
         String semset="";
         if(s1>=6 && s1<=11)
         {
             semset = "odd";
         }   
         else
         {
             semset = "even";
         }//String semest = Integer.toString(s);
        int seme = Find.getSem(batch, ayear, semset);
        String semester = Integer.toString(seme);
        
        
        String regulation = Batch.getRegulation(batch);
        session.setAttribute("regulation", regulation);
        session.setAttribute("sem", sem);
        session.setAttribute("ayear", ayear);
        session.setAttribute("batch", batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept", dept);
        //session.setAttribute("exam", exam);
        session.setAttribute("semester", semester);
    %>
    <body>
    <center><h1>Mark Update for <%=dept.toUpperCase()%> Department <%=batch%> batch  <%=sem%>th semester <%=sec%> section</h1></center>
    <form action="${pageContext.request.contextPath}/UniversityUpdate" id="marks" method="post">
        <%
            Enumeration<String> names=request.getParameterNames();
        while( names.hasMoreElements()){
            String name=names.nextElement();%>
       <input type="hidden" name="<%=name%>" value="<%=request.getParameter(name)%>">
        <%}

        %>
        <center>
            <table class="bordered">
                <thead>
                    <tr>
                        <th name="cc">Roll No</th>
                        <th>Register No</th>
                        <th>Name</th>
                            <%
                                Subjects s = new Subjects();
                                s.setAyear(ayear);
                                s.setRegulation(regulation);
                                s.setSem(sem);
                                List<String> Subcodelist ;
                              Subcodelist= Subjects.getLabSubCode(dept, s);
                                int l;
                                for(l=0;l<Subjects.getTherorySubCode(dept, s).size();l++)
                                    Subcodelist.add(Subjects.getTherorySubCode(dept, s).get(l));
                                
                                for (String subcode : Subcodelist) {
                            %>
                        <th><%=subcode%></th>
                            <% }%>
                    </tr>
                </thead>
                <%
                    List<Student> list = Student.getAll(dept, batch, sec);
                    for (Student stu : list) {
                %>
                <tr>
                    <td><%=stu.getId()%></td> 
                    <td><%=stu.getRegno()%></td>
                    <td><%=stu.getName()%></td>
                    <%
                        int i = 0;
                        for (String sub : Subcodelist) {
                            University m = new University();
                            m.setRollno(stu.getId());
                            m.setSubcode(sub);
                            m.setSem(sem);
                            
                                String a1 = stu.getId() + "_" + i;
                            if (University.isMarkAvailable(dept, m)) {
                                m = University.getUserMark(dept, m);
                    %>
                    <td><input type="text" size="4" class="marks" maxlength="4" name="<%=a1%>" id="<%=a1%>"placeholder="NULL" ></td>
                        <%
                        } else {
                        %>
                    <td><input type="text" size="4" class="marks" name="<%=a1%>" id="<%=a1%>" placeholder="NULL" ></td>
                    
                        <%                    }
                          %>
                          
                                    <%i++;
                                }
                            }
                        %>
                </tr>        
            </table>
                <br><br>    
            <input id="submit" type="submit" value="submit">
        </center>
    </form>
</body>
<%
            } else {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }

        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            ;//connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }

%>
</html>

