<%-- 
    Document   : displayform
    Created on : 1 Mar, 2017, 12:16:19 PM
    Author     : Irshed
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Actor.Staff"%>
<%@page import="Downloads.Department"%>
<%@page import="Downloads.Exam"%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {

                session.setAttribute("deptname", Find.sdept(username));

    %>
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/main.css">

        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>


        <link rel="stylesheet" href="../css/angular-material.css">



        <link rel="stylesheet" href="../css/angulartab.css">

        <script src="../js/angular.js"></script>
        <script src="../js/angular-animate.min.js"></script>
        <script src="../js/angular-route.min.js"></script>
        <script src="../js/angular-aria.min.js"></script>
        <script src="../js/angular-message.min.js"></script>
        <script src="../js/svg-assert-cache.js"></script>
        <script src="../js/angular-material.js"></script>

        <script src="../js/angulartab.js"></script>
    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">

                <%  Connection con=new dbcon().getConnection(Find.sdept(username));
   // Statement stmtd=con.createStatement();
   // ResultSet rsd=stmtd.executeQuery("select * from staff_general where staffid='"+username+"'");
   Staff s=Staff.getByid(username);
   //if(s!=null)
    //{
    %>
    <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#menu-toggle1" id="menu-toggle1">
                       
                    </a>
                </li>
                <center>
                    <img src="../images/face.jpg" height="95px">
                    
                               
                           
                        
                   
                </center>
                <br>
                <br>
                
                <li >
                
                    <center>
                    <a href="#"><b><%=s.getName()%></b></a>
                    </center>
                    </li>
                <li>
                    <center>
                    <a href="#"><b><%=username%></b></a>
                    </center>
                    </li>
                <li >
                <center>
                    <a href="#"><b><%=s.getDesg()%></b></a>
                </center>
                </li>
                <li >
                <center>
                    <a href="#"><b><%=Find.sdept(username).toUpperCase()%></b></a>
                </center>
                </li>
            </ul>
        </div>
		        
	<%//}
        //if(stmtd!=null)
          //  stmtd.close();
        //if(con!=null)
          //  con.close();
        %>
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../images/sjit.png"  height="70px"></a>
						</div>
                                            <ul id="auth-nav">
							<li>
								<div class="auth-nav-register">
									<a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
								</div>
							</li>
						</ul>

						
						

						
						

						<nav id="main-nav">
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="general.jsp">General Details</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="education.jsp">Education Details</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="experience.jsp">Experience Details</a></li>
	

    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Log Book</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Update Attendance</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="#">Syllabus Coverage</a>
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Marks</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="markupdate.jsp">Update Marks</a></li>
	

        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksview.jsp">View Marks</a></li>
    </ul>
</li>
 <li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">University Results</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="resultUpdate.jsp">Update Results</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="resultView.jsp">View Results</a></li>
                                        </ul>
                                    </li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesdownload.jsp">View Notes</a></li>
	</ul></li>
        
      <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="displayform.jsp">Forms</a>

</li>




</ul>						</nav>
					</div>
				</div>
			</div>
		</header>


<center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                <br><br>
               <section class="landing">
                   
       
              <div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
<div class="dm3-tab"><div class="dm3-tab-inner"><center><h2>Forms</h2><br><br>
<div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2;background-color: #fff;">
<div align="left">
<% 
    
        
        String path = "%/staff%";
        List<String> list = new ArrayList<String>();
        
        List<String> listpath = new ArrayList<String>();
        List<String> listdescp=new ArrayList<String>();        
          try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection1 = new dbcon().getConnection("sjitportal");
            //Statement statement1 = connection1.createStatement();
           PreparedStatement statement1=connection1.prepareStatement("select filename,descp from forms where location like ?");
           statement1.setString(1, path);
            ResultSet rs = statement1.executeQuery();
            
            
            while(rs.next())
            {
                String file = rs.getString("filename");
                    listdescp.add(rs.getString("descp"));
                    listpath.add(rs.getString("location"));
                 list.add(file);
                 
            }
            
            %>
            
            <%
           
            for(int i=0; i<list.size();i++)
              {
                  String str=list.get(i);
                  //session.setAttribute(str,list.get(i));
            %>
            <a href="${pageContext.request.contextPath}/formsdownload?path=<%=listpath.get(i) %>ind1=<%=str %>" ><%= str %> - <%=listdescp.get(i)%></a>
<br>
<%
           
           }
            session.setAttribute("size",list.size());
              if(statement1!=null)
                            statement1.close();
                    //          if(connection1!=null)
                      //          connection1.close();
          }
          catch(Exception e)
          {
           e.printStackTrace();
          }
%></div>
</div>
</center>
</div>
</div>


        
            
        </section>

            

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
			<!--<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>-->
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="../credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-770"><a href="../index.jsp">Logout</a></li>

                                </ul>			</nav>
		</div>
	</footer>





    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
     $("#menu-toggle1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
<%
          
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }
    //                if(sttt!=null)
      //                      sttt.close();
        //                      if(connn!=null)
          //                      connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
          
          %>
</html>