package controllers.vendor.viewMessages;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewMessageHistory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session=request.getSession();
            Admin admin=new Admin();
            Vendor vendor=new Vendor();
            
            String userId=(String)session.getAttribute("ID");
            vendor.setUserID(userId);
            String selectedVendor=vendor.getVendorIdByUserId();
            List<Vendor> vendorMessages=admin.viewAllVendorMessages(selectedVendor);
            
            session.setAttribute("vendorMessages", vendorMessages);
            
            response.sendRedirect("vendor/messageHistory.jsp");
            
        } finally {
           
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
