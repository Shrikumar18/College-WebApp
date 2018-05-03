<%-- 
    Document   : Challan
    Created on : Jan 24, 2017, 9:17:34 AM
    Author     : Lenovo
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="Fee.MUResponse"%>
<%@page import="java.util.Date"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
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
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from student_login_details where rollno='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {

                session.setAttribute("deptname", Find.sdept(username));
                MUResponse mu = (MUResponse) session.getAttribute("MUResponse");
                boolean feepaid = false;
                if (request.getAttribute("paid") != null) {
                    if (request.getAttribute("paid").toString().equals("Y")) {
                        feepaid = true;
                    }
                }
                String mupno = mu.getRefno();
                String bcharge = mu.getBankchrge();
    %>

    <%!
        public String getsubContent(Student s, String details, String amount, String copyof, String tot, boolean feepaid, String mupno) {
            String data;
            String paid = "";
            if (feepaid) {
                paid = "<img style=\"position:absolute;top: 300;left: 50;height:100px;width:200px;\" src=\"./css/images/paidstamp.png\">\n";
            }
            data = "   <div id=\"subcontent\">\n"
                    + "                     <div style=\"text-align: center; font-size: 15px; font-weight: bold;\">" + copyof + " COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>\n"
                    + "                     <div>\n"
                    + "                        <div style=\"float: left; height: 65px;\">\n"
                    + "                           <div style=\"float: left;\"><img src=\"./css/images/sjit.jpg\" alt=\"logo\" height=\"60\" width=\"60\"></div>\n"
                    + "                           <div style=\"float: left; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;\">MUP Ref.No:<br><span style=\"font-weight:bold;padding-right: 5px;\">" + mupno + "</span></div>\n"
                    + "                        </div>\n"
                    + "                        <div style=\"float: right; width: 55px; height: 65px;\"><img src=\"./css/images/ib.jpg\" alt=\"logo\" height=\"60\" width=\"60\"></div>\n"
                    + "                     </div>\n"
                    + "                     <div style=\"clear: both; padding-top: 3px;\">\n"
                    + "                        <div style=\"text-align: right;\">Date : " + Find.getFormattedDate() + "</div>\n"
                    + "                     </div>\n"
                    + "                     <div style=\"text-align: center;\">Paid into the Credit of</div>\n"
                    + "                     <div style=\"text-align: center;font-size:15px; font-weight: bold;\">St.Joseph's Institute of Technology</div>\n"
                    + "                     <div style=\"padding-top: 3px;font-size:11px;\">Student Name <b>" + s.getName() + " </b></div>\n"
                    + "                     <div style=\"font-size:11px;\">Roll No <b> " + s.getId().toUpperCase() + "</b></div>\n"
                    + "                     <div style=\"padding-top: 3px;\">\n"
                    + paid + "                 <table style=\"border-collapse: collapse; line-height: 13px; border: 1px solid #222;font-size: 11px;\" width=\"100%\">\n"
                    + "                              <tr style=\"border: 1px solid #111;\">\n"
                    + "                                 <td style=\"text-align: center; width: 80%; border: 1px solid #111;\" align=\"center\">Particulars\n"
                    + "                                 <td style=\"text-align: center; width: 20%; border: 1px solid #111;\" align=\"center\">Amount</td>\n"
                    + "                              </tr>\n"
                    + "                              <tr style=\"border: 1px solid #111;\">\n"
                    + "                                 <td style=\"padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;\">" + details + "</td>\n"
                    + "                                 <td style=\"text-align: right; border: 1px solid #111;\" align=\"right\" valign=\"middle\">" + amount + "</td>\n"
                    + "                              </tr>\n"
                    + "                              <tr>\n"
                    + "                                 <td style=\"text-align: right; border: 1px solid #111;\" align=\"right\">Total&nbsp;</td>\n"
                    + "                                 <td style=\"text-align: right; border: 1px solid #111;\" align=\"right\">" + tot + "</td>\n"
                    + "                              </tr>\n"
                    + "                        </table>\n"
                    + "                     </div>\n"
                    + "                     <div style=\"padding-top: 10px;\">Signature of the Remitter :</div>\n"
                    + "                     <div style=\"padding-top: 20px;\">\n"
                    + "                        <div style=\"float: left;\">Cashier</div>\n"
                    + "                        <div style=\"float: right;\">Asst.Manager/Manager</div>\n"
                    + "                     </div>\n"
                    + "                   </div>";
            return data;
        }
    %>

    <%!
        public String getContent(Student s, String details, String amount, String tot, boolean feepaid, String mupno) {
            String data;
            data = "          <div style=\"float: left;position:relative; width: 30%; line-height: 22px;\">\n"
                    + "                      \n" + getsubContent(s, details, amount, "BANK", tot, feepaid, mupno)
                    + "                     \n"
                    + "                  </div>\n"
                    + "                  <div style=\"float: left;position:relative; width:30%; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;\">\n"
                    + "                \n" + getsubContent(s, details, amount, "COLLEGE", tot, feepaid, mupno)
                    + "                  </div>\n"
                    + "                  <div style=\"float: left;position:relative; width: 30%; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;\">\n"
                    + "                  \n" + getsubContent(s, details, amount, "STUDENT'S", tot, feepaid, mupno)
                    + "                  </div>\n"
                    + "               </div>";

            return data;
        }
    %>



    <head>
        <title></title>
        <link type="text/css" rel="stylesheet" href="css/comman.css" media="undefined">
        <link href="../css/tabledesign.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="styles/menu.css" media="undefined">
    </head>
    <%
        Student s = Student.getById(username);


    %>
    <body style="padding:10px;margin:10px;" class="">
        <div class="row">

            <div class="row" id="divPrintChallan">


                <%                 Fee.Fee f = null;
                    if (request.getParameter("acyear") != null) {
                        f = Fee.Fee.getFeeById(s.getId(), request.getParameter("acyear"));
                    } else {
                        f = Fee.Fee.getFeeById(s.getId());
                    }
                    String bankcharge = "Bank Charges";
                    String bankamount = bcharge;

                    Float bankchr = Float.valueOf(bcharge);
                    int once = 0;
                    Integer sum = 0;
                    String Detail = "";
                    String Amount = "";
                    for (String type : Fee.Fee.getsubCategory()) {
                        if (type.equals("tution")) {
                            Amount += String.valueOf((Integer.valueOf(f.getByType(type)) + Integer.valueOf(f.getByType("development")))) + "<br><br><br><br><br><br><br><br>";
                            sum += (Integer.valueOf(f.getByType(type)) + Integer.valueOf(f.getByType("development")));
                        } else if (type.equals("development")) {
                        } else {
                            Amount += f.getByType(type) + "<br><br><br><br><br><br><br><br>";
                            sum += Integer.valueOf(f.getByType(type));
                        }
                        Detail += Fee.Find.getFeeDetails(type) + "<br><br>";
                    }
                %>

                <div><br><br>
                    <% if ((!feepaid) && once == 0) {
                            once = 1;
                    %>
                    <div><b>This Challan valid upto <%=Find.getFormattedDate(LocalDate.now().plusDays(10).toString().replace("-", ""))%></b>
                    </div>
                    <%}%>
                    <div style="border: 2px solid  #000; padding-left: 7px; float: left; padding-right: 7px;">
                        <div style="float: none; clear: both;">
                            <%=getContent(s, Detail + bankcharge, Amount + bankamount, String.valueOf((sum + bankchr)), feepaid, mupno)%>
                        </div>
                    </div>
                </div>
                <br><br><br>

            </div>
        </div>
        <script type="text/javascript">function printPage() {
                focus();
                print();
            }</script>
    </body>

    <%

            } else {
                response.sendRedirect("./index.jsp");
            }
            if (sttt != null) {
                sttt.close();
            }
            if (connn != null) {
                ;//connn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./index.jsp");
        }


    %>
</html>