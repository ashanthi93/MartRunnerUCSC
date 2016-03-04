package controllers.vendor.attendance;

import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmAttendanceThursday extends HttpServlet {

    Vendor vendor = new Vendor();
    int status;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            //Set vendorID by session
            vendor.setVendorID((String) session.getAttribute("vendorID"));

            if ("0".equals(request.getParameter("Confirmation"))) {
                status = 0;
            } else {
                status = 1;
            }

            //confim attendance status
            int i = vendor.confirmAttendance("TH", status);
            
            if (i == 1) {

                //success message if attendance update
                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Attendance Updated");
                session.setAttribute("successMsg", "Your attendance status changed succesfully!");
                response.sendRedirect("vendor/ConfirmThursdayVendorAttendence.jsp");
                
            } else {

                //Output error if changes didn't apply
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Attendance Update Fails");
                session.setAttribute("errorMsg", "Unable to update the attendance status.");
                response.sendRedirect("vendor/ConfirmThursdayVendorAttendence.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ConfirmAttendanceThursday.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ConfirmAttendanceThursday.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
