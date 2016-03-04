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

public class RemovePayment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            //start session
            HttpSession session = request.getSession();

            boolean isRemoved = false;
            boolean removed, attend = false;

            String name = request.getParameter("name"); //retriving related vendor name
            String marketDay = request.getParameter("day"); //retriving selected vendor's market day
            String stallType = request.getParameter("stall"); //retriving selected vendor's stall

            //Retiving vendor ID using the name
            Vendor vendor = new Vendor();
            vendor.setVendorName(name);
            String vendorID = vendor.getIDByName();

            //Setting market day
            if (marketDay.equals("Thursday")) {
                marketDay = "TH";
            } else if (marketDay.equals("Saturday")) {
                marketDay = "SA";
            }
            
            System.out.println("OKKK");

            //Get the Payment object related to selected vendor's selected market day
            Payment payment = new Payment();
            payment.setVendorID(vendorID);
            payment = payment.getVendorPayment(vendorID, marketDay);

            //removing Thursday payment and attendance by payment Id
            if (marketDay.equals("TH")) {
                removed = payment.removeThurdayPayment(payment.getPaymentID());
                attend = payment.removeAttendanceTh(payment.getPaymentID());

                if (removed && attend) {
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Removed Successfully !");
                    session.setAttribute("successMsg", "Payment removed successfully");
                    response.sendRedirect("admin/removePayment_Admin.jsp");

                }

                //removing Saturday payment and attendance by payment Id
            } else if (marketDay.equals("SA")) {
                removed = payment.removeSaturdayPayment(payment.getPaymentID());
                attend = payment.removeAttendanceSa(payment.getPaymentID());
                if (removed && attend) {
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Removed Successfully !");
                    session.setAttribute("successMsg", "Payment removed successfully");
                    response.sendRedirect("admin/removePayment_Admin.jsp");
                }

            } else {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Remove Error !");
                session.setAttribute("errorMsg", "Cannot remove the payment");
                response.sendRedirect("admin/removePayment_Admin.jsp");

            }
            //alert for the successful payment removal
            

        } catch (SQLException ex) {
            Logger.getLogger(RemovePayment.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

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
