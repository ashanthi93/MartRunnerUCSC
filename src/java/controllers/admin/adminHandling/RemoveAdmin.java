package controllers.admin.adminHandling;

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

public class RemoveAdmin extends HttpServlet {

    SuperAdmin superAdmin = new SuperAdmin();               //Create SuperAdmin object to remove an admin
    String adminId;                                         //attribute to get removing admin's ID
    String adminEmail;                                      //attribute to get removing admin's email address

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            adminId = request.getParameter("adminID");          //set removing admin's ID

            adminEmail = superAdmin.removeAdmin(adminId);        //remove admin method called and return email address of removed admin

            if (!adminEmail.equals("")) {

                /* create email object  to send remove details to removed admin */
                Email email = new Email();
                boolean sent = email.sendRemoveDetailsToAdmin(adminEmail);

                if (sent) {                         //sucess message if admin removed from the database and email sent

                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Admin Removed Successfully");
                    session.setAttribute("successMsg", "Deactivation mail has sent to user");
                    response.sendRedirect("admin/removeAdmin.jsp");

                } else {                              //error message if admin removed from the database and email failed

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Email Sent Fails");
                    session.setAttribute("errorMsg", "Admin removed from the system but unable to send email !");
                    response.sendRedirect("admin/removeAdmin.jsp");

                }
            } else if (adminEmail.equals("1")) {              //error message if admin removed from the database and unable to retrieve email id

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Error");
                session.setAttribute("errorMsg", "Admin removed but unable to get email id from the database");
                response.sendRedirect("admin/removeAdmin.jsp");

            } else {                      //error message if admin was unable to remove from the database
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Admin Remove Fail");
                session.setAttribute("errorMsg", "Admin does not removed");
                response.sendRedirect("admin/removeAdmin.jsp");

            }
        } catch (SQLException e) {
            System.err.println("SQLError :" + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RemoveAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RemoveAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
