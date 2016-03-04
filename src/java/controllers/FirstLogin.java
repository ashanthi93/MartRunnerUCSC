package controllers;

import classes.User;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FirstLogin extends HttpServlet {

    User user = new User();

    String newPassword;
    long lastLogon;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();
            
            //get userID, password and new password
            user.setUserID(request.getParameter("username"));
            user.setUserPwd(request.getParameter("password"));
            newPassword = request.getParameter("newPassword");

            //call firstLogin method and return
            int log = user.firstLogin(newPassword);

            if (log == 2) {             //check valid login and check password is updated

                //get last logon time
                lastLogon = System.currentTimeMillis();

                //set session attributes
                session.setAttribute("User", user.getUserFirstname());
                session.setAttribute("ID", user.getUserID());
                session.setAttribute("privilage", user.getUserPrivilage());

                //change last logon time
                user.setLastLogon(lastLogon);

                //check change happens or not
                if (user.changeLastLogon()) {
                    if (user.getUserPrivilage() == 1) {
                        //if admin
                        response.sendRedirect("admin/adminHomePage.jsp");
                    } else {
                        //if vendor
                        Vendor vendor = new Vendor();
                        vendor.setUserID(user.getUserID());
                        vendor.setVendorID(vendor.getIDByUserID());
                        session.setAttribute("vendorID", vendor.getVendorID());
                        response.sendRedirect("vendor/vendorHomePage.jsp");
                    }
                } else {              //error message if unable to change last logon time

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Logon Change Fails");
                    session.setAttribute("errorMsg", "Unable to reset your last logon time!");

                    if (user.getUserPrivilage() == 1) {
                        response.sendRedirect("admin/adminHomePage.jsp");
                    } else {
                        Vendor vendor = new Vendor();
                        vendor.setUserID(user.getUserID());
                        vendor.setVendorID(vendor.getIDByUserID());
                        session.setAttribute("vendorID", vendor.getVendorID());
                        response.sendRedirect("vendor/vendorHomePage.jsp");
                    }
                }
            } else if (log == 1) {              //error message if unable to reset password
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Password Reset Fails");
                session.setAttribute("errorMsg", "Unable to reset your new password");
                response.sendRedirect("login/firstLogin.jsp");
                
            } else {                //error message if invlid login
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Login");
                session.setAttribute("errorMsg", "Your username or password is incorrect. Please login again.");
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (IOException e) {
            System.err.println("IOException : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FirstLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FirstLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
