package controllers.admin.vendorHandling;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadVendorDetails extends HttpServlet {

    Vendor vendor = new Vendor();           //create new vendor object
    Admin admin = new Admin();              //create new admin object to call methods
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            vendor.setVendorID(request.getParameter("vendorName"));                 //set vendorId
            
            boolean load = admin.getProfileDetailsVendor(vendor);               //get vendor profile details
            
            HttpSession session = request.getSession();
            
            if(load){
                //pass vendor object to jsp page
                session.setAttribute("vendor", vendor);
                response.sendRedirect("admin/editVendorProfile.jsp");
                
            }else{          //error message if load fails
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "Unable to load vendor details !");
                response.sendRedirect("admin/updateVendorProfile_Admin.jsp");
            }            
        } catch(SQLException e){
            System.err.println("SQLError : " + e);
        } catch (IOException e) {
            System.err.println("IOError : " + e);
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
