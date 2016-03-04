package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.LocalDate;

public class viewAttendanceOfAPeriod extends HttpServlet {

    Admin admin = new Admin();
    List<Vendor> vendorList = new ArrayList();
    List<LocalDate> thursdays = new ArrayList();
    List<LocalDate> saturdays = new ArrayList();
    LocalDate start, end;
    String startDate, endDate;
    SimpleDateFormat Date = new SimpleDateFormat("yyyy-MM-dd");
    Date curDate = new Date();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

            //start session
            HttpSession session = request.getSession();
            //get start date
            startDate = request.getParameter("startDate");
            Date startD = date.parse(startDate);

            //get end date
            endDate = request.getParameter("endDate");
            Date endD = date.parse(endDate);

            if (startD.after(curDate)) { //check start date is after current date

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "Cannot view attendance for future dates");
                response.sendRedirect("admin/reportViewAttendanceTimePeriod.jsp");

            } else if (endD.after(curDate)) { //check end date is after current date

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "Cannot view attendance for future dates");
                response.sendRedirect("admin/reportViewAttendanceTimePeriod.jsp");

            } else if (startD.after(endD)) { //check start date is after end date

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Date");
                session.setAttribute("errorMsg", "End date is before start date");
                response.sendRedirect("admin/reportViewAttendanceTimePeriod.jsp");
                
            } else {
                
                start = new LocalDate(Integer.parseInt(startDate.substring(0, 4)), Integer.parseInt(startDate.substring(5, 7)), Integer.parseInt(startDate.substring(8, 10)));
                end = new LocalDate(Integer.parseInt(endDate.substring(0, 4)), Integer.parseInt(endDate.substring(5, 7)), Integer.parseInt(endDate.substring(8, 10)));
                
                //get market day
                String day = request.getParameter("marketDay");

                if (day.equals("TH")) { //if market day is thursday
                    //get thursdays from start date to end date
                    thursdays = admin.getThursdays(start, end);

                    // method to get attendance of time period
                    vendorList = admin.getFullYearAttendance(day, thursdays);

                    for (Vendor vendor : vendorList) {
                        System.out.println(vendor.getVendorID());
                    }
                    //pass thursday date list
                    session.setAttribute("dayList", thursdays);

                } else { //if market day is saturday

                    //get saturdays from start date to end date
                    saturdays = admin.getSaturdays(start, end);
                    // method to get attendance of time period
                    vendorList = admin.getFullYearAttendance(day, saturdays);

                    for (Vendor vendor : vendorList) {
                        System.out.println(vendor.getVendorID());
                    }
                    //pass saturday date list
                    session.setAttribute("dayList", saturdays);
                }
                //set session attributes
                session.setAttribute("vendorList", vendorList);
                session.setAttribute("day", day);
                session.setAttribute("startDate", startDate);
                session.setAttribute("endDate", endDate);
                //redirect to jsp
                response.sendRedirect("admin/reports/attendancePeriodReport.jsp");
            }
        } catch (ParseException e) {
            System.out.println("ParseException : " + e);
        } catch (NumberFormatException e) {
            System.out.println("Number Format Exception : " + e);
        } catch (IOException e) {
            System.out.println("IOException : " + e);
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
