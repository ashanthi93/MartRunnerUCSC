package controllers.customer;

import classes.Customer;
import controllers.vendor.ContactAdministrator;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContactVendor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //start session
            HttpSession session = request.getSession();
            //get customer name
            String customerName = request.getParameter("customerName");
            // get contact number
            String contact = request.getParameter("contact");
            //get e mail 
            String email = request.getParameter("email");
            // get message
            String message = request.getParameter("message");

            //set flag to 0
            int flag = 0;
            // get message time
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String messageTime = dateFormat.format(cal.getTime());

            //get vendor id
            String vendorID = (String) session.getAttribute("selectedVendorId");

            //set attributes of customer object
            Customer customer = new Customer(customerName, email, contact, message, messageTime, flag);
            //method to save message in db
            boolean isSend = customer.sendMessageToVendor(vendorID);

            if (isSend) { // if succussfully added

                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Message Sent !");
                session.setAttribute("successMsg", "Message sent successfully");
                response.sendRedirect("customer/contactVendor.jsp");
                

            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Sending Failed !");
                session.setAttribute("errorMsg", "Message sending failed");
                response.sendRedirect("customer/contactVendor.jsp");

               
            }

        } catch (Exception e) {
            System.err.println(e);

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
