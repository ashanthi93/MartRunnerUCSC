package controllers.admin.vendorHandling;

import classes.Admin;
import classes.Vendor;
import emails.Email;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InsertVendor extends HttpServlet {

    Admin admin = new Admin();          //Create admin object to create a new vendor
    boolean inserted = false;           //To find whether vendor inserted into the database
    boolean mailSent = false;           //To find whether email sent to the normal user

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        response.setContentType("text/html;charset=UTF-8");

        try {

            HttpSession session = request.getSession();

            /* Create new vendor object*/
            Vendor vendor = new Vendor();

            /* start of setting parameters to User object*/
            vendor.setUserFirstname(request.getParameter("firstName"));
            vendor.setUserLastName(request.getParameter("lastName"));
            vendor.setUserNIC(request.getParameter("nicNumber"));
            vendor.setUserContactNo(request.getParameter("mobileNumber"));
            vendor.setUserEmail(request.getParameter("email"));
            /* end of setting parameters of User object*/

            /* start of setting parameters to Vendor object*/
            vendor.setVendorName(request.getParameter("vendorName"));
            vendor.setAddress(request.getParameter("address"));
            vendor.setFixedLine(request.getParameter("fixedLine"));
            vendor.setFbLink(request.getParameter("fbID"));
            vendor.setgPlus(request.getParameter("gPlusID"));
            vendor.setTweeter(request.getParameter("tweeterID"));

            vendor.setMainCatg(request.getParameter("mainCategory"));
            vendor.setProductCatgID(request.getParameter("productCategory"));

            vendor.setProducts(request.getParameter("productsTxt"));
            vendor.setDescription(request.getParameter("descriptionTxt"));
            vendor.setRestriction(request.getParameter("restrictionsTxt"));
            vendor.setSiImpact(request.getParameter("sImpactTxt"));
            vendor.setEnvImpact(request.getParameter("envImpactTxt"));

            vendor.setProductLevel(Integer.parseInt(request.getParameter("productLevel")));
            vendor.setPkgLevel(Integer.parseInt(request.getParameter("pkgLevel")));
            vendor.setSiLevel(Integer.parseInt(request.getParameter("socialImpactLevel")));
            vendor.setEiLevel(Integer.parseInt(request.getParameter("envImpactLevel")));

            vendor.setMarketDays(request.getParameterValues("marketDay"));

            //assign value to stallType according to stall type selections
            if ("hStall".equals(request.getParameter("stallType"))) {
                vendor.setStallType(0.5);
            } else if ("fStall".equals(request.getParameter("stallType"))) {
                vendor.setStallType(1);
            } else if ("tStall".equals(request.getParameter("stallType"))) {
                vendor.setStallType(2);
            } else {
                vendor.setStallType(0);
            }

            //assign value to vendorType according to vendor type selection
            if ("activeV".equals(request.getParameter("vendorType"))) {
                vendor.setVendorType(1);
            } else if ("deactiveV".equals(request.getParameter("vendorType"))) {
                vendor.setVendorType(0);
            } else {
                vendor.setVendorType(-1);
            }
            /* end of setting parameters to vendor object */

            //Register vendor and check wthether vendor is inserted into the database
            inserted = admin.RegisterVendor(vendor);

            if (inserted) {                     /* if vendor is added to the database an email sent to the normal vendor */

                if (vendor.getVendorType() == 1) {

                    /* create new email object to send */
                    Email email = new Email();
                    mailSent = email.sendLoginDetails(vendor.getUserEmail(), vendor.getUserID() , vendor.getUserPwd());

                    if (mailSent) {                     /* sucessfull message to the admin if email sent and vendor added to the system*/

                        session.setAttribute("success", 1);
                        session.setAttribute("successHead", "Vendor Added Successfully");
                        session.setAttribute("successMsg", "Activation email sent to user.");
                        response.sendRedirect("admin/createVendorAccount_Admin.jsp");
                    } else {                            /* error message to the admin if email sending failed */

                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Email Sent Fails");
                        session.setAttribute("errorMsg", "New vendor addedd but unable to send activation mail.");
                        response.sendRedirect("admin/createVendorAccount_Admin.jsp");
                    }
                } else {            /* sucessfull message to the admin if vendor added to the system and no email sent*/

                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Vendor Added Successfully");
                    session.setAttribute("successMsg", "New local language vendor added to the system");
                    response.sendRedirect("admin/createVendorAccount_Admin.jsp");
                }
            } else {                    /* error message if vendor is unable to insert into the database */

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Vendor Added Fails");
                session.setAttribute("errorMsg", "Unable to add new vendor !");
                response.sendRedirect("admin/createVendorAccount_Admin.jsp");
            }
        } catch (NumberFormatException e) {
            System.out.println("Number Format Exception : " + e);
        } catch (SQLException e) {
            System.out.println("SQL Excption : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(InsertVendor.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(InsertVendor.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
}
