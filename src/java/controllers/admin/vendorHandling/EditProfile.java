package controllers.admin.vendorHandling;

import classes.Vendor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditProfile extends HttpServlet {

    Vendor vendor = new Vendor();               //new vendor object
    
    //variables to hold new values
    String firstName, lastName, nic, mobileNumber, vendorName, address, fixedLine,email, mainCatg, productCatg;
    String products, description, restriction, siImpact, envImpact;

    int productLevel, pkgLevel, siLevel, eiLevel;

    String fieldName, cellValue;
    
    int i,cell;
    boolean error = false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            
            //get current vendor object
            vendor = (Vendor) session.getAttribute("vendor");

            //get change values
            firstName = request.getParameter("firstName");
            lastName = request.getParameter("lastName");
            vendorName = request.getParameter("vendorName");
            nic = request.getParameter("nicNumber");
            address = request.getParameter("address");
            mobileNumber = request.getParameter("mobileNumber"); 
            fixedLine = request.getParameter("fixedLine");
            email = request.getParameter("email");
            
            mainCatg = request.getParameter("mainCategory");
            productCatg = request.getParameter("productCategory");
            productLevel = Integer.parseInt(request.getParameter("productLevel"));
            pkgLevel = Integer.parseInt(request.getParameter("pkgLevel"));
            siLevel = Integer.parseInt(request.getParameter("socialImpactLevel"));
            eiLevel = Integer.parseInt(request.getParameter("envImpactLevel"));

            products = request.getParameter("productsTxt");
            description = request.getParameter("descriptionTxt");
            restriction = request.getParameter("restrictionsTxt");
            siImpact = request.getParameter("sImpactTxt");
            siImpact = request.getParameter("envImpactTxt");
            
            //update database if values are updated
            if (!(vendor.getUserFirstname().equals(firstName))) {
                fieldName = "userFirstName";
                cellValue = firstName;
                if (vendor.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change first name. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getUserLastName().equals(lastName))) {
                fieldName = "userLastName";
                cellValue = lastName;
                if (vendor.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change last name. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getVendorName().equals(vendorName))) {
                fieldName = "vendorName";
                cellValue = vendorName;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change stall name. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getUserNIC().equals(nic))) {
                cellValue = nic;
                if (vendor.updateNIC(cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change nic. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getAddress().equals(address))) {
                fieldName = "address";
                cellValue = address;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change address. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getUserContactNo().equals(mobileNumber))) {
                cellValue = mobileNumber;
                if (vendor.updateContactNumber(cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change mobile number. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getFixedLine().equals(fixedLine))) {
                cellValue = fixedLine;
                if (vendor.updateFixedLine(cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change fixed line number. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!("".equals(email))) {
                fieldName = "userEmail";
                cellValue = email;
                if (vendor.updateCell(fieldName, cellValue)) {
                    i++;
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change email. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(mainCatg.equals(vendor.getMainCatg()))) {
                fieldName = "mainCategory";
                vendor.setMainCatg(mainCatg);
                if (vendor.updateVendorCategories(fieldName)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change main category. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(productCatg.equals(vendor.getProductCatgID()))) {
                fieldName = "productCatg";
                vendor.setProductCatgID(productCatg);
                if (vendor.updateVendorCategories(fieldName)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change product category. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (productLevel != vendor.getProductLevel()) {
                fieldName = "productLevel";
                cell = productLevel;
                if (vendor.updateLevel(fieldName, cell)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change product level. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (pkgLevel != vendor.getPkgLevel()) {
                fieldName = "pkgLevel";
                cell = pkgLevel;
                if (vendor.updateLevel(fieldName, cell)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change packaging level. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (siLevel != vendor.getSiLevel()) {
                fieldName = "siLevel";
                cell = siLevel;
                if (vendor.updateLevel(fieldName, cell)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change social impact level. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (eiLevel != vendor.getEiLevel()) {
                fieldName = "eiLevel";
                cell = eiLevel;
                if (vendor.updateLevel(fieldName, cell)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change environment impact level. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!(vendor.getProducts().equals(products))) {
                fieldName = "products";
                cellValue = products;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change product details. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!"".equals(description)) {
                fieldName = "description";
                cellValue = description;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change description. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!"".equals(restriction)) {
                fieldName = "restrictions";
                cellValue = restriction;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change restriction. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!"".equals(siImpact)) {
                fieldName = "s_impact";
                cellValue = siImpact;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change social impact description. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            if (!"".equals(envImpact)) {
                fieldName = "e_impact";
                cellValue = envImpact;
                if (vendor.updateCellInVendor(fieldName, cellValue)) {
                    i++;
                } else {
                    error = true;
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Update Fails");
                    session.setAttribute("errorMsg", "Unable to change environmental impact description. Please try again !");
                    response.sendRedirect("admin/editVendorProfile.jsp");
                }
            }
            
            //final success message if update were success
            if (i > 0 && !error) {
                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Update Successfully");
                session.setAttribute("successMsg", "Vendor profile updated ! ");
                response.sendRedirect("admin/updateVendorProfile_Admin.jsp");
            }
            
        } catch(SQLException e){
            System.err.println("Error : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
