package controllers.customer;

import classes.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VisitShop_Vendor extends HttpServlet {
    
    Customer customer = new Customer();
    List resultList;

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();

            resultList = customer.getMarketVendorList();

            
            
            if (!resultList.isEmpty()) {
                session.setAttribute("Mak", resultList);
                
                response.sendRedirect("customer/visitShop.jsp");
                
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('There are no local language vendors!');");
                out.println("location='admin/adminHomePage.jsp';");
                out.println("</script>");
            }
            
            
        }catch(Exception e){
            System.out.println("Error : " + e);
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
