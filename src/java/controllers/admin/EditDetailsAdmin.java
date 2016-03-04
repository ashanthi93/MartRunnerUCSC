package controllers.admin;

import classes.Admin;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditDetailsAdmin extends HttpServlet {

    Admin admin = new Admin();                  //create new admin object to call methods

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            
            HttpSession session = request.getSession();
            
            admin.setUserID((String) session.getAttribute("ID"));       //set userID
            
            admin.setUserFirstname((String) session.getAttribute("User"));  //set userFirstName     
            
            /* get profile details of admin */
            if ((admin.getProfileDetails())) {
                
                /* set session attribute to pass admin object */
                session.setAttribute("admin", admin);
                response.sendRedirect("editProfile_Admin.jsp");
                
            } else {        //Output error if fails

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "Unable to load profile details !");
                response.sendRedirect("admin/adminHomePage.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditDetailsAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditDetailsAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
