<%-- 
    Document   : addStaff
    Created on : 18 Nov, 2016, 7:16:44 PM
    Author     : Home
--%>

<<%-- 
    Document   : addStudent
    Created on : 18 Nov, 2016, 7:16:34 PM
    Author     : Home
--%>
<%@page import="com.action.Find"%>
<%-- 
    Document   : addEntry
    Created on : 18 Nov, 2016, 6:16:29 PM
    Author     : Home
--%>
<%-- 
    Document   : home
    Created on : 18 Nov, 2016, 5:57:23 PM
    Author     : Home
--%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.action.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en-US">
    
<% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type = rsss.getString("type");
        }
        if(type.equals("reception"))
        {
    
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        	     <link rel="stylesheet" href="../css/main.css">
     
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
 <script src="../js/jquery.js"></script>
         
     
 <link href="../css/simple-sidebar.css" rel="stylesheet">
    <link href="../css/sky-forms.css" rel="stylesheet">


     
	
		
		</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">

		        
	
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../images/sjit.png"  height="70px"></a>
						</div>
                                           

						
						

						
						

						<nav id="main-nav">
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>

    


     
<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Add Entry</a>
    <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffAdd.jsp">Staff</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="studentAdd.jsp">Student</a>
</ul>
</li>



<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#"> Report</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personalReport.jsp">Personal Report</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="dailyReport.jsp">Daily Report</a>
</ul></li>




   




</ul>						</nav>
					</div>
				</div>
			</div>  <style>td {
        padding: 10px;
        }
        label {
  display: inline-block;
  width: 140px;
  text-align: right;
}
</style>

<script>
    
    $(document).ready(function(){
        
        $( "input" ).prop( "disabled", true );
        $("#rollno").prop( "disabled", false );
        $(".button").prop( "disabled", false );
        $("select").prop("disabled",true);
        $(".button").click(function(){
            
            
          $("[name='entry']").val($(this).val());
         
        });
        $("#submitform").submit(function(){
            
            //console.log($(this).val());
            
            
       
     
        });
    });
    
</script>
		</header>


<center>
<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

            <center><h1>Staff Entry</h1></center><br><br><br>
            
                <div id ="manual"><form method="post" action="staffAdd.jsp" >
                    <center> <label> Roll No :</label><input type="text" style="background: white" id="rollno" name="search"></center>
                    <div align="center">
                        <br><br>
                        <input type="submit" class="button" id="submit" value="Submit" />
                    <br><br></div></form>
                    <%
                        String rollno=request.getParameter("search");
                        Connection con=null;
                        Statement stmt=null;
                        ResultSet rs=null;
                        String sql="select * from staff_general where staffid like '"+rollno+"'";
                    if(request.getParameter("search")!=null)
                    {
                        
                        try
                        {

                         con=new dbcon().getConnection(Find.sdept(rollno));
                         stmt=con.createStatement();


                    %>
                    <center> 
                            <center><h3>General Details</h3></center>
                           <%
                           rs=stmt.executeQuery(sql);
                           if(rs.next())
                           {
                           %>

                            <table cellspacing="10"><tr><td>

                                        <label> Staff ID :</label><input type="text" style="background: white" id="rollno" name="rollno" value="<%=rollno%>" disabled></td>

                                    <td>

                                        <label>Department :</label><input type="text" style="background: white"  value="<%=Find.sdept(rollno)%>" disabled>

                                <td>
                                    <label> Name :</label><input type="date" style="background: white" id="dob" name="dob" value="<%=rs.getString("tittle")+rs.getString("name").toUpperCase()%>"></td>
                                <td><label>Designation :</label><input type="text" style="background: white" id="caste" name="caste" value="<%=rs.getString("desg")%>">
                                </td></tr>
                                <tr>

                                    <td>
                                        <label>Gender :</label><input type="text" style="background: white" id="pincome" name="pincome" value="<%=rs.getString("gender")%>">
                                    </td>

                                    

                                    <td>
                                        <label> Mobile 1 :</label><input type="text" style="background: white" id="nationality" name="nationality" value="<%=rs.getString("mobile1")%>">
                                    </td>

                                


                                    <td>
                                        <label> Mobile 2 :</label> <input type="text" style="background: white" id="mothertongue" name="mothertongue" value="<%=rs.getString("mobile2")%>">
                                    </td>
                                   
                        

                                <div align="right">
            </div>
            <br><br>
                        </center>
                          
                               
                           <table>
                                <tr>
                                    <td><center><h2>Photo</h2>
                                          <img src="../../StaffPhotos/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                  </center>
                                    </td>
                                   
                                </tr>
                            </table>
                            <br><br>
                             
                            <%
                            }
                               %>
                           
                            <input type="hidden" name="formtype" value="personal">
             <div align="right">
            </div>
            <br><br>
            <form id="submitform" action="../addEntry" method="post">
                  
            <input type="hidden" class="button" name="rollno" value="<%=rollno.toUpperCase()%>">
            <input type="hidden" class="button" value=""  name="entry" >
            
               <input type="submit" value="IN" class="button" id="submit">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="OUT" class="button" id="submit">
          
           
            </form>
                        </center>

                     <%
                     

if(stmt!=null)
stmt.close();

if(con!=null)
con.close();
}
                     catch(Exception e)
                        {
                            e.printStackTrace();
                        }
finally
{
try
{
if(con!=null)
con.close();
if(stmt!=null)
stmt.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}
}
                  %>

                </div>



</div></div></section>

            

</div></div>

<br><br></section></center>		


						<footer id="footer-widgets">
			<div class="container clearfix">
								Powered by St.Joseph's
							</div>
		</footer>
			<!-- #page-container -->
			</div>
			</div>

	<footer id="page-footer">
		<div class="container clearfix">
			<div class="copy"></div>
			<nav id="footer-nav">
                            			<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>
				
    			</nav>
		</div>
	</footer>






    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>
<%
    }
        else
    {
        response.sendRedirect("../index.jsp");
    }
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    else
    {
        response.sendRedirect("../index.jsp");
    }
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>