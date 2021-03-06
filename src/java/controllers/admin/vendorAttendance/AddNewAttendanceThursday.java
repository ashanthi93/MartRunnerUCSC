package controllers.admin.vendorAttendance;

import classes.Admin;
import java.io.IOException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddNewAttendanceThursday extends HttpServlet {

    Admin admin = new Admin();                      //create admin object to call methods

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            
            HttpSession session = request.getSession();
            
            //get new vendor ids selected
            String newVendorList[] = request.getParameterValues("newVendor");
            
            //call method to update new attendance
            boolean update = admin.addNewAttendanceThursday(newVendorList);
            
            //success message if attendance updated
            if (update) {
                
                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Attendance Updated");
                session.setAttribute("successMsg", "New attendance status updated !");
                response.sendRedirect("admin/confirmVendorAttendance_Thursday.jsp");

            } else {        //error message if fails
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Attendance Update Fail");
                session.setAttribute("errorMsg", "Unable to update new attendance status !");
                response.sendRedirect("admin/confirmVendorAttendance_Thursday.jsp");
            }
        } catch (ParseException e) {
            System.err.println("Parse Exception : " + e);
        } catch (IOException e) {
            System.err.println("IO Exception : " + e);
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
