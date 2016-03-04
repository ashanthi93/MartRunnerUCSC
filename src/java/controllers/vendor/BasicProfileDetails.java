package controllers.vendor;

import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BasicProfileDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            
            //create vendor object
            Vendor vendor = new Vendor();           
            
            //set vendor attributes
            vendor.setUserID((String)session.getAttribute("ID"));
            vendor.setVendorID((String) session.getAttribute("vendorID"));
            vendor.setUserFirstname((String) session.getAttribute("User"));
            
            //get vendor details
            if(vendor.getProfileEditDetails()){
                
                //set session attributes to pass vendor object
                session.setAttribute("Vendor",vendor);
                response.sendRedirect("editProfile_Vendor.jsp");
                
            }else{          //Output error 
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "Unable to load profile details!");
                response.sendRedirect("vendor/vendorHomePage.jsp");
            }
        } catch(SQLException e){
            System.err.println("SQL Error : " + e);
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
