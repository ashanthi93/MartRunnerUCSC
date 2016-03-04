/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.vendor;

import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class AddProducts extends HttpServlet {

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
            boolean isAdded = false;
            String productName = request.getParameter("productName"); //retriving entered product name
            String description = request.getParameter("description"); //retriving entered product description
            HttpSession session = request.getSession();

            String userId = (String) session.getAttribute("ID"); //retriving current user

            Vendor vendor = new Vendor();
            vendor.setUserID(userId);
            String vendorId = vendor.getIDByUserID(); //retriving current vendor ID by user ID

            int flag = 0; //Flag is 0 for the new product requests

            //retriving request sent time
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String requestTime = dateFormat.format(cal.getTime());

            //setting product name, description,flag and request sent time to the vendor
            vendor.setProducts(productName);
            vendor.setDescription(description);
            vendor.setFlag(flag);
            vendor.setMessageTime(requestTime);

            //Sending new product request to the admin. True will be returned if the request sent successfully.
            isAdded = vendor.sendProductRequest();

            //Alert for the successful request to the admin
            if (isAdded) {

                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Success!!!");
                session.setAttribute("successMsg", "Request sent successfully");
                response.sendRedirect("vendor/addProducts.jsp");
                /*out.println("<script type=\"text/javascript\">");
                 out.println("alert('Request sent successfully');");
                 out.println("location='vendor/addProducts.jsp';");
                 out.println("</script>");*/

                //Alert for the unsuccessful request to the admin
            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Error!!!");
                session.setAttribute("errorMsg", "Request sending failed");
                response.sendRedirect("vendor/addProducts.jsp");
                /*out.println("<script type=\"text/javascript\">");
                 out.println("alert('Request sending failed');");
                 out.println("location='vendor/addProducts.jsp';");
                 out.println("</script>");*/
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddProducts.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

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
        processRequest(request, response);
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
        processRequest(request, response);
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
