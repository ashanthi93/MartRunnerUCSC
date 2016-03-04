package controllers;

import classes.SuperAdmin;
import classes.User;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    String firstName;
    int privilage, logged;
    long lastLogon, lastUserLogon;

    /* Create new user*/
    User user = new User();

    /* Create a new vendor - if user is a vendor */
    Vendor vendor = new Vendor();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            /* set userID and password from the input fields*/
            user.setUserID(request.getParameter("username"));
            user.setUserPwd(request.getParameter("password"));

            //call login method
            logged = user.loginUser();

            //get variable values
            privilage = user.getUserPrivilage();
            firstName = user.getUserFirstname();
            lastUserLogon = user.getLastLogon();

            //get current time of login
            lastLogon = System.currentTimeMillis();

            HttpSession session = request.getSession();

            if (logged == 1) {          //check valid user
                if (privilage == 1) {               //check user privilage
                    if (lastLogon > lastUserLogon) {                //check logon time

                        //set session attributes
                        session.setAttribute("User", user.getUserFirstname());
                        session.setAttribute("ID", user.getUserID());
                        session.setAttribute("privilage", user.getUserPrivilage());

                        //change logon time
                        user.setLastLogon(lastLogon);
                        if (user.changeLastLogon()) {

                            //this method is only for super admin to update the attendance table
                            if (user.getUserID().equals("u10001")) {
                                Calendar calendar = Calendar.getInstance();

                                int currentMonth = calendar.get(Calendar.MONTH);
                                //int currentMonth = 9;
                                int nextYear =calendar.get(Calendar.YEAR) + 1;
                                //int nextYear = 2016;
                                if (currentMonth >= 9) {
                                    SuperAdmin superAdmin = new SuperAdmin();
                                    superAdmin.setUserID(user.getUserID());

                                    boolean update = superAdmin.checkAttendanceUpdate(nextYear);

                                    if (update) {
                                        session.setAttribute("updateDatabase", 0);
                                    } else {
                                        session.setAttribute("updateDatabase", 1);
                                    }
                                } else {
                                    session.setAttribute("updateDatabase", 0);
                                }
                            } else {
                                session.setAttribute("updateDatabase", 0);
                            }
                            response.sendRedirect("admin/adminHomePage.jsp");
                        } else {

                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Login Fails ");
                            session.setAttribute("errorMsg", "Error Occurs. Please login");
                            response.sendRedirect("login/errorLogin.jsp");
                        }
                    } else {            //error message if session is expired

                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Login");
                        session.setAttribute("errorMsg", "Session has expired. Please Login");
                        response.sendRedirect("index.jsp");

                    }
                } else if (privilage == 2) {            //if user is vendor
                    if (lastLogon > lastUserLogon) {            //check last logon time

                        //set session attributes
                        session.setAttribute("User", user.getUserFirstname());
                        session.setAttribute("ID", user.getUserID());
                        session.setAttribute("privilage", user.getUserPrivilage());

                        //change last logon time
                        user.setLastLogon(lastLogon);

                        if (user.changeLastLogon()) {
                            vendor.setUserID(user.getUserID());
                            vendor.setVendorID(vendor.getIDByUserID());
                            session.setAttribute("vendorID", vendor.getVendorID());

                            response.sendRedirect("vendor/vendorHomePage.jsp");
                        } else {                //error message if unable to change last logon time

                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Login Fails");
                            session.setAttribute("errorMsg", "Error Occurs. Please login");
                            response.sendRedirect("login/errorLogin.jsp");
                        }
                    } else {                //session expired error message

                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Login");
                        session.setAttribute("errorMsg", "Session has expired. Please Login");
                        response.sendRedirect("index.jsp");
                    }
                }
            } else {                    //invalid login error message

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Login");
                session.setAttribute("errorMsg", "Username or password is incorrect");
                response.sendRedirect("login/errorLogin.jsp");
            }
        } catch (SQLException e) {
            out.println(e);
        } catch (IOException e) {
            out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
