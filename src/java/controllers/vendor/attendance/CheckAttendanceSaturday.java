package controllers.vendor.attendance;

import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckAttendanceSaturday extends HttpServlet {

    Vendor vendor = new Vendor();                   //Create a new vendor

    int paidCheck;                                  //check whether venor had paid before confirming

    Date expiredDate = new Date();                  //expired date of payment
    Date currentDate = new Date();                  //current date

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {

        try {
            HttpSession session = request.getSession();

            //Set userID by session
            vendor.setUserID((String) session.getAttribute("ID"));

            //Set vendorID by session
            vendor.setVendorID((String) session.getAttribute("vendorID"));

            /*Start of checkPayment method -- check vendor has paid for the week before confirming attendance*/
            paidCheck = vendor.checkPayment("SA");

            /*Execute below statemnets if vendor belongs to current market*/
            if (paidCheck == 1) {

                expiredDate = vendor.getExpiredDate();
                currentDate = Date.from(Instant.now());

                if (expiredDate.compareTo(currentDate) > 0) {
                    Calendar calendar = Calendar.getInstance();

                    //current day of the week
                    int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                    SimpleDateFormat parser = new SimpleDateFormat("HH:mm:ss");

                    //closing time of the attendance
                    Date closeTime = parser.parse("17:00:00");

                    //current time when attendance confirm
                    Date currentTime = calendar.getTime();

                    /* Check current day is included inside the confirmation period*/
                    if (!(dayOfWeek > 2 && dayOfWeek <= 7)) {

                        /* Check confirmation is before 5pm on monday*/
                        if (dayOfWeek == 2 && (compareTimes(closeTime, currentTime) > 0)) {

                            String status = vendor.getAttendanceStatus("SA");                      //get current attendance status

                            session.setAttribute("AttendanceS", status);                            //set attendance status to seesion attribute

                            response.sendRedirect("vendor/ConfirmSaturdayVendorAttendense.jsp");
                        } else if (dayOfWeek == 1) {

                            String status = vendor.getAttendanceStatus("SA");                      //get current attendance status

                            session.setAttribute("AttendanceS", status);                            //set attendance status to seesion attribute

                            response.sendRedirect("vendor/ConfirmSaturdayVendorAttendense.jsp");
                        } else {

                            //Output error if confirmation is after 5pm on monday
                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Time Over");
                            session.setAttribute("errorMsg", "Sorry!. Attendance Confirmation time is over.");
                            response.sendRedirect("vendor/vendorHomePage.jsp");
                        }
                    } else {

                        //Output error if attendance period is over (inbetween tuesday to thursday)
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Time Over");
                        session.setAttribute("errorMsg", "Sorry!. Attendance Confirmation is closed for this week.");
                        response.sendRedirect("vendor/vendorHomePage.jsp");
                    }
                } else {

                    //Output error if payment period is over
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Payment Expired");
                    session.setAttribute("errorMsg", "Your payment has expired for Saturday Market!");
                    response.sendRedirect("vendor/vendorHomePage.jsp");
                }
            } else if (paidCheck == -1) {

                //Output error if payment period is over
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Payment Expired");
                session.setAttribute("errorMsg", "Your payment has expired for Saturday Market!");
                response.sendRedirect("vendor/vendorHomePage.jsp");

            } else if (paidCheck == 2) {

                // Output error if vendor didn't belongs to market day
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Market Day");
                session.setAttribute("errorMsg", "You are not a memebr of Saturday Market!");
                response.sendRedirect("vendor/vendorHomePage.jsp");

            } else {

                //output error if vendor hasn't paid yet
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "No Payments");
                session.setAttribute("errorMsg", "Still you do not paid for any market day!");
                response.sendRedirect("vendor/vendorHomePage.jsp");

            }
            /*End of checkPayment method*/

        } catch (SQLException e) {
            System.out.println("SQL Exception : " + e);
        } catch (ParseException e) {
            System.out.println("Parse Exception : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckAttendanceThursday.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(CheckAttendanceThursday.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckAttendanceThursday.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(CheckAttendanceThursday.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    /* method to compate times */
    public int compareTimes(Date d1, Date d2) {
        int t1;
        int t2;

        t1 = (int) (d1.getTime() % (24 * 60 * 60 * 1000L));
        t2 = (int) (d2.getTime() % (24 * 60 * 60 * 1000L));

        return (t1 - t2);
    }
}
