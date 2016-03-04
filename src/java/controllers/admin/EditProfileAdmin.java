package controllers.admin;

import classes.Admin;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditProfileAdmin extends HttpServlet {

    //variables to hold attributes
    String firstName, lastName, prvPassword, newPassword, nic, mobileNumber, email;

    //for database update
    String fieldName, cellValue;

    int i = 0;          //to check updates happen or not

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            HttpSession session = request.getSession();

            //create new admin object 
            Admin admin = new Admin();

            //set admin object attributes
            admin.setUserID((String) session.getAttribute("ID"));

            firstName = request.getParameter("firstname");
            lastName = request.getParameter("lastname");
            prvPassword = request.getParameter("prvPassword");
            newPassword = request.getParameter("newPassword");
            nic = request.getParameter("nicNumber");
            mobileNumber = request.getParameter("mobileNumber");
            email = request.getParameter("email");

            //update firstname if change
            if (!("".equals(firstName))) {
                fieldName = "userFirstName";
                cellValue = firstName;
                if (admin.updateCell(fieldName, cellValue)) {
                    i++;
                    session.setAttribute("User", admin.getUserFirstname());
                } else {

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change first name. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");

                }
            }

            //update lastname if change
            if (!("".equals(lastName))) {
                fieldName = "userLastName";
                cellValue = lastName;
                if (admin.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change last name. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                }
            }

            //update password if change
            if (!("".equals(prvPassword))) {
                int x = admin.changePassword(prvPassword, newPassword);
                if (x == 2) {
                    i++;
                } else if (x == 0) {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Password Reset Fails");
                    session.setAttribute("errorMsg", "Your old password is wrong !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                } else if (x == 1) {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Password Reset Fails");
                    session.setAttribute("errorMsg", "Unable to update your password. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Password Reset Fails");
                    session.setAttribute("errorMsg", "Unable to change your password. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                }
            }

            //update nic if change
            if (!("".equals(nic))) {
                cellValue = nic;
                if (admin.updateNIC(cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change nic. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                }
            }

            //update mobile number if change
            if (!("".equals(mobileNumber))) {
                cellValue = mobileNumber;
                if (admin.updateContactNumber(cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change mobile number. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                }
            }

            //update email if change
            if (!("".equals(email))) {
                fieldName = "userEmail";
                cellValue = email;
                if (admin.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change email. Please try again !");
                    response.sendRedirect("admin/editProfile_Admin.jsp");
                }
            }

            //check all updates happen and send success message
            if (i > 0) {
                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Update Successfully");
                session.setAttribute("successMsg", "Your profile updated ! ");
                response.sendRedirect("admin/editProfile_Admin.jsp");
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
