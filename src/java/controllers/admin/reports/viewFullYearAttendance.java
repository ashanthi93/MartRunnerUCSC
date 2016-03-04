package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.LocalDate;

public class viewFullYearAttendance extends HttpServlet {

    Admin admin = new Admin();
    List<Vendor> attendanceListTh = new ArrayList();                //vendor list for thursday
    List<Vendor> attendanceListSa = new ArrayList();                //vendor list for saturday    
    List<LocalDate> thursdays = new ArrayList();                    //date columns for thursdays
    List<LocalDate> saturdays = new ArrayList();                    //date columns for saturdays
    LocalDate start, end;                                           //attendance checking period

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();

            String day = request.getParameter("marketDay");             //check selected market days  
            String year = request.getParameter("year");                  //check selected year is current or past

            Calendar calendar = Calendar.getInstance();
            calendar.getTime();

            /* set end and start according to year */
            if (year.equals("current")) {
                end = new LocalDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH));
                start = new LocalDate(calendar.get(Calendar.YEAR), 1, 1);

                //set year attribute
                session.setAttribute("year", calendar.get(Calendar.YEAR));
                
            } else {
                end = new LocalDate(calendar.get(Calendar.YEAR), 1, 1);
                start = new LocalDate(calendar.get(Calendar.YEAR)-1, 1, 1);
                
                //set year attribute
                session.setAttribute("year", calendar.get(Calendar.YEAR)-1);
            }

            if (day.equals("TH")) {
                
                //get thursday dates of the time period and get attendance report
                thursdays = admin.getThursdays(start, end);
                attendanceListTh = admin.getFullYearAttendance("TH", thursdays);

                //set session attributes
                session.setAttribute("dayList", thursdays);
                session.setAttribute("vendorAttendanceList", attendanceListTh);
                session.setAttribute("day", day);
                response.sendRedirect("admin/reports/fullYearAttendanceReport.jsp");
                
            } else if (day.equals("SA")) {
                
                //get saturday dates of the time period and get attendance report
                saturdays = admin.getSaturdays(start, end);
                attendanceListSa = admin.getFullYearAttendance("SA", saturdays);

                //set session attributes
                session.setAttribute("dayList", saturdays);
                session.setAttribute("vendorAttendanceList", attendanceListSa);
                session.setAttribute("day", day);
                response.sendRedirect("admin/reports/fullYearAttendanceReport.jsp");
                
            } else {
                
                //get thursday and saturday dates of the time period and get attendance report
                thursdays = admin.getThursdays(start, end);
                saturdays = admin.getSaturdays(start, end);

                attendanceListTh = admin.getFullYearAttendance("TH", thursdays);
                attendanceListSa = admin.getFullYearAttendance("SA", saturdays);

                //set session attributes
                session.setAttribute("dayListThursday", thursdays);
                session.setAttribute("thursdayVendorAttendanceList", attendanceListTh);
                session.setAttribute("dayListSaturday", saturdays);
                session.setAttribute("saturdayVendorAttendanceList", attendanceListSa);
                response.sendRedirect("admin/reports/fullYearDoubleAttendanceReport.jsp");
            }
        } catch (Exception e) {
            System.err.println("Exception : " + e);
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
    }
}
