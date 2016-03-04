package controllers.admin.vendorHandling;

import classes.Admin;
import classes.BlacklistVendors;
import classes.HiddenVendors;
import emails.Email;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveVendors extends HttpServlet {

    Admin admin = new Admin();              /* Create admin object to call remove vendor method */


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            HttpSession session = request.getSession();

            String x = request.getParameter("removeMethod");        //get the method of removing

            if (x.equals("Blacklist")) {                        //execute following if remove method is blacklist

                //crete blacklist vendor object
                BlacklistVendors blacklistvendor = new BlacklistVendors();

                //set vendor attributes
                blacklistvendor.setVendorID(request.getParameter("removeVendor"));
                blacklistvendor.setBlackListReason(request.getParameter("reasonToRemove"));

                //call method to add to black list and get the return value
                int insertedBL = admin.insertBlackListUser(blacklistvendor);
                
                if (insertedBL == 1) {

                    //get email address of vendor
                    boolean getEmail = blacklistvendor.getUserEmailID();

                    if (getEmail) {

                        /* create email to send details to vendor about deactivating */
                        Email email = new Email();
                        boolean sendEmail = email.sendRemoveDetailsToVendor(blacklistvendor.getUserEmail(), "blackList");

                        if (sendEmail) {            //success messgae if vendor added to blacklist and email sent

                            session.setAttribute("success", 1);
                            session.setAttribute("successHead", "Vendor Added To Blacklist");
                            session.setAttribute("successMsg", "Deactivation email sent to user.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");

                        } else {                    //error message if unable to send mail

                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Email Sent Fails");
                            session.setAttribute("errorMsg", "Vendor added to the Black List but unable to send dectivation mail.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                        }
                    }
                } else {                            //error message if unable to add to blacklist

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Vendor Removal Fails ");
                    session.setAttribute("errorMsg", "Unable to add to  Black List !");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                }
            } else if (x.equals("Hidden")) {

                //create hiddenvendor Object
                HiddenVendors hiddenVendor = new HiddenVendors();

                //set attributes of hidden vendor object
                hiddenVendor.setVendorID(request.getParameter("removeVendor"));
                hiddenVendor.setHiddenReason(request.getParameter("reasonToRemove"));

                //call method to add to hidden list and get the return value
                int insertedH = admin.insertHiddenVendor(hiddenVendor);

                if (insertedH == 1) {               //success messgae if vendor added to hidden list

                    //get email address of vendor
                    boolean getEmail = hiddenVendor.getUserEmailID();

                    if (getEmail) {

                        /* create email to send details to vendor about deactivating */
                        Email email = new Email();
                        boolean sendEmail = email.sendRemoveDetailsToVendor(hiddenVendor.getUserEmail(), "hidden");

                        if (sendEmail) {            //success messgae if vendor added to blacklist and email sent
                            
                            session.setAttribute("success", 1);
                            session.setAttribute("successHead", "Vendor Added To Blacklist");
                            session.setAttribute("successMsg", "Deactivation email sent to user.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                            
                        } else {                        //error message if unable to send mail
                            
                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Email Sent Fails");
                            session.setAttribute("errorMsg", "Vendor added to the Hidden List but unable to send dectivation mail.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                        }
                    }
                } else {                            //error message if unable to add to hidden list

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Vendor Removal Fails ");
                    session.setAttribute("errorMsg", "Unable to add to Hidden List !");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                }
            }
        } catch (SQLException e) {
            System.out.println("SQLException : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RemoveVendors.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RemoveVendors.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
