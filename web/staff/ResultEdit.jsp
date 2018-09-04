<%-- 
    Document   : SetMark
    Created on : 16 Jul, 2017, 12:19:59 PM
    Author     : Irshed
--%>
<%@page import="General.AcademicYear"%>
<%@page import="Mark.University"%>
<%@page import="Mark.Mark"%>
<%@page import="java.util.List"%>
<%@page import="Actor.Student"%>
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
        <title>Set Mark</title>
        <link rel="stylesheet" href="../css/jquery-ui1.css">
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> 
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/NumberToWords.js"></script>
        <%
            String dept = request.getParameter("dept");
            String batch = request.getParameter("batch");
            String sec = request.getParameter("section");
            String sem = request.getParameter("sem");
            String subcode = request.getParameter("subject");
            String semester = University.getCurrentSem(batch, AcademicYear.getCurrentYear().getYear());
        %>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".click").click(function () {
                    var but = $(this);
                    var id = $(this).closest('tr').children('td#roll').text();
                    var mark = $(this).closest('tr').children().children('.marks');

                    var subcode = $("#code").text();
                    var dept = $("#dept").val();
                    var sem = $("#sem").val();
                    var semester = $("#semester").val();
                    $.post("../UpdateResult",
                            {
                                dept: dept,
                                subject: subcode,
                                sem: sem,
                                semester:semester,
                                mark: mark.val(),
                                rollno: id}
                    , function (data) {
                        but.val(data);
                        but.css("background-color", "#149dd2");
                        but.css("color", "white");
                        but.prop("disabled", true);
                    });
                });
                $(".UpdateAll").click(function () {
                    var sbut = $(this);
                    sbut.css("background-color", "#149dd2");
                    sbut.css("color", "white");
                    sbut.prop("disabled", true);
                    $(".click").each(function () {
                        var but = $(this);
                        var id = $(this).closest('tr').children('td#roll').text();
                        var mark = $(this).closest('tr').children().children('.marks');
                        var subcode = $("#code").text();
                        var dept = $("#dept").val();
                        var sem = $("#sem").val();
                        var semester = $("#semester").val();
                        $.post("../UpdateResult",
                                {
                                    dept: dept,
                                    subject: subcode,
                                    sem: sem,
                                    semester:semester,
                                    mark: mark.val(),
                                    rollno: id}
                        , function (data) {
                            but.val(data);
                            but.css("background-color", "#149dd2");
                            but.css("color", "white");
                            but.prop("disabled", true);
                        });
                        sbut.val("Updated");
                    });
                });
            });
        </script>
    <center style="background-color: #f5f5f5;">
        <img src="../images/logo2.png" height="165px" width="700px" />	</center>
</head>

<body class="home page page-id-115 page-template-default has-toolbar">
<center><h1>University Result Update for <%=dept.toUpperCase()%> Department <%=batch%> batch  <%=sem%>th semester <%=sec%> section</h1></center>

<center><h3 style="color: red;">Note- use "RA" for Absentees</h3></center>

<div id="wrapper" class="toggled">
    <style rel="stylesheet">
        .bordered td{
            padding: 0px;
            text-align: center;
        }
        .bordered th{
            text-align: center;
        }
    </style>
    <section class="section-content section-bg" style="background-color:white;"><div class="container clearfix"><div class="entry-content">

                <section class="landing">
                    <form action=""  id="marks" method="post">  
                        <fieldset>
                            <center>
                                <input type="hidden" value="<%=dept%>" id="dept"/>
                                <input type="hidden" value="<%=sem%>" id="sem"/>
                                <input type="hidden" value="<%=semester%>" id="semester"/>
                                <table class="bordered">
                                    <thead>
                                        <tr>
                                            <th>Sno</th>
                                            <th name="cc">Roll No</th>
                                            <th>Name</th>
                                            <th>Register No</th>
                                            <th id="code"><%=subcode%></th>
                                            <th>Update</th>
                                        </tr>
                                    </thead>
                                    <%
                                        List<Student> list = Student.getAll(dept, batch, sec);
                                        int i = 0;
                                        for (Student stu : list) {
                                    %>

                                    <tr>
                                        <td><%=i + 1%></td>
                                        <td id="roll"><%=stu.getId()%></td>        
                                        <td><%=stu.getName().toUpperCase()%></td>
                                        <td><%=stu.getRegno()%></td>
                                        <%
                                            String a1 = stu.getId() + "_" + i;
                                            i++;
                                        %>

                                        <td width="150px">
                                            <input type="text" style="background-color: white; " class="marks" size="3" maxlength="3" id="<%=a1%>">
                                        <td style="padding: 10px;"><input type="button" class="click" id="submit"  value="Update" /></td>
                                    </tr> <% }%>        
                                </table>
                            </center>
                            <br>
                            <center>
                                <input type="button" class="UpdateAll" id="submit" value="Update All" ></center>
                        </fieldset> 
                    </form>  
                </section></div></div></section>
    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>
</body>   
</html>