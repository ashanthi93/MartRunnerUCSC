package controllers.customer;

import classes.Customer;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VisitThursday_Vendor extends HttpServlet {
    
    Customer customer = new Customer();
    List resultList,AttendingThu,remainVendorList;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();

            resultList = customer.getThursdayVendorList();
            AttendingThu = customer.loadVendorsAttendingThursday();
            List<Vendor> paidVendorList = new ArrayList<Vendor>();                 //array to hold paid vendor list
            List<Vendor> attendingVendorList = new ArrayList<Vendor>();            //array to hold attending vendor list
            List<Vendor> notAttendingVendorList = new ArrayList<Vendor>();         //array to hold notAttending vendor list

            
            
            if (!resultList.isEmpty()) {
                session.setAttribute("thu", resultList);
                
                response.sendRedirect("customer/visitThursday.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('There are no local language vendors!');");
                out.println("location='admin/adminHomePage.jsp';");
                out.println("</script>");
            }
            
            paidVendorList = AttendingThu;
            
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
                remainVendorList = customer.loadRemainVendors("TH", paidVendorListID);
                
                if (!remainVendorList.isEmpty()) {
                session.setAttribute("remainThu", remainVendorList);
                
                response.sendRedirect("customer/visitThursday.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('There are no local language vendors!');");
                out.println("location='admin/adminHomePage.jsp';");
                out.println("</script>");
            }
                
                /*set session attribute to pass vendor list*/
                session.setAttribute("attendingVendorList", attendingVendorList);
                session.setAttribute("notAttendingVendorList", notAttendingVendorList);
                session.setAttribute("remainVendorList", remainVendorList);
                session.setAttribute("confirm", confirm);
                session.setAttribute("nConfirm", notConfirm);
                
            } else {
                /* error message if unable to load vendor list */
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Unable to load vendor list!');");
                out.println("location='admin/adminHomePage.jsp';");
                out.println("</script>");
            }
            
           
        } catch (SQLException e) {
            System.out.println("Error : " + e);
        }
        
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(VisitSaturday_Vendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(VisitSaturday_Vendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
//