<%-- 
    Document   : allocatereg
    Created on : Aug 21, 2015, 10:41:07 AM
    Author     : Divya Sri
--%>


<%@page import="java.sql.PreparedStatement"%>
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
        <title>JSP Page</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection(dept);
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
      
        String subcode,rollno,name;
       
        
       
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
       
       
        %>
        <body>
        <center> <h1>UPDATE REGISTER NUMBER</h1></center>
        <form action="${pageContext.request.contextPath}/regupdate" method="post">
            <center>
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        
        
        
            
        <th>Register No</th>
        
       
    </tr>
    </thead>
    
    <%
        //Statement st = con.createStatement();
        String sql2= "select * from student_personal where batch=? and sec=? order by regno,rollno";
     PreparedStatement st=con.prepareStatement(sql2);
     st.setString(1, batch);
     st.setString(2, sec);
        ResultSet rs=st.executeQuery();
     int i=1;
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
      String regno=rs.getString("regno");
         
       
        %>
      
    <tr>
        <td><%=rollno%></td>        
        <td>
        
        <input type="text" size="30"  value="<%=name.toUpperCase()%>" name="name<%=rollno%>" id="name<%=i%>">
        </td>
                
        <td><input type="text" size="12" maxlength="12" value="<%=regno%>" name="reg<%=rollno%>" id="reg<%=i%>"></td>
        </tr>       

       <%
        i++;
        
     }
     
     rs.close();

                            if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();
     
     %>
     
    
        
</table>
            </center>
     <center><input type="submit" value="submit"></center>
        </form>
     
    </body>
</html>
