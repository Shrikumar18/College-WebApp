<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type1 = rsss.getString("type");
        }
        if(type1.equals("first"))
        {
            
    
    %>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		     <link rel="stylesheet" href="../css/main.css">
     
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	
    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
	    
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	 <script src="../js/jquery.js"></script>
         
        <script src="../js/tabtab.min.js"></script>
    
          
        
       
        <!-- Google Analytics -->
        <script src="../js/analytics.js">
          

        </script>

        <script src="../js/plugin.js"></script>
        <script>
$(window).load(function(){$(".tabs").tabtab({animateHeight:!1,fixedHeight:!1}),$(".tabdemo--one").tabtab({animateHeight:!0,fixedHeight:!1,scale:1,rotateX:0,speed:500,transformOrigin:"center left",rotateY:90,easing:"easeInOutCubic",translateX:0,tabMenu:".tabdemo__menu",tabContent:".tabdemo__content"}),$(".tabdemo--two").tabtab({animateHeight:!0,fixedHeight:!1,scale:1,rotateX:0,speed:500,transformOrigin:"center left",rotateY:90,easing:"easeInOutCubic",translateX:0,tabMenu:".tabdemo__menu",tabContent:".tabdemo__content"}),$(".package-managers-toggle").toggle({"class":"open",target:!1});});
</script>
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="subjectallocation.jsp">Subject Allocation</a>
 <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectallocation.jsp">Allocate</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectview.jsp">View</a></li> 
 </ul>
 </li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
<ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="YrAttendance.jsp">View Attendance</a></li>
	</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
                		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesReport.jsp">Notes Report</a></li>
	
    </ul></li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="cireveupdates.jsp">Department Uploads</a>
    </li>


<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marksreport.jsp">Mark Sheet</a>

</li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="studentanalysis.jsp">Student Analysis</a>

</li>
</ul>						</nav>
					</div>
				</div>
			</div>
		</header>



<center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                <br><br><br><br>
           <section class="landing">
            
            <div class="tabs" role="tabs">
                
                
                <div class="tabs__content">
                    <div class="tabs__content-item active">
                        <center><div style="color:#333333; margin-top: -75px;font-family: inherit;font-size:2.5em;">College Circular<br><br></div></center>
                        <div style="width:100%;height:300px;line-height:3em;overflow-y:scroll;padding:5px; solid #149dd2;">
<div align="left">
        <%
    Connection conbatch = new dbcon().getConnection("sjitportal");
                    //Statement stmt = conbatch.createStatement();
                     PreparedStatement stmt=conbatch.prepareStatement("select * from circular where type='circular'");
                    ResultSet rst=stmt.executeQuery();
                    String com1=null,name1=null,description1=null,path1=null;
                    rst.beforeFirst();
                    while(rst.next())
                    {
                        name1=rst.getString("name");
                        description1=rst.getString("des");
                        path1=rst.getString("path");
                        com1=name1+" - "+description1;
                        %>
    <a href="${pageContext.request.contextPath}/formsdownload?ind1=<%=name1 %>&path=<%=path1 %>&type1=circular" ><%=com1%></a>
    
              <br>
              <%
              }  if(stmt!=null)
                            stmt.close();
                              if(conbatch!=null)
                                ;//conbatch.close();
              %>
    </div></div>
                    </div>
                    


           

 <div class="tabs__content-item">
     
                   <center><div style="color:#333333; margin-top: -75px;font-family: inherit;font-size:2.5em;">Exam Circular<br><br></div></center>
     <div style="width:100%;height:300px;line-height:3em;overflow-y:scroll;padding:5px; solid #149dd2;">
<div align="left">
        <% 
    
        
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection1 = new dbcon().getConnection("sjitportal");
         //   Statement statement1 = connection1.createStatement();
          PreparedStatement statement1=connection1.prepareStatement("select * from exam_circular");
         ResultSet rs11 = statement1.executeQuery();
            String path2=Base.path+"/portal/exam/";
            
            
            
            while(rs11.next())
            {
                String file = rs11.getString("file_name");
                String desc = rs11.getString("descp");
                 String loc =rs11.getString("location");
                
            
            %>
            
            <a href="${pageContext.request.contextPath}/formsdownload?ind1=<%=file%>&path=<%=loc%>" ><%=desc%></a>
<br>
<%
    }  if(statement1!=null)
                            statement1.close();
                              if(connection1!=null)
                                connection1.close();
%>
    </div></div>
                </div>
                    
                    <div class="tabs__content-item">
                        <center><div style="color:#333333; margin-top: -75px;font-family: inherit;font-size:2.5em;">Events<br><br></div></center>
                          <div style="width:100%;height:300px;line-height:3em;overflow-y:scroll;padding:5px; solid #149dd2;">
                                        
<div align="left">

<%
     conbatch = new dbcon().getConnection("sjitportal");
      //               stmt = conbatch.createStatement();
     PreparedStatement  stmtt=conbatch.prepareStatement("select * from circular where type='event'");
    rst=stmtt.executeQuery();
                    rst.beforeFirst();
                    while(rst.next())
                    {
                        name1=rst.getString("name");
                        description1=rst.getString("des");
                        path1=rst.getString("path");
                        com1=name1+" - "+description1;
                        %>
    <a href="${pageContext.request.contextPath}/formsdownload?ind1=<%=name1 %>&path=<%=path1 %>&type1=circular" ><%=com1%></a>
    
              <br>
              <%
              }  if(stmt!=null)
                            stmt.close();
                              if(conbatch!=null)
                                ;//conbatch.close();
              %>

</div>
</div>
                    </div>

                </div>

<ul class="tabs__menu">
                    <li class="tabs__menu-item yanone active" style="width:33%;"><a href="#">College Circular</a></li>
                    <li class="tabs__menu-item " style="width:33%;"><a href="#">Exam Circular</a></li>
                    <li class="tabs__menu-item" style="width:34%;"><a href="#">Events</a></li>
                </ul>
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
			
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="../credits.html">Credits</a></li>

<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
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
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                ;//connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>