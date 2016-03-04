package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.LocalDate;

public class viewAttendancePeriodOfVendor extends HttpServlet {

    Vendor vendor = new Vendor();
    Admin admin = new Admin();

    List<LocalDate> thursdays = new ArrayList();            //date columns for thursdays
    List<LocalDate> saturdays = new ArrayList();            //date columns for saturday
    LocalDate start, end;
    String startDate, endDate;
    SimpleDateFormat Date = new SimpleDateFormat("yyyy-MM-dd");
    Date curDate = new Date();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            //set vendor id            
            vendor.setVendorID(request.getParameter("vendorName3"));
            vendor.setVendorName(vendor.getVendornameByVendorID());
            

            //get selected day
            String day = request.getParameter("marketDay3");

            /* set end and start dates according to selection */
            startDate = request.getParameter("startDate");
            Date startD = Date.parse(startDate);

            endDate = request.getParameter("endDate");
            Date endD = Date.parse(endDate);

            if (startD.after(curDate)) { //check start date is after current date

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "Cannot view attendance for future dates");
                response.sendRedirect("admin/reportViewAttendanceVendorTimePeriod.jsp");

            } else if (endD.after(curDate)) { //check end date is after current date

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "Cannot view attendance for future dates");
                response.sendRedirect("admin/reportViewAttendanceVendorTimePeriod.jsp");

            } else if (startD.after(endD)) { //check start date is after end date

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "End date is before start date");
                response.sendRedirect("admin/reportViewAttendanceVendorTimePeriod.jsp");

            } else {

                start = new LocalDate(Integer.parseInt(startDate.substring(0, 4)), Integer.parseInt(startDate.substring(5, 7)), Integer.parseInt(startDate.substring(8, 10)));
                end = new LocalDate(Integer.parseInt(endDate.substring(0, 4)), Integer.parseInt(endDate.substring(5, 7)), Integer.parseInt(endDate.substring(8, 10)));

                if (day.equals("TH")) {

                    if (admin.checkVendorBelongToMarket(day, vendor.getVendorID())) {

                        //get thursday dates of the time period and get attendance report
                        thursdays = admin.getThursdays(start, end);
                        admin.getFullYearAttendanceByName(day, thursdays, vendor);

                        session.setAttribute("dayList", thursdays);         //pass thursday date list

                        session.setAttribute("vendor", vendor);                     //pass vendor
                        session.setAttribute("day", day);
                        session.setAttribute("startDate", startDate);
                        session.setAttribute("endDate", endDate);

                        response.sendRedirect("admin/reports/attendancePeriodReport_Vendor.jsp");
                    } else {

                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Market Day");
                        session.setAttribute("errorMsg", "Vendor doesn't belong to Thursday Market!");
                        response.sendRedirect("admin/reportViewAttendanceVendorTimePeriod.jsp");
                    }

                } else {

                    if (admin.checkVendorBelongToMarket(day, vendor.getVendorID())) {

                        //get saturday dates of the time period and get attendance report
                        saturdays = admin.getSaturdays(start, end);
                        admin.getFullYearAttendanceByName(day, saturdays, vendor);

                        session.setAttribute("dayList", saturdays);         //pass saturday date list

                        session.setAttribute("vendor", vendor);                     //pass vendor
                        session.setAttribute("day", day);
                        session.setAttribute("startDate", startDate);
                        session.setAttribute("endDate", endDate);

                        response.sendRedirect("admin/reports/attendancePeriodReport_Vendor.jsp");
                        
                    } else {

                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Market Day");
                        session.setAttribute("errorMsg", "Vendor doesn't belong to Saturday Market!");
                        response.sendRedirect("admin/reportViewAttendanceVendorTimePeriod.jsp");

                    }
                }
            }
        } catch (NumberFormatException e) {
            System.err.println("NumberFormatException : " + e);
        } catch (IOException e) {
            System.err.println("IOException : " + e);
        } catch (SQLException ex) {
            Logger.getLogger(viewAttendancePeriodOfVendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(viewAttendancePeriodOfVendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(viewAttendancePeriodOfVendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
