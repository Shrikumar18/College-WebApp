<%@page import="Actor.Staff"%>
<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<html lang="en-US">
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();
            String regno;

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {


    %>

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/tablecs.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">


    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    </li>
                </ul>
            </div>




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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Profile</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>


                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="HourAttd.jsp">Update Attendance</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="SubjectWise.jsp">View Attendance</a>

                                            </li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="">Marks</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="markupdate.jsp">Update Marks</a></li>


                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksview.jsp">View Marks</a></li>
                                        </ul>
                                    </li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Notes</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
                                            <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesdownload.jsp">View Notes</a></li>
                                        </ul></li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circular.jsp">Circular</a>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>


                                        <%    Staff s = new Staff(username);
                                            if (s.getCouncillorDetails().getBatch() != null) {
                                        %>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="councillor/home.jsp">Councillor View</a>
                                        <%
                                            }
                                        %>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


                        <div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>EXPERIENCE DETAILS</b></font><br><br><br>
                                            <TABLE WIDTH=30% align ="center" border="1">
                                                <%
                                                         username = "cs001";
                                                    String departmentname = session.getAttribute("deptname").toString();
                                                    Connection connection = new dbcon().getConnection(departmentname);
                                                   // Statement statement = connection.createStatement();
                                                   PreparedStatement  statement=connection.prepareStatement("select * from staff_experience_details where rollno=?");
                                                   statement.setString(1, username);
                                                    ResultSet rs = statement.executeQuery();
                                                    String rollno = "", noc = "", post = "", f = "", t = "", tm = "";

                                                    while (rs.next()) {
                                                        rollno = rs.getString("rollno");
                                                        noc = rs.getString("noc");
                                                        post = rs.getString("post");
                                                        f = rs.getString("f");
                                                        t = rs.getString("t");
                                                        tm = rs.getString("tm");
                                                %>


                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Staff ID</b></TD>
                                                    <TD><%= rollno%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>Name of the company</b></TD>
                                                    <TD><%= noc%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Post</b></TD>
                                                    <TD><%= post%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>From</b></TD>
                                                    <TD><%= f%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>To</b></TD>
                                                    <TD><%= t%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>Time</b></TD>
                                                    <TD><%= tm%></TD>
                                                </TR>
                                        </center>

                                        <%
                                            }
                                        %>
                                        </TABLE> <br>
                                        </center>
                                    </div>
                                </div>


                                <div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>CONFERENCE DETAILS</b></font><br><br><br>
                                            <TABLE WIDTH=30% align ="center" border="1"><br>
                                                <%
                                                    PreparedStatement st=connection.prepareStatement("select * from staff_conference_details where rollno=?");
                                                    st.setString(1, username);
                                                    ResultSet rs2 = statement.executeQuery();
                                                    String nop = "", dop = "", place = "";

                                                    while (rs2.next()) {
                                                        rollno = rs2.getString("rollno");
                                                        nop = rs2.getString("noc");
                                                        dop = rs2.getString("dop");
                                                        place = rs2.getString("place");
                                                %>
                                                <center>

                                                    <TR CLASS="defaultText odd-row">
                                                        <TD><b>Name of the Paper</b></TD>
                                                        <TD><%= nop%></TD>
                                                    </TR>
                                                    <TR CLASS="defaultText">
                                                        <TD><b>Date of Presentation</b></TD>
                                                        <TD><%= dop%></TD>
                                                    </TR>
                                                    <TR CLASS="defaultText odd-row">
                                                        <TD><b>Place</b></TD>
                                                        <TD><%= place%></TD>
                                                    </TR>
                                                    
                                                </center>


                                                <%
                                                    }
                                                %></table><br></center></div></div>
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>JOURNAL DETAILS</b></font><br><br><br>
                                            <TABLE WIDTH=30% align ="center" border="1"><br>
                                                <%
                                                    PreparedStatement stt=connection.prepareStatement("select * from staff_journals_details where rollno=?");
                                                    stt.setString(1, username);
                                                    ResultSet rs3 = statement.executeQuery();
                                                    String noj = "", yop = "";

                                                    while (rs3.next()) {
                                                        rollno = rs3.getString("rollno");
                                                        noj = rs3.getString("noc");
                                                        yop = rs3.getString("yop");
                                                %>

                                                <center>

                                                    <TR CLASS="defaultText odd-row">
                                                        <TD><b>Name of the Journal</b></TD>
                                                        <TD><%= noj%></TD>
                                                    </TR>
                                                    <TR CLASS="defaultText">
                                                        <TD> <b>Year of Presentation</b></TD>
                                                        <TD><%= yop%></TD>
                                                    </TR>

                                                    <%
                                                        }
                                                    %></TABLE></center></div></div>
                               
                            </div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li></ul></div>
                    </div></div></section>

        </section>
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
        <div class="copy">� All rights reserved, IncredibleBytes, 2014</div>
        <button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
        <nav id="footer-nav">
            <ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>
                <li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="courses/index.html">Courses</a></li>
                <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="blog/index.html">Blog</a></li>
                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="contact-2/index.html">Contact</a></li>
            </ul>			</nav>
    </div>
</footer>





<script src="../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    $("#menu-toggle1").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
        ilass("toggled");
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
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>