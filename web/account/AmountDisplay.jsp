<%@page import="java.util.Map"%>
<%@page import="Fee.IBResponse"%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="Fee.TechProcessResponse"%>
<%@page import="Fee.TechProcess"%>
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
            int totalcount1=0,totalcount2=0,totalcount3=0,totalcount4=0,totalcount5=0,totalcount6=0,totalcount7=0,totalcount8=0,totalcount9=0,totalcount10=0,totalcount11=0,totalcount12=0;
            float sum1= 0,sum2=0,sum3=0,sum4=0,sum5=0,sum6=0,sum7=0,sum8=0,sum9=0,sum10=0,sum11=0,sum12=0;
            String from= (String) request.getParameter("from");
            String to= (String) request.getParameter("to");
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
      ArrayList<MUResponse> List = (ArrayList<MUResponse>) MUResponse.fetchby(acyear);
       for(int i=0;i<dates.size();i++){
           
                         %>
                         <tr>
                             <td><%=new SimpleDateFormat("dd-MM-yyyy").format(dates.get(i))%></td>
                <%
                    
                       if(dates.get(i).before(ToDate) || dates.get(i).equals(ToDate)){
                    List<TechProcessResponse> clist=TechProcessResponse.fetchby(List, from, to);
                    for(TechProcessResponse t1:clist){
                        String rollno=t1.getRollno();
                        Student s=Student.getById(rollno);
                        String batch=s.getBatch();
                        Batch b=Batch.getByBatch(batch);
                        String status=b.getStatus();
                        if(status.equals("I")){
                            String datess=t1.getTime();
                            String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count1=count1+1;
                        float amount=Float.parseFloat(t1.getAmount());
                        sum1=sum1+amount;
                        totalcount1++;
                    }   
                    }
                    else if(status.equals("II")){
                       String datess=t1.getTime();
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count2++;
                        float amount=Float.parseFloat(t1.getAmount());
                        sum2=sum2+amount;
                        totalcount2++;
                        }
                }
                else if(status.equals("III")){
                      String datess=t1.getTime();
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count3++;
                       float amount=Float.parseFloat(t1.getAmount());
                       sum3=sum3+amount;
                       totalcount3++;
                    }
                }
                else{
                      String datess=t1.getTime();
                        String[] t = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd-MM-yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                        count4++;
                       float amount=Float.parseFloat(t1.getAmount());
                       sum4=sum4+amount;
                       totalcount4++;
                    }
                }
                        float amount=0;
            }
                   for(Map.Entry<MUResponse,IBResponse> entry : IBResponse.fetchby(List, from, to).entrySet()){
                       MUResponse m2=entry.getKey();
                          IBResponse ib=entry.getValue();
                          String rollno1=ib.getRollno();
                          Student s1=Student.getById(rollno1);
                          String batchh=s1.getBatch();
                          Batch b1=Batch.getByBatch(batchh);
                          String status=b1.getStatus();
                    if(status.equals("I")){
               
                        if(!ib.getJournalno().equals("challan")){
                        String datess=ib.getTxndate();
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count5++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                        sum5=sum5+amount1;
                        totalcount5++;
                    }
                    }
                        else{
                        String datess=ib.getTxndate();
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count6++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum6=sum6+amount1;
                       totalcount6++;
                    }    
                        }
                    }
                else if(status.equals("II")){
               
                        if(!ib.getJournalno().equals("challan")){
                        String datess=ib.getTxndate();
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count7++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum7=sum7+amount1;
                       totalcount7++;
                    }
                    }
                        else{
                        String datess=ib.getTxndate();
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count8++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum8=sum8+amount1;
                       totalcount8++;
                    }    
                        }
                    }
                else if(status.equals("III")){
               
                        if(!ib.getJournalno().equals("challan")){
                        String datess=ib.getTxndate();
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count9++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum9=sum9+amount1;
                       totalcount9++;
                    }
                    }
                        else{
                        String datess=ib.getTxndate();
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count10++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum10=sum10+amount1;
                       totalcount10++;
                    }    
                        }
                    }
               else{
               
                        if(!ib.getJournalno().equals("challan")){
                        String datess=ib.getTxndate();
                        String[] t1 = datess.split(" ");
                        
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t1[0]);
                    if(time.equals(dates.get(i))){
                        count11++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum11=sum11+amount1;
                       totalcount11++;
                    }
                    }
                        else{
                        String datess=ib.getTxndate();
                        String[] t = datess.split(" ");
                    Date time = new SimpleDateFormat("dd/MM/yyyy").parse(t[0]);
                    if(time.equals(dates.get(i))){
                    
                        count12++;
                       float amount1=Float.parseFloat(m2.getTotalamt());
                       sum12=sum12+amount1;
                       totalcount12++;
                    }    
                }
            }
                    float amount1=0;
        }
    
                        %>
                         <td><%=count5%></td><td><%=count1%></td><td><%=count6%>
            </td><td><%=count7%></td><td><%=count2%></td><td><%=count8%>
            </td><td><%=count9%></td><td><%=count3%></td><td><%=count10%>
            </td><td><%=count11%></td><td><%=count4%></td><td><%=count12%></td>
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
              <tr><td>Total Count</td><td><%=totalcount5%></td><td><%=totalcount1%></td><td><%=totalcount6%>
            </td><td><%=totalcount7%></td><td><%=totalcount2%></td><td><%=totalcount8%>
            </td><td><%=totalcount9%></td><td><%=totalcount3%></td><td><%=totalcount10%>
            </td><td><%=totalcount11%></td><td><%=totalcount4%></td><td><%=totalcount12%></td></tr>
    
              <tr><td>Total Amount</td><td><%=sum5%></td><td><%=sum1%></td><td><%=sum6%>
            </td><td><%=sum7%></td><td><%=sum2%></td><td><%=sum8%>
            </td><td><%=sum9%></td><td><%=sum3%></td><td><%=sum10%>
            </td><td><%=sum11%></td><td><%=sum4%></td><td><%=sum12%></td></tr>
    
       </center>
            </body>
</html>
