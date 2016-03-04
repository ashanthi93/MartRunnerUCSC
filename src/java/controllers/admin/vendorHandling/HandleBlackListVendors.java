package controllers.admin.vendorHandling;

import classes.Admin;
import classes.BlacklistVendors;
import emails.Email;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HandleBlackListVendors extends HttpServlet {

    String btnAction;                   //attribute to check btn action
    BlacklistVendors blackListVendor = new BlacklistVendors();              //create blacklist vendor object
    Admin admin = new Admin();                      //create admin object to call methods

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            HttpSession session = request.getSession();

            btnAction = request.getParameter("blackList");                      //get the btn action need to perform
            blackListVendor.setVendorID(request.getParameter("blackListVendorName"));           //set vendorID of selected blacklist vendor

            if (btnAction.equals("undoBlackList")) {                      //following code will execute if btn action is undo blacklist 

                int undo = admin.undoBlackListUser(blackListVendor);            //call method to remove vendor from blacklist and return removed or not

                if (undo == 1) {

                    blackListVendor.getUserIDByVendorID();
                    boolean getEmail = blackListVendor.getUserEmailID();                //get email address of vendor

                    if (getEmail) {
                        //send reactivated email to vendor
                        Email email = new Email();
                        boolean sendEmail = email.sendReactivatedDetailsToVendor(blackListVendor.getUserEmail());

                        if (sendEmail) {            //success message if email is sent and vendor removed

                            session.setAttribute("success", 1);
                            session.setAttribute("successHead", "Vendor Removed From Blacklist");
                            session.setAttribute("successMsg", "Activation email sent to user.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");

                        } else {                    //error message if email failed but vendor removed

                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Email Sent Fails");
                            session.setAttribute("errorMsg", "Vendor removed from the Blacklist but unable to send activation mail.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                        }
                    } else {                        //success message if vendor removed but vendor doesn't have a email address

                        session.setAttribute("success", 1);
                        session.setAttribute("successHead", "Vendor Removed From Blacklist");
                        session.setAttribute("successMsg", "Local language vendor removed from blacklist !");
                        response.sendRedirect("admin/removeVendorProfile_Admin.jsp");

                    }
                } else {                        //error message if unable to remove vendor from blacklist

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Vendor Reactivation Fails");
                    session.setAttribute("errorMsg", "Unable to remove vendor from blacklist.");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                }
                
            } else if (btnAction.equals("hidden")) {                       //following code will execute if btn action is hidden
                
                boolean change = admin.changeToHiddenVendor(blackListVendor);           //call method to move the blacklist user to hidden list

                if (change) {
                    
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Vendor Moved To Hidden List");
                    session.setAttribute("successMsg", "Vendor move to hidden list from blacklist.");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                    
                } else {
                    
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Unable To Move Vendor");
                    session.setAttribute("errorMsg", "Unable to move vendor from blacklist to hidden list.");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                }
                
            } else if (btnAction.equals("view")) {                         //following code will execute if btn action is view
                
                boolean view = admin.getBlacklistVendorDetails(blackListVendor);        //call method to get blacklist vendor details         
                
                if (view) {
                    
                    session.removeAttribute("HiddenVendor");
                    session.setAttribute("BlackListVendor", blackListVendor);
                    response.sendRedirect("admin/vendorRemoveDetails.jsp");
                    
                } else {
                    
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Unable To View Details");
                    session.setAttribute("errorMsg", "Unable to view blacklisted details !");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");

                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException: " + e);
        } catch (IOException e) {
            System.err.println("IOException: " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
