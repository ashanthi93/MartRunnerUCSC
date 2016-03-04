package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class viewAttendanceDayOfVendor extends HttpServlet {

    Admin admin = new Admin();                      //admin object to call method
    Vendor vendor = new Vendor();
    Date curDate = new Date();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            //set vendorID
            vendor.setVendorID(request.getParameter("vendorName2"));

            //get selected date
            String date = request.getParameter("date");

            //change date according to database column name
            String selectDate = date.substring(0, 4) + "_" + date.substring(5, 7) + "_" + date.substring(8, 10);

            //get selected marekt day
            String day = request.getParameter("marketDay2");

            SimpleDateFormat startDate = new SimpleDateFormat("yyyy-MM-dd");
            Date checkdate = startDate.parse(date);

            //check what day of week the selected is
            Calendar c = Calendar.getInstance();
            c.setTime(checkdate);
            int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);

            if (checkdate.after(curDate)) {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "Cannot view attendance for future dates");
                response.sendRedirect("admin/reportViewAttendanceVendorByDate.jsp");

            } else {
                //check vendor belongs to market
                if (admin.checkVendorBelongToMarket(day, vendor.getVendorID())) {

                    //check selected date is thursday or saturday
                    if (dayOfWeek == 5) {

                        //get dates of the time period and get attendance report
                        admin.getMarketDayAttendanceOfVendor(day, selectDate, vendor);
                        vendor.getVendornameByVendorID();

                        //set session attributes
                        session.setAttribute("day", day);
                        session.setAttribute("selectedDate", date);
                        session.setAttribute("vendor", vendor);

                        response.sendRedirect("admin/reports/attendanceOnDay_Vendor.jsp");

                    } else if (dayOfWeek == 7) {
                        //get dates of the time period and get attendance report
                        admin.getMarketDayAttendanceOfVendor(day, selectDate, vendor);
                        vendor.getVendornameByVendorID();

                        //set session attributes
                        session.setAttribute("day", day);
                        session.setAttribute("selectedDate", date);
                        session.setAttribute("vendor", vendor);

                        response.sendRedirect("admin/reports/attendanceOnDay_Vendor.jsp");

                    } else {

                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Date");
                        session.setAttribute("errorMsg", "Selected date is not a Thursday or Saturday !");
                        response.sendRedirect("admin/reportViewAttendanceVendorByDate.jsp");
                    }
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Date");
                    session.setAttribute("errorMsg", "Selected date is not a Thursday or Saturday !");
                    response.sendRedirect("admin/reportViewAttendanceVendorByDate.jsp");
                }

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
        } catch (ParseException ex) {
            Logger.getLogger(viewAttendanceDayOfVendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(viewAttendanceDayOfVendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
