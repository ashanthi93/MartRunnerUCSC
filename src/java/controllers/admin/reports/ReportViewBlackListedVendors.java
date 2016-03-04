package controllers.admin.reports;

import classes.Admin;
import classes.BlacklistVendors;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReportViewBlackListedVendors extends HttpServlet {
     Admin admin = new Admin();
     
    List<BlacklistVendors> results = new  ArrayList();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

       //start session
        HttpSession session = request.getSession();

        try {
             // method to load black listed vendors
             results = admin.loadBlackListVendors();
             
            
            if (results.isEmpty()){ // if there are no black listed vendors
                session.setAttribute("error",1);
                session.setAttribute("errorHead", "No Blacklist Vendor");
                session.setAttribute("errorMsg", "No Blacklisted vendors in this moment!");
                response.sendRedirect("admin/adminHomePage.jsp");
                
            }else{
                //set session attributes
                session.setAttribute("vendorList", results);
                //redirect to jsp
                response.sendRedirect("admin/reports/blackListedVendors.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewBlackListedVendors.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewBlackListedVendors.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
