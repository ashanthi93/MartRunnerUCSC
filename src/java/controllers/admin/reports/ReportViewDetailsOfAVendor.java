package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReportViewDetailsOfAVendor extends HttpServlet {

    Vendor vendor = new Vendor();
    Admin admin = new Admin();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            //start session
            HttpSession session = request.getSession();
            //set vendor id
            vendor.setVendorID(request.getParameter("vendorName"));
            //method to get vendor details
            boolean load = admin.getProfileDetailsVendor(vendor);
            
            
            if(load){ //if vendor is in the database
                //set session attributes
                session.setAttribute("vendor", vendor);
                //redirect to jsp
                response.sendRedirect("admin/reports/viewDetailsOfAVendor.jsp");
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
