package controllers.admin.reports;

import classes.Admin;
import classes.Payment;
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

public class ReportViewPaidVendorsForNextMarketDays extends HttpServlet {

    List<Payment> results = new ArrayList();
    String marketday;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            //start session
            HttpSession session = request.getSession();

            //create admin
            Admin admin = new Admin();

            //get market day
            marketday = request.getParameter("marketDay");

            //method for get paid vendors for next market days
            results = admin.viewPaidVendorsForNextMarketDays(marketday);

            if (results.isEmpty()) { // if no vendors have paid for next market days
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "No vendors have paid for next market days!");
                response.sendRedirect("admin/reportViewAttendanceVendorByDate.jsp");
                
            } else {
                //set session attributes
                session.setAttribute("vendorList", results);
                session.setAttribute("day", marketday);
                //redirect to jsp
                response.sendRedirect("admin/reports/viewPaidVendorsForNextMarketDays.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (IOException e) {
            System.err.println("IOException : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewPaidVendorsForNextMarketDays.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewPaidVendorsForNextMarketDays.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
