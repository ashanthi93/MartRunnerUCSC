/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import classes.Vendor;
import emails.Email;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class ApproveProductRequests_Vendor extends HttpServlet {

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
        HttpSession session = request.getSession();
        
        try{
        boolean mailSent = false;
        String vendorEmailId = "";

        //retrieving request id, when the approve button is clicked
        String approveVal = request.getParameter("formsubmit");

        //retrieving request id, when the reject button is clicked
        String rejectVal = request.getParameter("formsubmitReject");

        //boolean variable isApproved is used to check whether the product request has approved.
        boolean isApproved = false;

        //boolean variable isRejected is used to check whether the product request has rejected.
        boolean isRejected = false;

        Vendor vendor = new Vendor();
        
        /* create new email object to send */
        Email email = new Email();

        //When the reject button is clicked, approveVal becomes null
        if (approveVal == null) {

            //Setting request ID
            vendor.setRequestId(Integer.parseInt(rejectVal));

            //Setting vendor Id
            vendor.setVendorID(vendor.getVendorIdByRequestId());

            //Setting products
            vendor.setProducts(vendor.getProductNameByRequestId());
            
             //retreiving vendor email ID from the product request ID
            vendorEmailId = vendor.getEmailByProductRequestId();

            //Rejecting product request. Here flag will be updated to -1
            isRejected = vendor.rejectProductRequest();

            //alert for a sucessful product rejection
            if (isRejected) {

                // Sending notification email to the vendor saying product has been rejected
                mailSent = email.sendProductRejectionMailToVendor(vendorEmailId);

                if (mailSent) {
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Send Successful");
                    session.setAttribute("successMsg", "Notification Email sent to vendor!");
                    response.sendRedirect("admin/adminHomePage.jsp");

                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Sending Failed");
                    session.setAttribute("errorMsg", "Notification email sending failed! Please check your Internet connection.");
                    response.sendRedirect("admin/adminHomePage.jsp");

                }

                //alert for failed product rejection
            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Rejection Failed");
                session.setAttribute("errorMsg", "Product request rejection failed!");
                response.sendRedirect("admin/viewProductRequests.jsp");

            }

            //When the approve button is clicked, rejectVal becomes null
        } else if (rejectVal == null) {
            //Setting request ID
            vendor.setRequestId(Integer.parseInt(approveVal));

            //Setting vendor Id
            vendor.setVendorID(vendor.getVendorIdByRequestId());

            //Setting products
            vendor.setProducts(vendor.getProductNameByRequestId());

            //Approving product request. Here flag will be updated to 1
            isApproved = vendor.approveProductRequest();
            
            //retreiving vendor email ID from the product request ID
            vendorEmailId = vendor.getEmailByProductRequestId();

            //alert for a sucessful product approval
            if (isApproved) {
                
                 // Sending notification email to the vendor saying product has been approved
                mailSent = email.sendProductApprovalMailToVendor(vendorEmailId);

                if (mailSent) {
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Send Successful");
                    session.setAttribute("successMsg", "Notification Email sent to vendor!");
                    response.sendRedirect("admin/adminHomePage.jsp");

                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Sending Failed");
                    session.setAttribute("errorMsg", "Notification email sending failed! Please check your Internet connection.");
                    response.sendRedirect("admin/adminHomePage.jsp");

                }

                //alert for a failed product approval
            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Approval Failed");
                session.setAttribute("errorMsg", "Product request approval failed!");
                response.sendRedirect("admin/viewProductRequests.jsp");

            }
        }
        }catch(NumberFormatException e){
            System.err.println("Exception : " + e);
        } catch (IOException e) {
            System.err.println("Exception : " + e);
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
