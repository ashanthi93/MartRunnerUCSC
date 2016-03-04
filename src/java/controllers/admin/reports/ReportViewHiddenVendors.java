package controllers.admin.reports;

import classes.Admin;
import classes.HiddenVendors;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReportViewHiddenVendors extends HttpServlet {

    Admin admin = new Admin();
    List<HiddenVendors> results = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //start session
        HttpSession session = request.getSession();
        try {
            //method to get hidden vendors
            results = admin.loadHiddenVendors();

            if (results.isEmpty()) { // if there are no hidden vendors
                session.setAttribute("error",1);
                session.setAttribute("errorHead", "No Hidden Vendor");
                session.setAttribute("errorMsg", "No Hidden vendors in this moment!");
                response.sendRedirect("admin/adminHomePage.jsp");

            } else { // if there are hidden vendors
                //set session attributes
                session.setAttribute("vendorList", results);
                response.sendRedirect("admin/reports/hiddenVendors.jsp");
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
