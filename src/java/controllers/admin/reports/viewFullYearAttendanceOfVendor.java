package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.LocalDate;

public class viewFullYearAttendanceOfVendor extends HttpServlet {

    Admin admin = new Admin();
    Vendor vendor = new Vendor();
    List<LocalDate> thursdays = new ArrayList();            //date columns for thursdays
    List<LocalDate> saturdays = new ArrayList();            //date columns for saturday
    LocalDate start, end;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();

            //set vendor attributes
            vendor.setVendorID(request.getParameter("vendorName1"));
            vendor.getVendornameByVendorID();

            //get selected day
            String day = request.getParameter("marketDay1");

            //check selected year is current or past
            String year = request.getParameter("year");

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
                start = new LocalDate(calendar.get(Calendar.YEAR) - 1, 1, 1);

                //set year attribute
                session.setAttribute("year", calendar.get(Calendar.YEAR) - 1);
            }

            if (day.equals("TH")) {

                //check vendor belong to market
                if (admin.checkVendorBelongToMarket("TH", vendor.getVendorID())) {

                    //get thursday dates of the time period and get attendance report
                    thursdays = admin.getThursdays(start, end);
                    admin.getFullYearAttendanceByName(day, thursdays, vendor);

                    //set session attributes
                    session.setAttribute("dayList", thursdays);
                    session.setAttribute("day", "TH");

                    session.setAttribute("vendor", vendor);                     //pass vendor    

                    response.sendRedirect("admin/reports/fullYearAttendanceOfAVendor.jsp");

                } else {

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Market Day");
                    session.setAttribute("errorMsg", "Vendor doesn't belong to Thursday Market!");
                    response.sendRedirect("admin/reportViewAttendanceVendorFullYear.jsp");
                }
            } else {

                //check vendor belong to market
                if (admin.checkVendorBelongToMarket("SA", vendor.getVendorID())) {

                    //get saturday dates of the time period and get attendance report
                    saturdays = admin.getSaturdays(start, end);
                    admin.getFullYearAttendanceByName(day, saturdays, vendor);

                    //set session attributes
                    session.setAttribute("dayList", saturdays);
                    session.setAttribute("day", "SA");

                    session.setAttribute("vendor", vendor);                     //pass vendor    

                    response.sendRedirect("admin/reports/fullYearAttendanceOfAVendor.jsp");

                } else {

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Market Day");
                    session.setAttribute("errorMsg", "Vendor doesn't belong to Saturday Market!");
                    response.sendRedirect("admin/reportViewAttendanceVendorFullYear.jsp");
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
