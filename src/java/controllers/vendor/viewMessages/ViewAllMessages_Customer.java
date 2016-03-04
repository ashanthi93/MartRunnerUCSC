package controllers.vendor.viewMessages;

import classes.Customer;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ViewAllMessages_Customer extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<Customer> customerMessages=new ArrayList();
        try {
            HttpSession session=request.getSession();
            Vendor vendor=new Vendor();
            String vendorID = (String) session.getAttribute("vendorID");
            vendor.setVendorID(vendorID);
            String selectedCustomer=request.getParameter("param");
            customerMessages=vendor.viewAllCustomerMessages(selectedCustomer);
            
            session.setAttribute("customerMessages", customerMessages);
            
            response.sendRedirect("vendor/viewCustomerMessageHistory.jsp");
            
        } finally {
            System.out.println("size: "+customerMessages.size());
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
