package controllers.admin.vendorAttendance;

import classes.Admin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaturdayAttendanceConfirmation extends HttpServlet {

    Admin admin = new Admin();                  //create admin object to call methods

    String[] attendVendorList;                  //array to hold vendorIDs

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            HttpSession session = request.getSession();
            
            //getVendorIDs
            attendVendorList = request.getParameterValues("notAttendVendor");

            //update attendance and payment tables
            int change = admin.setVendorAttendanceSaturday(attendVendorList);

            //success message if attendance updated
            if (change == 1) {

                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Attendance Updated");
                session.setAttribute("successMsg", "Changes applied successfully.");
                response.sendRedirect("admin/confirmVendorAttendance_Saturday.jsp");

            } else {        //error message if fails
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Attendance Update Fail");
                session.setAttribute("errorMsg", "Unable to update new attendance status!");
                response.sendRedirect("admin/confirmVendorAttendance_Saturday.jsp");

            }
        } catch (Exception e) {
            System.err.println("Exception :" + e);
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
