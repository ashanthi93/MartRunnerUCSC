package controllers.admin.searchVendors;

import classes.Admin;
import java.io.IOException;
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

public class searchVendorByMarket extends HttpServlet {

    String marketDays[];             //arrray to hold selected market days  

    Admin admin = new Admin();          //create admin object to call the method

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            //set selected market days from jsp page
            marketDays = request.getParameterValues("marketDay");

            List vendorList = new ArrayList();                    //vendorList to hold vendor objects

            //get vendor list by searchMarketType method
            vendorList = admin.searchByMarketType(marketDays);

            HttpSession session = request.getSession();

            if (vendorList.isEmpty()) {

                /* set error message if there are no vendors */
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMSg", "There are no vendors to load !");
                response.sendRedirect("admin/adminHomePage.jsp");

            } else {

                int i = 0;
                for (String day : marketDays) {
                    if (day.equals("TH")) {
                        marketDays[i] = "Thursday Market";
                    } else if (day.equals("SA")) {
                        marketDays[i] = "Saturday Market";
                    } else {
                        marketDays[i] = "Good Market Shop";
                    }
                    i++;
                }

                //set session attribute to pass vendor list
                session.setAttribute("SearchResults", vendorList);
                session.setAttribute("marketDaysSelected", marketDays);
                response.sendRedirect("admin/searchResult_MarketDay.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(searchVendorByMarket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(searchVendorByMarket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
