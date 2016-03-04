package controllers;

import classes.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResetPassword extends HttpServlet {

    User user = new User();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            //set  userID and password
            user.setUserID(request.getParameter("username"));
            user.setUserPwd(request.getParameter("password"));

            //change password method
            boolean reset = user.resetUserPwd();

            if (reset) {            //success message if password change
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your password has been reset. Now you can log into the system.');");
                out.println("location='index.jsp';");
                out.println("</script>");
            } else {                //error message if unable to change
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your password was unable to reset. Please try again.');");
                out.println("location='login/forgotPassword.jsp';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
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
