<%-- 
    Document   : ChallanEntry
    Created on : 5 Mar, 2018, 11:38:33 AM
    Author     : irshed
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Actor.Student"%>
<%@page import="Fee.MUResponse"%>
<%-- 
    Document   : FeeEntry
    Created on : 5 Mar, 2018, 11:30:29 AM
    Author     : irshed
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.action.Find"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script>
            $(document).ready(function () {
                var rollno = $("#rollno").val();
                var mup = $("#mupno").val();
                var date = $("#date").val();
                var mop = "challan";
                var stat = $("#status");
                $.post("../EntryChallan", {
                        mup: mup,
                      }, function (response) {
                          
                        stat.val(response);
                        if(response==="Paid"){
                            stat.css("color","green");
                            $("#submit").prop("disabled",true);
                            $("#submit").val("Already Paid");
                        }else{
                            stat.css("color","red");
                        }
                    });
                $("#submit").click(function () {
                    var but = $(this);
                    $.get("../EntryChallan", {
                        rollno: rollno,
                        mup: mup,
                        date:date,
                        mop: mop
                    }, function (response) {
                        but.val(response);
                    });
                });
            });


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
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Academics</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Batch</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="batch.jsp">Update Batch</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="deletebatch.jsp">Delete Batch</a>
                                                </ul>
                                            </li>

                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Academic Year</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="InsertYear.jsp">Insert Academic Year</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="CurrentUpd.jsp">Update Current</a>
                                                </ul>
                                            </li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="">Subjects</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectAdd.jsp">Subject Add</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Subject View</a>
                                                        <ul class="sub-menu">
                                                            <% for (String dept : Find.Depts) {%>
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=<%=dept%>"><%=dept.toUpperCase()%></a>
                                                            <%}%></ul></li>
                                                </ul></li>
                                           
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="FeeEntry.jsp">Fee Entry</a></li></ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Students</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="studentprofiles.jsp">Profile</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileupdate.jsp">Add Profile</a>

                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileedit.jsp">Update Profile</a>

                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profiledelete.jsp">Delete Profile</a>
                                                </ul></li>	
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="studentpasswords.jsp">Passwords</a>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="BulkUpdate.jsp">Bulk Update</a>

                                            </li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Staff</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Profile</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofileupdate.jsp">Add Profile</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofiledelete.jsp">Delete Profile</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="StaffProfileEdit.jsp">Edit Profile</a>
                                                </ul></li>	


                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffpasswords.jsp">Passwords</a></li>

                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">SMS</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="generalsms.jsp">General</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="absentieessms.jsp">Absentiees</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksms.jsp">Mark</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffsms.jsp">Staff</a></li>

                                        </ul>
                                    </li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Email</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="sendemail.jsp">Send Email</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="emailstatus.jsp">View Email Status</a>

                                            </li>
                                        </ul>

                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circularupload.jsp">Circular Uploads</a>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Forms</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formupload.jsp">Form Upload</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formmanage.jsp">Manage</a></li>

                                        </ul>
                                    </li>


                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Reports</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="PasswordReport.jsp">Password</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="AddressReport.jsp">Address</a>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="verificationReport.jsp">Verification</a>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="BoardingptReport.jsp">Boarding Point</a>

                                        </ul>
                                    </li>   
                                </ul>					


                            </nav>
                        </div>
                    </div>
                </div>
            </header>


            <style>td {
                    padding: 10px;
                }
                label {
                    display: inline-block;
                    width: 140px;
                    text-align: right;
                }
            </style>
            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                        <div >
                            <%
                                String mup = request.getParameter("mup");
                                String date = request.getParameter("date");
                                String d = new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date));
                                MUResponse m = MUResponse.getbyMUP(mup);
                                if (m != null) {
                            %>

                            <form>
                                <center> 

                                    <label> Roll No :</label><input type="text" style="background: white"  id="rollno" value="<%=m.getRollno()%>" disabled><br><br>
                                    <label> Name :</label><input type="text" style="background: white"  value="<%=Student.getById(m.getRollno()).getName().toUpperCase()%>" disabled><br><br>
                                    <label> Mup No :</label><input type="text" style="background: white" id="mupno" name="mupno" value="<%=m.getRefno()%>" disabled><br><br>
                                    <label> Date of Payment :</label><input type="text" style="background: white"  name="mupno" value="<%=d%>" disabled><br><br>
                                    <label> Total Amount :</label><input type="text" style="background: white"  value="<%=m.getTotalamt()%>" disabled><br><br>
                                    <label> Current Status:</label><input type="text" style="background: white"  id="status" disabled><br><br>
                                    <input type="hidden" id="date" value="<%=date%>"/>
                                </center>
                                <div align="center">
                                    <br><br>
                                    <input type="button" id="submit" value="Submit" />
                                    <br><br></div></form>
                                    <% } else { %>

                            <h1 style="margin: auto; margin-left: 500px" >Invalid Mup</h1>
                            <%  }%>
                        </div>
                    </div></div></section>

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
            <div class="copy"> © All rights reserved, IncredibleBytes, 2014</div>
            <button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
            <nav id="footer-nav">
                <ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>
                    <li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="courses/index.html">Courses</a></li>
                    <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="blog/index.html">Blog</a></li>
                    <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="contact-2/index.html">Contact</a></li>
                </ul>                   </nav>
        </div>
    </footer>




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
            });
    </script>


    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

</html> 
