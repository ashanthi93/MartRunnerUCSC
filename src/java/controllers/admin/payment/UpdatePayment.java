package controllers.admin.payment;

import classes.Payment;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
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

public class UpdatePayment extends HttpServlet {

    Date curDate = new Date();
    String dates[] = new String[2];

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isUpdated = false;
            boolean update, attend = false;

            //Updating payment details
            HttpSession session = request.getSession();
            String vendorName = (String) session.getAttribute("finalUpdateName"); //retreiving updating vendor name from the jsp
            String marketDay = (String) session.getAttribute("finalUpdateMarketDay");//retreiving market day of the selected vendor
            String stallType = (String) session.getAttribute("finalUpdateStallType");//retreiving stall type of the selected vendor

            String sDate = request.getParameter("startDate");//retreiving start date of the payment

            //creating a date object with "yyyy-MM-dd" date format
            SimpleDateFormat srtDate = new SimpleDateFormat("yyyy-MM-dd");
            Date checkdate = srtDate.parse(sDate);

            //checking what day of week the start day is
            Calendar c = Calendar.getInstance();
            c.setTime(checkdate);
            int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);

            //Formatting start date
            String[] splittedDate = sDate.split("-");

            int year = Integer.parseInt(splittedDate[0]) - 1900; //Fixing the year of starting date
            int month = Integer.parseInt(splittedDate[1]) - 1; //fixing the month of starting date
            int date = Integer.parseInt(splittedDate[2]);//fixing the date of starting date

            Date startDate = new Date();
            startDate.setYear(year);//setting starting year
            startDate.setMonth(month);//setting starting month
            startDate.setDate(date);//setting starting date

            Timestamp stDate = new Timestamp(startDate.getTime());

            //retriving stall type of the vendor
            String duration = request.getParameter("stallType");

            Vendor vendor = new Vendor();
            vendor.setVendorName(vendorName);
            String vendorID = vendor.getIDByName();//Retiving vendor ID using the name

            int dur = 0;// dur is used to pass the stall type to calculate the expired date

            //new payment object
            Payment payment = new Payment();
            payment.setPaidDate(stDate);
            payment.setVendorID(vendorID);

            //check the eqiality of today and start date without time
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(curDate);
            cal2.setTime(checkdate);
            boolean sameDay = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
                    && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);

            if (duration.equals("dayStall")) {
                //payment.setExpiredDate(stDate);
                dur = 1; //for a one day stall, dur=1
            } else if (duration.equals("monthStall")) {
                //setExpiryDate(startDate, payment, 1);
                dur = 2;//for a one month stall, dur=2
            } else if (duration.equals("quarterStall")) {
                //setExpiryDate(startDate, payment, 3);
                dur = 3; //for a quarter stall, dur=3
            }
            if (!(sameDay) && curDate.after(checkdate)) {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Start Date !");
                session.setAttribute("errorMsg", "Start date has passed");
                response.sendRedirect("admin/updatePayment_Final.jsp");

            } else {
                //when market day is Thursday
                if (marketDay.equals("Thursday")) {
                    dates = payment.viewPayment_Th();
                    String expiredDate = dates[1];
                    Date expDate = srtDate.parse(expiredDate);

                    if (startDate.after(expDate)) {

                        //Checking whether selected start date is a Thursday
                        if (dayOfWeek == 5) {
                            update = payment.updatePayment("TH", dur);//updating Thursday payment
                            attend = payment.setAttendanceTh();//updating Thursday attendance 
                            if (update && attend) {
                                session.setAttribute("success", 1);
                                session.setAttribute("successHead", "Successfully Updated !");
                                session.setAttribute("successMsg", "Payment updated successfully");
                                response.sendRedirect("admin/updatePayment_Final.jsp");

                            }

                            //notifying that the start day is not a Thursday
                        } else {
                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Invalid Date !");
                            session.setAttribute("errorMsg", "Start Date is not a Thursday");
                            response.sendRedirect("admin/updatePayment_Final.jsp");

                            /*
                             out.println("<script type=\"text/javascript\">");
                             out.println("alert('Start Date is not a Thursday!');");
                             out.println("location='admin/updatePayment_Final.jsp';");
                             out.println("</script>");
                             */
                        }
                    }else {
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Date !");
                        session.setAttribute("errorMsg", "Cannot update payment before expiration");
                        response.sendRedirect("admin/updatePayment_Final.jsp");

                    }

                    //When market day is Saturday
                } else if (marketDay.equals("Saturday")) {

                    dates = payment.viewPayment_Sa();
                    String expiredDate = dates[1];
                    Date expDate = srtDate.parse(expiredDate);

                    if (startDate.after(expDate)) {
                        if (dayOfWeek == 7) {
                            update = payment.updatePayment("SA", dur);//Updating Saturday payment
                            attend = payment.setAttendanceSa();//Updating Saturday attendance
                            if (update && attend) {
                                session.setAttribute("success", 1);
                                session.setAttribute("successHead", "Successfully Updated !");
                                session.setAttribute("successMsg", "Payment updated successfully");
                                response.sendRedirect("admin/updatePayment_Final.jsp");

                            }

                            //notifying that the start date is not a saturday
                        } else {
                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Invalid Date !");
                            session.setAttribute("errorMsg", "Start Date is not a Saturday");
                            response.sendRedirect("admin/updatePayment_Final.jsp");
                            /*
                             out.println("<script type=\"text/javascript\">");
                             out.println("alert('Start Date is not a Saturday!');");
                             out.println("location='admin/updatePayment_Final.jsp';");
                             out.println("</script>");
                             */
                        }
                    } else {
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Date !");
                        session.setAttribute("errorMsg", "Cannot update payment before expiration");
                        response.sendRedirect("admin/updatePayment_Final.jsp");

                    }

                }

            }

            /*
             //Alert for successful payment update
             if (isUpdated) {

               
             //alert for payment update failure
             } else {

             session.setAttribute("error", 1);
             session.setAttribute("errorHead", "Update Failed!");
             session.setAttribute("errorMsg", "Payment update failed");
             response.sendRedirect("admin/updatePayment_Final.jsp");
               
             }*/
        } catch (ParseException e) {
            System.out.println("ParseException" + e);
        } catch (NumberFormatException e) {
            System.out.println("NumberFormatException" + e);
        } catch (SQLException e) {
            System.out.println("SQLException" + e);
        } catch (IOException e) {
            System.out.println("IOException" + e);
        }
    }

    /*private void setExpiryDate(Date startDate, Payment payment, int numberOfMonths) {
     Timestamp expDate = new Timestamp(startDate.getTime());
        
     int month = expDate.getMonth();

     //setting new expiry month
     month += numberOfMonths;
     expDate.setMonth(month);
     payment.setExpiredDate(expDate);
     }*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdatePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdatePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
