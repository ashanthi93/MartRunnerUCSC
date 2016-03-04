package controllers.admin.payment;

import classes.Payment;
import java.io.IOException;
import java.io.PrintWriter;
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

public class addPayment extends HttpServlet {

    String paidDate, marketDay, vendorId;
    int duration;
    boolean inserted = false, attendanceset = false, paymentadd = false;
    Date curDate = new Date();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            //start session
            HttpSession session = request.getSession();

            //create payment object
            Payment payment = new Payment();

            //get vendor id 
            vendorId = request.getParameter("vendorName");

            //get the paid date           
            paidDate = (request.getParameter("startDate"));
            //creating a date object
            SimpleDateFormat startDate = new SimpleDateFormat("yyyy-MM-dd");
            Date date = startDate.parse(paidDate);

            //check what day of week the start day is
            Calendar c = Calendar.getInstance();
            c.setTime(date);
            int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);

            //set paid date of payment object
            payment.setPaidDate(date);

            //get payent duration and assign intiger values for them
            if ("day".equals(request.getParameter("duration"))) {
                duration = 1;
            } else if ("month".equals(request.getParameter("duration"))) {
                duration = 2;
            } else if ("quarter".equals(request.getParameter("duration"))) {
                duration = 3;
            } else {
                duration = 0;
            }

            //set vendorID of payment object
            payment.setVendorID(vendorId);
            //check the eqiality of today and start date without time
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(curDate);
            cal2.setTime(date);
            boolean sameDay = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
                    && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);

            if (!(sameDay) && curDate.after(date)) {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Start Date");
                session.setAttribute("errorMsg", "Start date passed !!");
                response.sendRedirect("admin/addPayment_Admin.jsp");

            } else {
                //add payment to the database
                if ("th".equals(request.getParameter("marketType"))) { //check market date
                    if (dayOfWeek == 5) { //check if the start date is a thursday

                        if (payment.checkMarketDay("TH")) { //check if vendor belongs to thursday market

                            if (payment.checkPayment_Th()) { //check if given vendor is already in the table

                                session.setAttribute("error", 1);
                                session.setAttribute("errorHead", "Vendor already has a record !!!");
                                session.setAttribute("errorMsg", "You can update the record using update payment.");
                                response.sendRedirect("admin/addPayment_Admin.jsp");

                            } else {
                                //Add Payment to the payment table
                                paymentadd = payment.addPayment_Th(duration);
                                //set attendance of vendor as confirmed
                                attendanceset = payment.setAttendanceTh();

                                if (paymentadd && attendanceset) { // check if both methods executed without error

                                    session.setAttribute("success", 1);
                                    session.setAttribute("successHead", "Success!!!");
                                    session.setAttribute("successMsg", "New payment added to the system");
                                    response.sendRedirect("admin/addPayment_Admin.jsp");
                                } else {
                                    session.setAttribute("error", 1);
                                    session.setAttribute("errorHead", "Error!!!");
                                    session.setAttribute("errorMsg", "Unable to add new payment into the system");
                                    response.sendRedirect("admin/addPayment_Admin.jsp");

                                }
                            }

                        } else {

                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Invalid vendor !");
                            session.setAttribute("errorMsg", "Vendor does not belong to the Thursday Market");
                            response.sendRedirect("admin/addPayment_Admin.jsp");

                        }
                    } else {
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Invalid Date !");
                        session.setAttribute("errorMsg", "Start Date is not a Thursday");
                        response.sendRedirect("admin/addPayment_Admin.jsp");

                    }
                } else {
                    if (dayOfWeek == 7) { // check if start date is a saturday

                        if (payment.checkMarketDay("SA")) { //check if vendor belongs to saturday market

                            if (payment.checkPayment_Sa()) { //check if vendor is already in the table

                                session.setAttribute("error", 1);
                                session.setAttribute("errorHead", "Vendor already has a record !!!");
                                session.setAttribute("errorMsg", "You can update the record using update payment.");
                                response.sendRedirect("admin/addPayment_Admin.jsp");

                            } else {
                                //add payment to the payment table
                                paymentadd = payment.addPayment_Sa(duration);
                                //set attendance of vendor as confirmed
                                attendanceset = payment.setAttendanceSa();

                                if (paymentadd && attendanceset) { // check if both methods executed without error

                                    session.setAttribute("success", 1);
                                    session.setAttribute("successHead", "Success!!!");
                                    session.setAttribute("successMsg", "New payment added to the system");
                                    response.sendRedirect("admin/addPayment_Admin.jsp");

                                } else {
                                    session.setAttribute("error", 1);
                                    session.setAttribute("errorHead", "Error!!!");
                                    session.setAttribute("errorMsg", "Unable to add new payment into the system");
                                    response.sendRedirect("admin/addPayment_Admin.jsp");

                                }
                            }
                        } else {

                            session.setAttribute("error", 1);
                            session.setAttribute("errorHead", "Invalid Vendor ! ");
                            session.setAttribute("errorMsg", "Vendor not belongs to the Saturday Market");
                            response.sendRedirect("admin/addPayment_Admin.jsp");

                        }
                    } else {
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Error !");
                        session.setAttribute("errorMsg", "Start Date is not a Saturday");
                        response.sendRedirect("admin/addPayment_Admin.jsp");

                    }

                }

            }

        } catch (Exception e) {
            System.out.println("error" + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(addPayment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(addPayment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
