package controllers.admin.searchVendors;

import classes.Admin;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class searchVendorByProductCatg extends HttpServlet {

    String productCategory;             //attribute to get selected product category
    Admin admin = new Admin();          //create admin object to call the method

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            //get selected product category
            productCategory = request.getParameter("productCategory");

            List vendorList = new ArrayList();                  //vendorList to hold vendor objects

            //get results from searchByProductCategory method
            vendorList = admin.searchByProductCategory(productCategory);

            HttpSession session = request.getSession();

            /* set error message if there are no vendors */
            if (vendorList.isEmpty()) {

                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMSg", "There are no vendors to load !");
                response.sendRedirect("admin/adminHomePage.jsp");

            } else {

                if (productCategory.equals("OP")) {
                    productCategory = "Organic Products";
                } else if (productCategory.equals("AF")) {
                    productCategory = "Animal based Farm Products";
                } else if (productCategory.equals("PF")) {
                    productCategory = "Prepared Foods";
                } else if (productCategory.equals("NB")) {
                    productCategory = "Natural Body & Home";
                } else if (productCategory.equals("AH")) {
                    productCategory = "Art & Handicrafts";
                } else if (productCategory.equals("TR")) {
                    productCategory = "Travel";
                } else {
                    productCategory = "Service Providers";
                }

                //set session attribute to pass vendor list
                session.setAttribute("SearchResults", vendorList);
                session.setAttribute("productCategory", productCategory);
                response.sendRedirect("admin/searchResult_ProductCategory.jsp");
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
