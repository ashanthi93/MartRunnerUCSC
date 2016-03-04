package controllers.admin.payment;

import classes.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class paymentGetVendors extends HttpServlet {
    Admin admin = new Admin();

    List vendorList;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         try {
             //start session
            HttpSession session = request.getSession();

            //method to load all vendors
            vendorList = admin.loadVendors();
            
            if (!vendorList.isEmpty()) { // if there are vendors in the table
                session.setAttribute("vendorList", vendorList);
            } else { // if there are no vendors in the table
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('There are no local language vendors!');");
                out.println("location='admin/adminHomePage.jsp';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            System.out.println("Error : " + e);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(paymentGetVendors.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(paymentGetVendors.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
