package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class viewAttendanceOfADay extends HttpServlet {

    Admin admin = new Admin();
    Date curDate = new Date();

    List<Vendor> vendorList = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();

            //get selected date
            String date = request.getParameter("date");

            String selectDate = date.substring(0, 4) + "_" + date.substring(5, 7) + "_" + date.substring(8, 10);

            //get selected market day
            String day = request.getParameter("marketDay");

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
                response.sendRedirect("admin/reportViewAttendanceDate.jsp");

            }else{
                
                            if (day.equals("TH")) {
                if (dayOfWeek == 5) {
                    //get market day attendance
                    vendorList = admin.getMarketDayAttendance(day, selectDate);

                    //set session attributes
                    session.setAttribute("vendorList", vendorList);
                    session.setAttribute("day", day);
                    session.setAttribute("selectedDate", date);

                    response.sendRedirect("admin/reports/attendanceReportOfADay.jsp");
                } else {

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Date");
                    session.setAttribute("errorMsg", "Selected date is not a Thursday !");
                    response.sendRedirect("admin/reportViewAttendanceDate.jsp");
                }

            } else {
                if (dayOfWeek == 7) {
                    //get market day attendance
                    vendorList = admin.getMarketDayAttendance(day, selectDate);

                    //set session attributes
                    session.setAttribute("vendorList", vendorList);
                    session.setAttribute("day", day);
                    session.setAttribute("selectedDate", date);

                    response.sendRedirect("admin/reports/attendanceReportOfADay.jsp");

                } else {

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Date");
                    session.setAttribute("errorMsg", "Selected date is not a Saturday !");
                    response.sendRedirect("admin/reportViewAttendanceDate.jsp");
                }
            }
                
            
            }


        } catch (ParseException e) {
            System.err.println("ParseException : " + e);
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
