package controllers.vendor;

import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditProfileVendor extends HttpServlet {

    //variables to hold vendor attributes 
    String firstName, lastName, prvPassword, newPassword, nic, mobileNumber, email;
    String address, fixedLine, fbID, gPlusID, tweeterID;

    //for database update
    String fieldName, cellValue;

    //to check all updates happen or not
    int i = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();

            //create vendor object
            Vendor vendor = new Vendor();

            //set vendor attributes
            vendor.setUserID((String) session.getAttribute("ID"));

            firstName = request.getParameter("firstName");
            lastName = request.getParameter("lastName");
            prvPassword = request.getParameter("prvPassword");
            newPassword = request.getParameter("newPassword");
            nic = request.getParameter("nicNumber");
            mobileNumber = request.getParameter("mobileNumber");
            email = request.getParameter("email");

            address = request.getParameter("address");
            fixedLine = request.getParameter("fixedLine");
            fbID = request.getParameter("fbID");
            gPlusID = request.getParameter("gPlusID");
            tweeterID = request.getParameter("tweeterID");

            //update firstname if change
            if (!("".equals(firstName))) {
                fieldName = "userFirstName";
                cellValue = firstName;
                if (vendor.updateCell(fieldName, cellValue)) {
                    i++;
                    session.setAttribute("User", vendor.getUserFirstname());
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change first name. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update lastname if change
            if (!("".equals(lastName))) {
                fieldName = "userLastName";
                cellValue = lastName;
                if (vendor.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change last name. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update password if change
            if (!("".equals(prvPassword))) {
                int x = vendor.changePassword(prvPassword, newPassword);
                if (x == 2) {
                    i++;
                } else if (x == 0) {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Password Reset Fails");
                    session.setAttribute("errorMsg", "Your old password is wrong !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                } else if (x == 1) {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Password Reset Fails");
                    session.setAttribute("errorMsg", "Unable to update your password. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Password Reset Fails");
                    session.setAttribute("errorMsg", "Unable to change your password. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update nic if change
            if (!("".equals(nic))) {
                cellValue = nic;
                if (vendor.updateNIC(cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change nic. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update address if change
            if (!("".equals(address))) {
                fieldName = "address";
                cellValue = address;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change stall name. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update mobile number if change
            if (!("".equals(mobileNumber))) {
                cellValue = mobileNumber;
                if (vendor.updateContactNumber(cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change mobile number. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update email if change
            if (!("".equals(email))) {
                fieldName = "userEmail";
                cellValue = email;
                if (vendor.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change email. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update fixed line if change
            if (!("".equals(fixedLine))) {
                cellValue = fixedLine;
                if (vendor.updateFixedLine(cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change fixed line. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update fbID if change
            if (!("".equals(fbID))) {
                fieldName = "fbLink";
                cellValue = fbID;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change fb link. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update gPlusID if change
            if (!("".equals(gPlusID))) {
                fieldName = "gPlusLink";
                cellValue = gPlusID;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change gPlus link. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //update tweeterID if change
            if (!("".equals(tweeterID))) {
                fieldName = "tweeterLink";
                cellValue = tweeterID;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change tweeter link. Please try again !");
                    response.sendRedirect("vendor/editProfile_Vendor.jsp");
                }
            }

            //check all updates happen and send success message
            if (i > 0) {
                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Update Successfully");
                session.setAttribute("successMsg", "Your profile updated! ");
                response.sendRedirect("vendor/editProfile_Vendor.jsp");
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (IOException e) {
            System.err.println("IOException : " + e);
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
