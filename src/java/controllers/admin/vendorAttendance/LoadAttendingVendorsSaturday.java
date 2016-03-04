package controllers.admin.vendorAttendance;

import classes.Admin;
import classes.Vendor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadAttendingVendorsSaturday extends HttpServlet {

    Admin admin = new Admin();                          //create admin object to call methods

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            HttpSession session = request.getSession();
            
            List<Vendor> paidVendorList = new ArrayList<Vendor>();                 //array to hold paid vendor list
            List<Vendor> attendingVendorList = new ArrayList<Vendor>();            //array to hold attending vendor list
            List<Vendor> notAttendingVendorList = new ArrayList<Vendor>();         //array to hold notAttending vendor list

            //call method to return vendors paid for current market day
            paidVendorList = admin.loadVendorsAttendingSaturday();

            if (paidVendorList.size() > 0) {

                //array to hold paid vendor list ids
                List<String> paidVendorListID = new ArrayList<String>();
                
                //variables to hold current confirm number and notconfirm
                int confirm = 0, notConfirm = 0;

                /* count confirm and notConfirm vendor list */
                for (Vendor vendor : paidVendorList) {
                    if ("1".equals(vendor.getAttendance())) {
                        confirm += 1;
                        attendingVendorList.add(vendor);
                    } else {
                        notConfirm += 1;
                        notAttendingVendorList.add(vendor);
                    }
                    paidVendorListID.add(vendor.getVendorID());
                }

                //load remain vendor list to add new vendors to vacant stalls
                List<Vendor> remainVendorList = admin.loadRemainVendors("SA", paidVendorListID);
                
                /*set session attribute to pass vendor list*/
                session.setAttribute("attendingVendorList", attendingVendorList);
                session.setAttribute("notAttendingVendorList", notAttendingVendorList);
                session.setAttribute("remainVendorList", remainVendorList);
                session.setAttribute("confirm", confirm);
                session.setAttribute("nConfirm", notConfirm);

            } else {
                
                /* error message if unable to load vendor list */
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "Unable to load vendor list !");
                response.sendRedirect("admin/adminHomePage.jsp");
            }
        } catch (Exception e) {
            System.err.println("Exception : " + e);
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
