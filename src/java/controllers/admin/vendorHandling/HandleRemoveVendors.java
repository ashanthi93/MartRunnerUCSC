package controllers.admin.vendorHandling;

import classes.Admin;
import classes.HiddenVendors;
import emails.Email;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HandleRemoveVendors extends HttpServlet {

    HiddenVendors hiddenVendor = new HiddenVendors();               //create hiddenVendor object
    Admin admin = new Admin();                  //create admin object to call the methods
    String btnAction;                           //attribute to check btn action

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            
            HttpSession session = request.getSession();
            
            btnAction = request.getParameter("hiddenList");                 //get the btn action need to perform
            
            hiddenVendor.setVendorID(request.getParameter("hiddenVendorName"));         //get and set the hidden vendor id
            
            if (btnAction.equals("unhide")) {                             //following code will execute if btn action is unhide
            
                int undo = admin.undoHiddenUser(hiddenVendor);              //call method to remove vendor from hidden list
                
                if (undo == 1) {

                    hiddenVendor.getUserIDByVendorID();
                    boolean getEmail = hiddenVendor.getUserEmailID();           //get email address of vendor
                    
                    if (getEmail) {

                        //send reactivated email to vendor
                        Email email = new Email();
                        boolean sendEmail = email.sendReactivatedDetailsToVendor(hiddenVendor.getUserEmail());

                        if (sendEmail) {            //success message if email is sent and vendor removed
                            
                            session.setAttribute("success", 1);
                            session.setAttribute("successHead", "Vendor Removed From Hidden list");
                            session.setAttribute("successMsg", "Activation email sent to user.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                            
                        } else {                    //error message if email failed but vendor removed
                            
                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Email Sent Fails");
                            session.setAttribute("errorMsg", "Vendor remove from the Hidden list but unable to send activation mail.");
                            response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                        }
                    } else {                        //success message if vendor removed but vendor doesn't have a email address
                        
                        session.setAttribute("success", 1);
                        session.setAttribute("successHead", "Vendor Removed From Hidden list");
                        session.setAttribute("successMsg", "Local language vendor removed from hidden list !");
                        response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                    }
                } else {                            //error msessgae if unable to remove the vendor
                    
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Vendor Reactivation Fails");
                    session.setAttribute("errorMsg", "Unable to remove vendor from hidden list.");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                }
                
            } else if (btnAction.equals("viewHide")) {                         //following code will execute if btn action is viewHide
                
                boolean view = admin.getHiddenVendorDetails(hiddenVendor);              //call method to get hidden vendor details
                
                if (view) {
                    
                    session.removeAttribute("BlackListVendor");
                    session.setAttribute("HiddenVendor", hiddenVendor);
                    response.sendRedirect("admin/vendorRemoveDetails.jsp");
                    
                } else {
                    
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Unable To View Details");
                    session.setAttribute("errorMsg", "Unable to view hidden details !");
                    response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
                }
            }
        } catch (SQLException e) {
            System.err.println("Exception : " + e);
        } catch (IOException e) {
            System.err.println("Exception : " + e);
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
