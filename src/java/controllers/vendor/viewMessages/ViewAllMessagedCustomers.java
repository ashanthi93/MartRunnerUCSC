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

public class ViewAllMessagedCustomers extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session=request.getSession();
            Vendor vendor=new Vendor();
            String vendorID = (String) session.getAttribute("vendorID");
            vendor.setVendorID(vendorID);
            List<Customer> messageList=vendor.viewAllMessagedCustomers();
            
            List<Customer> allCustomerMessageNameList=new ArrayList<Customer>();
            List<String> emailList=new ArrayList<String>();
             if(!(messageList.isEmpty())){
                for (Customer messageCustomer : messageList) {
                    Customer customer=new Customer();
                    customer.setCustomeremail(messageCustomer.getCustomeremail());
                    customer.setCustomername(messageCustomer.getCustomername());
                  
                    if(!(emailList.contains(customer.getCustomeremail()))){
                        allCustomerMessageNameList.add(customer);
                        emailList.add(messageCustomer.getCustomeremail());
                    }
                }
             }
            session.setAttribute("allCustomerMessageNameList",allCustomerMessageNameList );
        } finally {
           
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
