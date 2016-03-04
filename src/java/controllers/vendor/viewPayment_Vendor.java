package controllers.vendor;

import classes.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class viewPayment_Vendor extends HttpServlet {

    String marketDay, vendorId, paidDate, expiredDate;
    String[] dates = new String[2];
    boolean checked = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        try {
            //create payment object
            Payment payment = new Payment();

            //get vendor id
            vendorId = (String) session.getAttribute("vendorID");
            payment.setVendorID(vendorId);

            //get market day from jsp page
            marketDay = request.getParameter("marketDay");

            if ("Th".equals(marketDay)) { // check if vendor belong to market day
                checked = payment.checkPayment_Th();
            } else {
                checked = payment.checkPayment_Sa();
            }

            if (checked) {
                if ("Th".equals(marketDay)) {
                    // method to view payment
                    dates = payment.viewPayment_Vendor_Th();
                    checked = true;

                } else {
                    // method to view payment
                    dates = payment.viewPayment_Vendor_Sa();
                    checked = true;

                }

                paidDate = (dates[0]);
                expiredDate = (dates[1]);

                if (paidDate == null || expiredDate == null) { // check if vendor has record to market day
                    checked = false;
                }
                //set attributes of the session
                session.setAttribute("paiddate", paidDate);
                session.setAttribute("expireddate", expiredDate);

            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Invalid Market Day !");
                session.setAttribute("errorMsg", "You are not in the selected market day");
                response.sendRedirect("vendor/viewPayment_Vendor.jsp");
                /*
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('You are not in the selected market day!!');");
                 out.println("location='vendor/viewPayment_Vendor.jsp';");
                 out.println("</script>");
                 */
            }

            if (checked) {
                //redirect to jsp
                response.sendRedirect("vendor/viewPaymentResults_Vendor.jsp");

            }

        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(viewPayment_Vendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(viewPayment_Vendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
