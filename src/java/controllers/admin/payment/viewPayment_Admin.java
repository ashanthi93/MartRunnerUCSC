package controllers.admin.payment;

import classes.Payment;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class viewPayment_Admin extends HttpServlet {

    String marketDay, vendorId, vendorName, paidDate, expiredDate;
    String[] dates = new String[2];
    int duration;
    boolean inserted = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            Payment payment = new Payment();
            Vendor vendor = new Vendor();

            //get vendor id by name
            vendorId = request.getParameter("vendorName");
            payment.setVendorID(vendorId);

            //get vendor name
            vendor.setVendorID(vendorId);
            vendorName = vendor.getVendornameByVendorID();

            //get market day fron jsp page
            marketDay = request.getParameter("marketDay");

            //Calling view payment methods
            if ("Th".equals(marketDay)) {
                dates = payment.viewPayment_Th();
                inserted = true;

            } else {
                dates = payment.viewPayment_Sa();
                inserted = true;
            }

            paidDate = (dates[0]); //get paid date
            expiredDate = (dates[1]); //get expired date
            System.out.println("paidDate"+ dates[0]);
            System.out.println("expiredDate"+ dates[1]);

            if (paidDate == null || expiredDate == null) {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "No Payment Record !");
                session.setAttribute("errorMsg", "Vendor has not paid for this market day");
                response.sendRedirect("admin/viewPayment_Admin.jsp");
            } else {
                //set attributes of the session
                session.setAttribute("vendorname", vendorName);
                session.setAttribute("paiddate", paidDate);
                session.setAttribute("expireddate", expiredDate);
                //redirect to jsp
                response.sendRedirect("admin/viewPaymentResults_Admin.jsp");
            }

        } catch (SQLException e) {
            System.out.println("SQLException" + e);
        } catch (IOException e) {
            System.out.println("IOException" + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(viewPayment_Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(viewPayment_Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
