package controllers.admin.vendorHandling;

import classes.Admin;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveDetails_Vendor extends HttpServlet {

    Admin admin = new Admin();                      //create admin object to call methods to load vendor list

    List VendorList, BlackListVendors, HiddenVendors;           //array lists to load seperate vendor lists

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();

            //load vendor list
            VendorList = admin.loadVendors();               
            
            //load blacklist vendor list
            BlackListVendors = admin.loadBlackListVendors();
            
            //load hidden vendor list
            HiddenVendors = admin.loadHiddenVendors();

            if (!(VendorList.isEmpty())) {
                session.setAttribute("VendorList", VendorList);                     //set attribute to pass vendor list
                session.setAttribute("BlackListVendors", BlackListVendors);         //set attribute to pass blacklist vendor list
                session.setAttribute("HiddenVendors", HiddenVendors);               //set attribute to pass hidden vendor list
                
                response.sendRedirect("admin/removeVendorProfile_Admin.jsp");
            }else {         //error message if there are no active vendors
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "There are no vendors to load");
                response.sendRedirect("admin/adminHomePage.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQLError :" + e);
        } catch (IOException e) {
            System.err.println("IOError :" + e);
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
