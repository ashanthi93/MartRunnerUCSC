package controllers.admin.reports;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
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

public class ReportViewPaymentByDate extends HttpServlet {

    Admin admin = new Admin();
    List<Vendor> vendorList = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //start session
            HttpSession session = request.getSession();
            //get date
            String date = request.getParameter("date");

            String selectDate = date.substring(0, 4) + "_" + date.substring(5, 7) + "_" + date.substring(8, 10);
            //get market day
            String day = request.getParameter("marketDay");

            //creating a date object
            SimpleDateFormat startDate = new SimpleDateFormat("yyyy-MM-dd");
            Date checkdate = startDate.parse(date);

            //check what day of week the start day is
            Calendar c = Calendar.getInstance();
            c.setTime(checkdate);
            int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
            
            
            if (day.equals("TH")) {
                if (dayOfWeek == 5) { //if start date is thursday
                    //method to get attendance
                    vendorList = admin.getMarketDayAttendance(day, selectDate);
                    //set session attributes
                    session.setAttribute("vendorList", vendorList);
                    session.setAttribute("day", day);
                    session.setAttribute("selectedDate", date);
                    //redirect to jsp
                    response.sendRedirect("admin/reports/paidVendorsOfADay.jsp");

                } else { //if start date is not a thursday
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Date");
                    session.setAttribute("errorMsg", "Selected date is not a Thursday !");
                    response.sendRedirect("admin/reportViewPaymentByDate.jsp");    

                }

            } else {
                if (dayOfWeek == 7) { //if start date is saturday
                    //method to get attendance
                    vendorList = admin.getMarketDayAttendance(day, selectDate);
                    //set session attributes
                    session.setAttribute("vendorList", vendorList);
                    session.setAttribute("day", day);
                    session.setAttribute("selectedDate", date);
                    //redirect to jsp
                    response.sendRedirect("admin/reports/paidVendorsOfADay.jsp");
                    
                } else { //if start date is not a saturday
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Invalid Date");
                    session.setAttribute("errorMsg", "Selected date is not a Saturday !");
                    response.sendRedirect("admin/reportViewPaymentByDate.jsp");    

                }
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
