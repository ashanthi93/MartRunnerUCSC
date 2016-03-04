package controllers.admin.vendorHandling;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateDetails_Vendor extends HttpServlet {

    Admin admin = new Admin();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            //get local language vendor list
            List<Vendor> llVendorList = admin.getLocalLanguageVendorList();

            //get all vendors
            List<Vendor> vendorList = admin.loadVendors();

            if (!llVendorList.isEmpty() && !vendorList.isEmpty()) {             //redirect to page
                session.setAttribute("LLVendorList", llVendorList);
                session.setAttribute("vendorList", vendorList);
                response.sendRedirect("admin/updateVendorProfile_Admin.jsp");
                
            } else {                //error meesage if there are no local language vendors

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "There are no vendors to load");
                response.sendRedirect("admin/adminHomePage.jsp");
            }
        } catch (SQLException e) {
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
    }// </editor-fold>

}
