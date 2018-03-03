<!DOCTYPE html>
<%@page import="com.action.Find"%>
<%@page import="Fee.MUResponse"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<html lang="en-US">
    <head>
        <style rel="stylesheet">
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 26 May, 2015, 3:36:50 PM
    Author     : aravind
*/



table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
      
    overflow-x : auto; 
}


.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 4px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

h2{
    font-size: 18px;
    margin: 0px;
    padding: 0px;
}
            thead {display: table-header-group;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
    
    <center> <img src="../images/logo2.png" height="165px" width="700px" /></center>

    <center><h1>Paid Count</h1></center>


           <table class="bordered" align="center">
               
               <th rowspan="2"><center>Dates</center></th>
            <th colspan="3"><center>First Year</center></th>
           <th colspan="3"><center>Second Year</center></th>
            <th colspan="3"><center>Third Year</center></th>
            <th colspan="3"><center>Fourth Year</center></th>
             <tr>
                
                <th>Indian Bank</th>
                <th>Other Banks</th>
                <th>Challan</th>
                <th>Indian Bank</th>
                <th>Other Banks</th>
                <th>Challan</th>
                <th>Indian Bank</th>
                <th>Other Banks</th>
                <th>Challan</th>
                <th>Indian Bank</th>
                <th>Other Banks</th>
                <th>Challan</th>
            </tr> 
                <%
           PrintWriter outt=response.getWriter();
            Connection con=new dbcon().getConnection("sjitportal");
            int count1=0,count2=0,count3=0,count4=0,count5=0,count6=0,count7=0,count8=0,count9=0,count10=0,count11=0,count12=0;
            double sum1= 0.00,sum2=0.00,sum3=0.00,sum4=0.00,sum5=0.00,sum6=0.00,sum7=0.00,sum8=0.00,sum9=0.00,sum10=0.00,sum11=0.00,sum12=0.00;
            String from=request.getParameter("from");
            String to=request.getParameter("to");
            String acyear=request.getParameter("ayear");
             Date FromDate = new SimpleDateFormat("yyyy-MM-dd").parse(from);
             Date ToDate = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            List<Date> date=new ArrayList<Date> ();
            List<String> mupn = new ArrayList<String> ();
             ArrayList<Date> dates = new ArrayList<Date>();
             
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(FromDate);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(ToDate);

        while(cal1.before(cal2) || cal1.equals(cal2))
        {
            dates.add(cal1.getTime());
            cal1.add(Calendar.DATE, 1);
        }
      ArrayList<MUResponse> m=MUResponse.fetchby(acyear);
      
       for(int i=0;i<dates.size();i++){
           
                         %>
                         <tr>
                             <td><%=new SimpleDateFormat("dd-MM-yyyy").format(dates.get(i))%></td>
                <%
                       if(dates.get(i).before(ToDate) || dates.get(i).equals(ToDate)){
                for(MUResponse m1:m){
                    PreparedStatement stt=con.prepareStatement("select * from techprocess where mupno=? and status=0300");
                    stt.setString(1, m1.getRefno());
                    ResultSet rss=stt.executeQuery();
                    if(rss.next()){
                        String rollno=rss.getString("clientid");
                        if(Find.sdept(rollno)!=null){
                        Connection conn=new dbcon().getConnection(Find.sdept(rollno));
                        PreparedStatement st2=conn.prepareStatement("select * from student_personal where rollno=?");
                st2.setString(1, rollno);
                ResultSet rs2=st2.executeQuery();
                if(rs2.next()){
                    String batch=rs2.getString("batch");
                PreparedStatement st3=con.prepareStatement("select * from regulations where batch=?");
                st3.setString(1, batch);
                ResultSet rs3=st3.executeQuery();
                if (rs3.next()){
                    String status=rs3.getString("status");
                if(status.equals("I")){
                        String datess=rss.getString("time");
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count1++;
                        double amount=Double.parseDouble(rss.getString("txn_amount"));
                        sum1=sum1+amount;
                    }   
                    }
                else if(status.equals("II")){
                       String datess=rss.getString("time");
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count2++;
                        double amount=Double.parseDouble(rss.getString("txn_amount"));
                        sum2=sum2+amount;
                    }
                }
                else if(status.equals("III")){
                      String datess=rss.getString("time");
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count3++;
                       double amount=Double.parseDouble(rss.getString("txn_amount"));
                       sum3=sum3+amount;
                    }
                }
                else{
                      String datess=rss.getString("time");
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count4++;
                       double amount=Double.parseDouble(rss.getString("txn_amount"));
                       sum4=sum4+amount;
                    }
                }
                }
                }
                }
                    }
                   PreparedStatement st1=con.prepareStatement("select * from ibresponse where mup=? and status=?");
                    st1.setString(1, m1.getRefno());
                   st1.setString(2, "Y");
                    ResultSet rs1=st1.executeQuery();
                    if(rs1.next()){
                          //String rollno1=rs1.getString("rollno");
                          if(Find.sdept(rs1.getString("rollno"))!=null){
                          Connection connn=new dbcon().getConnection(Find.sdept(rs1.getString("rollno")));
                        PreparedStatement sttt=connn.prepareStatement("select * from student_personal where rollno=?");
                sttt.setString(1, rs1.getString("rollno"));
                ResultSet rs4=sttt.executeQuery();
                if(rs4.next()){
                    String batch=rs4.getString("batch");
                PreparedStatement st4=con.prepareStatement("select * from regulations where batch=?");
                st4.setString(1, batch);
                ResultSet rs5=st4.executeQuery();
                if (rs5.next()){
                    String status=rs5.getString("status");
                if(status.equals("I")){
               
                        if(!rs1.getString("journalno").equals("challan")){
                        String datess=rs1.getString("txndate");
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count5++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                        sum5=sum5+amount1;
                    }
                    }
                        else{
                        String datess=rs1.getString("txndate");
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count6++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum6=sum6+amount1;
                    }    
                        }
                    }
                else if(status.equals("II")){
               
                        if(!rs1.getString("journalno").equals("challan")){
                        String datess=rs1.getString("txndate");
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count7++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum7=sum7+amount1;
                    }
                    }
                        else{
                        String datess=rs1.getString("txndate");
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count8++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum8=sum8+amount1;
                    }    
                        }
                    }
                else if(status.equals("III")){
               
                        if(!rs1.getString("journalno").equals("challan")){
                        String datess=rs1.getString("txndate");
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count9++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum9=sum9+amount1;
                    }
                    }
                        else{
                        String datess=rs1.getString("txndate");
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count10++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum10=sum10+amount1;
                    }    
                        }
                    }
               else{
               
                        if(!rs1.getString("journalno").equals("challan")){
                        String datess=rs1.getString("txndate");
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count11++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum11=sum11+amount1;
                    }
                    }
                        else{
                        String datess=rs1.getString("txndate");
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count12++;
                       double amount1=Double.parseDouble(m1.getTotalamt());
                       sum12=sum12+amount1;
                    }    
                        }
                }
                }
            }
        }
    
                    }
                }
                        %>
                         <td><%=count1%></td><td><%=count5%></td><td><%=count6%>
            </td><td><%=count2%></td><td><%=count7%></td><td><%=count8%>
            </td><td><%=count3%></td><td><%=count9%></td><td><%=count10%>
            </td><td><%=count4%></td><td><%=count11%></td><td><%=count12%></td>
            </tr>
            <%
                  
                }
        count1=0;
        count2=0;
        count3=0;
        count4=0;
        count5=0;
        count6=0;
        count7=0;
        count8=0;
        count9=0;
        count10=0;
        count11=0;
        count12=0;
                }
              %>
              <tr><td>Total Amount</td><td><%=sum1%></td><td><%=sum5%></td><td><%=sum6%>
            </td><td><%=sum2%></td><td><%=sum7%></td><td><%=sum8%>
            </td><td><%=sum3%></td><td><%=sum9%></td><td><%=sum10%>
            </td><td><%=sum4%></td><td><%=sum11%></td><td><%=sum12%></td></tr>
    
       </center>
            </body>
</html>
