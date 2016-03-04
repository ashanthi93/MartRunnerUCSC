package controllers.admin.viewMessages;

import classes.Admin;
import classes.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadAllFeedbacks extends HttpServlet {

    List<Customer> messagelist = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //start session
            HttpSession session = request.getSession();
            //create admin object
            Admin admin = new Admin();

            //method to load all customer feedbacks
            messagelist = admin.viewAllCustomerFeedbacks();

            //set session attributes
            session.setAttribute("messagelist", messagelist);
            

        } catch (Exception e) {
            System.out.println("SQL Exception:" + e);
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
