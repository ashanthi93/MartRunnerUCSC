package controllers;

import classes.User;
import emails.Email;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ForgotPassword extends HttpServlet {

    User user = new User();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();

            //set user id
            user.setUserID(request.getParameter("username"));

            //check valid user
            int valid = user.checkUser();

            if (valid == 1) {

                Email email = new Email();

                //send email to reset password
                if (email.sendPasswordResetDeatils(user.getUserEmail())) {
                    
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Password Reset");
                    session.setAttribute("successMsg", "Email sent to your email address. Please use it to reset your password");
                    response.sendRedirect("index.jsp");
                    
                } else {          //error message if unable to send email

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Email Fails");
                    session.setAttribute("errorMsg", "Unable to send email");
                    response.sendRedirect("login/forgotPassword.jsp");
                }

            } else if (valid == -1) {                //error message if user is hidden user

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Login Fails");
                session.setAttribute("errorMsg", "User is hide from the system");
                response.sendRedirect("index.jsp");

            } else {                      //error message if invalid user
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Login");
                session.setAttribute("errorMsg", "User is not an registered user");
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            System.out.println("SQLException : " + e);
        } catch (IOException e) {
            System.out.println("IOException : " + e);
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
