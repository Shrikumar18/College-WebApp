/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author irshed
 */
public class receiveInnotymResponse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet receiveInnotymResponse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receiveInnotymResponse at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //    processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            MUResponse mu = (MUResponse) request.getSession().getAttribute("MUResponse");
            Innotym iy = (Innotym) request.getSession().getAttribute("ITRequest");

            String responsejson = request.getParameter("responsejson");
            String timeoutresponsejson = request.getParameter("timeoutresponsejson");
            System.out.println(responsejson);
            if (responsejson != null || !responsejson.equals("")) {

                JSONParser parser = new JSONParser();
                JSONObject json = (JSONObject) parser.parse(responsejson);

                String merchantId = json.get("merchantId").toString();
                String merchantTrackID = json.get("merchantTrackID").toString();
                String response_message = json.get("response_message").toString();
                String Paymentoption = json.get("Paymentoption").toString();
                String transactionAmount = json.get("transactionAmount").toString();
                String bank_reference_number = json.get("bank_reference_number").toString();
                String redirectHash = json.get("redirectHash").toString();
                String status = json.get("status").toString();

                InnotymResponse ir = new InnotymResponse();
                ir.setRollno(iy.getFirstName());
                ir.setMupno(iy.getTrackId());
                ir.setBankRefno(bank_reference_number);
                ir.setHash(redirectHash);
                ir.setMerId(merchantId);
                ir.setResponseMsg(response_message);
                ir.setPaymentOption(Paymentoption);
                ir.setTxn_amt(transactionAmount);
                ir.setStatus(status);
                ir.setTrackId(merchantTrackID);
                Date d = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                ir.setTime(sdf.format(d));

                String hashString = "" + merchantTrackID + "|" + Paymentoption + "|" + transactionAmount + "|" + status + "|" + response_message + "";
                MessageDigest m = MessageDigest.getInstance("SHA-512");
                byte[] data = hashString.getBytes();
                m.update(data, 0, data.length);
                BigInteger i = new BigInteger(1, m.digest());
                String hash = String.format("%1$032X", i);
                System.out.println("hash" + hash.length());
                if (hash.length() == 127) {
                    hash = "0" + hash;
                }
                
                if (status.equalsIgnoreCase("SUCCESS")) {
                    if (redirectHash.equalsIgnoreCase(hash)) {
                        boolean flag = ir.insert();
                        if (flag && ir.getStatus().equals("SUCCESS")) {
                            request.setAttribute("paid", "Y");
                            request.getRequestDispatcher("/student/Challan.jsp").forward(request, response);
                        }
                    } else {
                        response.getWriter().print("<h1>ERROR: Transaction Failed  Due to Hash MisMatch</h1>");
                    }
                } else if (status.equalsIgnoreCase("CANCELLED")) {
                    if (redirectHash.equals(hash)) {
                        boolean flag = ir.insert();
                        if (flag) {
                            response.getWriter().print("<h1>ERROR: Transaction Cancelled</h1>");
                        }
                    } else {
                        response.getWriter().print("<h1>ERROR: Transaction Cancelled - Hash Mismatch</h1> ");
                    }
                } 
            }
            if(timeoutresponsejson!=null)
            {
                JSONParser parser = new JSONParser();
                JSONObject json = (JSONObject) parser.parse(timeoutresponsejson);
                if(json.get("status").toString().equalsIgnoreCase("timeout"))
                {
                    response.getWriter().print("<h1>ERROR: Transaction timed out. Please try again!</h1>");
                }
            }

        } catch (ParseException ex) {
            Logger.getLogger(receiveInnotymResponse.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(receiveInnotymResponse.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
