<%@page import="General.AcademicYear"%>
<%@page import="java.util.List"%>
<%@page import="General.Batch"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en-US">
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

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>

        <!-- Custom CSS -->
        <script>
            $(document).ready(function () {

                var dept, batch, sem, exam;
                $("#dept").change(function () {
                    dept = $("#dept").val();

                });

                $("#batch").change(function () {
                    batch = $("#batch").val();

                });
                $("#sem").change(function () {
                    sem = $("#sem").val();
                });
                $("#exam").change(function () {
                    exam = $("#exam").val();

                    if (exam !== "all") {

                        $.get("../EndDate", {
                            dept: dept,
                            batch: batch,
                            sem: sem,
                            exam: exam
                        }, function (response) {
                            $("#end").val(response);
                        });
                    }
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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>




                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page   current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Marks</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updatemarks.jsp">Update Marks</a></li>

                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmark.jsp">View Marks</a></li>



                                    </li>
                                </ul>
                                </li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="#">University Result</a>
<ul class="sub-menu">
                                           <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewResult.jsp">View Results</a></li>
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updateResult.jsp">Update Results</a></li>
                                
                                </ul>
</li>


                                <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="#">Report Generation</a>
                                    <ul class="sub-menu">
                                           <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="AnalysisReport.jsp">Exam Report</a></li>
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="reportgeneration.jsp">Marks Report Staff</a></li>

                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmarkbonus.jsp">Marks Report Student</a></li>



                                </li>
                                </ul>
                                </li>



                                <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="#">Student</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updatemodeltype.jsp">Update Model Type</a></li>

                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="regnoupdate.jsp">Update Register No.</a></li>

                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="BonusQuery.jsp">Bonus Assignment</a></li>
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="StudentNo.jsp">Student no display</a></li>

                                    </ul>
                                </li>



                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circular.jsp">Circular</a>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>


                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="examuploads.jsp">Exam Uploads</a>

                                </li></ul>						</nav>	




                        </div>
                    </div>
                </div>
            </header>


            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                        <center>  <form action="${pageContext.request.contextPath}/EndDate" class="sky-form" method="post" >
                                <header>Date Allotment</header>
                                <fieldset>					
                                    <section>
                                        <label class="input">
                                            <div align="left" size="3px"><b>DEPARTMENT</b></div>
                                            <label class="select">

                                                <select id="dept" name="dept" required>
                                                    <option disabled selected>select</option>
                                                    <option value="all">ALL</option>
                                                    <option value="cse">CSE</option>
                                                    <option value="it">IT</option>
                                                    <option value="civil">CIVIL</option>
                                                    <option value="mech">MECH</option>
                                                    <option value="eee">EEE</option>
                                                    <option value="ece">ECE</option>

                                                </select>

                                                </select>
                                                <i></i>                                    </label>
                                        </label>

                                        <br><br>

                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Batch:</b></div>
                                            <label class="select">
                                                <select id="batch" name="batch" required>
                                                    <option disabled selected>Select   </option>
                                                    <%=Batch.getHTMLContent()%>
                                                </select>
                                                <i></i>
                                            </label></label>
                                        <br> <br>
                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    SEM </b></div>
                                            <label class="select">

                                                <select id="sem" name="sem" required>
                                                    <option disabled selected>select</option>
                                                    <option value="01">1</option>
                                                    <option value="02">2</option>
                                                    <option value="03">3</option>
                                                    <option value="04">4</option>
                                                    <option value="05">5</option>
                                                    <option value="06">6</option>
                                                    <option value="07">7</option>
                                                    <option value="08">8</option>
                                                </select>
                                                <i></i>
                                                <br> <br>
                                            </label></label>

                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    EXAM</b></div>
                                            <label class="select">

                                                <select id="exam" name="exam"  required>
                                                    <option disabled selected>select</option>
                                                    <option value="unit1">IAE 1</option>
                                                    <option value="zreunit1">ReIAE 1</option>
                                                    <option value="unit2">IAE 2</option>
                                                    <option value="zreunit2">ReIAE 2</option>
                                                    <option value="unit3">IAE 3</option>
                                                    <option value="zreunit3">ReIAE 3</option>
                                                    <option value="unit4">IAE 4</option>               
                                                    <option value="zreunit4">ReIAE 4</option>
                                                    <option value="model3">Model(IAE 5)</option>
                                                    <option value="zremodel3">ReModel(IAE 5)</option>                
                                                    <option value="model1">Model 1</option>
                                                    <option value="zremodel1">ReModel 1</option>  
                                                    <option value="model2">Model 2</option>
                                                    <option value="zremodel2">ReModel 2</option>    
                                                    <option value="cycle1">Cycle 1</option>       
                                                    <option value="labmodel">Labmodel</option>           
                                                </select>
                                                <i></i>
                                                <br> <br>
                                            </label></label>
                                        <label class="input">
                                            <div align="left" size="3px" id="div7"><b>
                                                    End Date</b></div>
                                            <label class="input">

                                                <input type="date" id="end"   name="end" />
                                                <p id="a"></p>

                                                <i></i>
                                                <br> <br>
                                            </label></label>


                                    </section>


                                    <div align="left">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br>
                                </fieldset>
                            </form></center>

                        </section>

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
                        <div class="copy"></div>
                        <nav id="footer-nav">
                            <ul id="menu-footer-menu" class="menu">
                                <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
                                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
                            </ul>			</nav>
                    </div>
                </footer>





                <script src="../js/jquery.js"></script>

                <!-- Bootstrap Core JavaScript -->
                <script src="../js/bootstrap.min.js"></script>

                <!-- Menu Toggle Script -->



                <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

                <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
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
                        if (connn != null)
                                                ;//connn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("../index.jsp");
                    }

                %>
                </html>