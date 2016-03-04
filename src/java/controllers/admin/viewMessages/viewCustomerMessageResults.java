package controllers.admin.viewMessages;

import classes.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class viewCustomerMessageResults extends HttpServlet {

    int messageid = 0;
    boolean inserted = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //create a customer
            Customer customer = new Customer();
            //get message id
            messageid = (Integer.parseInt(request.getParameter("formsubmit")));
            // method to update message flag
            inserted = customer.updateMessageFlag(messageid);

            //succeeded or not
            if (inserted) {
                out.println("<script type=\"text/javascript\">");
                out.println("location='admin/viewCustomerMessages.jsp';");
                out.println("</script>");
            } 

        } catch(Exception e){
            System.out.println("Error:"+e);
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
