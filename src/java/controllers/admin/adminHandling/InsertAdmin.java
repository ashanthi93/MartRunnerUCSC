package controllers.admin.adminHandling;

import classes.Admin;
import classes.SuperAdmin;
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

public class InsertAdmin extends HttpServlet {

    boolean inserted = false;                                   //To find whether admin inserted into the database
    boolean mailSent;                                           //To find whether mail sent to the new admin
    SuperAdmin superAdmin = new SuperAdmin();                   //Create super admin object to create a new vendor

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {

            HttpSession session = request.getSession();

            /* Create new admin object*/
            Admin admin = new Admin();

            /* start of setting parameters to admin object*/
            admin.setUserFirstname(request.getParameter("firstName"));
            admin.setUserLastName(request.getParameter("lastName"));
            admin.setUserNIC(request.getParameter("nicNumber"));
            admin.setUserEmail(request.getParameter("email"));
            admin.setUserContactNo(request.getParameter("mobileNumber"));
            /* end of setting parameters to User object*/

            //Register admin and check wthether admin is inserted into the database
            inserted = superAdmin.registerAdmin(admin);

            if (inserted) {                     /* if admin is added to the database an email sent to the admin */

                /* create new email object to send */
                Email email = new Email();
                mailSent = email.sendLoginDetails(admin.getUserEmail(), admin.getUserID(), admin.getUserPwd());

                if (mailSent) {                             /* sucessfull message to the super admin if email sent and admin added to the system*/

                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Admin Added Successfully");
                    session.setAttribute("successMsg", "Activation mail has sent to user");
                    response.sendRedirect("admin/createNew_Admin.jsp");

                } else {                                    /* error message to the admin if email failed to sent and admin added to the system*/

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Email Sent Fails");
                    session.setAttribute("errorMsg", "New admin added to the system but unable to send email !");
                    response.sendRedirect("admin/createNew_Admin.jsp");

                }
            } else {            /* error message if admin is unable to insert into the database */

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Admin Added Fails");
                session.setAttribute("errorMsg", "Unable to add new admin into the system !");
                response.sendRedirect("admin/createNew_Admin.jsp");

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
            Logger.getLogger(InsertAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(InsertAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
