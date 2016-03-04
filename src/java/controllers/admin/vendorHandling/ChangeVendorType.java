package controllers.admin.vendorHandling;

import classes.Admin;
import classes.Vendor;
import emails.Email;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeVendorType extends HttpServlet {

    Admin admin = new Admin();                          //create new admin to call the methds
    Vendor vendor = new Vendor();                       //create vendor object

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            HttpSession session = request.getSession();

            /* set vendor attributes */
            vendor.setVendorID(request.getParameter("localLVendorName"));
            vendor.setUserEmail(request.getParameter("email"));
            vendor.setUserID(vendor.getUserIDByVendorID());

            int change = admin.changeVendorType(vendor);                //call method to change vendortype

            //check update happens or not
            if (change == 1) {

                admin.getLLVendorPwd(vendor);                   //get password to send

                /* send email with login details to vendor */
                Email email = new Email();
                boolean mailSent = email.sendLoginDetails(vendor.getUserEmail(), vendor.getUserID(), vendor.getUserPwd());

                if (mailSent) {                     //success message if email sent and update happens

                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Vendor Type Change Successfully");
                    session.setAttribute("successMsg", "Activation email sent to user to log into account.");
                    response.sendRedirect("admin/updateVendorProfile_Admin.jsp");

                } else {                            //error message if update happens but email failed

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Email Sent Fails");
                    session.setAttribute("errorMsg", "Vendor type change but unable to send activation mail !");
                    response.sendRedirect("admin/updateVendorProfile_Admin.jsp");

                }
            } else {                        //error message if update fails

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Vendor Type Change Fails");
                session.setAttribute("errorMsg", "Unable to change vendor type !");
                response.sendRedirect("admin/updateVendorProfile_Admin.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQLError :" + e);
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
    }// </editor-fold>

}
