package controllers.customer;

import classes.Customer;
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


public class feedbackCustomer extends HttpServlet {
    boolean inserted=false;
            
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            
            //create customer object
            Customer customer = new Customer();
           
            customer.setCustomername(request.getParameter("Name"));
           
            customer.setCustomeremail(request.getParameter("email"));
            
            customer.setContactno(request.getParameter("mobileNumber"));
            
            customer.setFeedback(request.getParameter("feedback"));
            //method to save customer message in db
            inserted=customer.addMessageCustomer();
            
            //succeeded or not
            if (inserted) {
                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Message Sent");
                session.setAttribute("successMsg", "Thank You for your feeedback!");
                response.sendRedirect("customer/contactUs.jsp");
            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Message Fails");
                session.setAttribute("errorMsg", "Unable to send the message!");
                response.sendRedirect("customer/contactUs.jsp");
            }
        } catch(Exception e){
            System.out.println("SQL Exception:"+e);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(feedbackCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(feedbackCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
