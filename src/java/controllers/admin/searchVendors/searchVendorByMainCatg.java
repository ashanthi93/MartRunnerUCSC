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

public class searchVendorByMainCatg extends HttpServlet {

    String mainCategory;                //variable to hold main cateogry selected
    
    Admin admin = new Admin();              //create admin object to call method
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            
            HttpSession session = request.getSession();
            
            mainCategory = request.getParameter("mainCatg");        //get selected main cateogry
    
            List vendorList = new ArrayList();                        //vendor list to hold vendor objects       
             
            //call searchByMainCategory method to get vendorList
            vendorList = admin.searchByMainCategory(mainCategory);      
            
            //error message if vednor list is empty
            if (vendorList.isEmpty()) {
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMSg", "There are no vendors to load !");
                response.sendRedirect("admin/adminHomePage.jsp");
                
            } else {
                
                if (mainCategory.equals("RP")){
                    
                    mainCategory = "Rural Producer";
                    
                }else if(mainCategory.equals("SE")){
                    
                    mainCategory = "Social Enterprise";
                    
                }else{
                    
                    mainCategory = "Responsible Business";
                }
                
                //set session attribute to pass vendor list
                session.setAttribute("SearchResults", vendorList);
                session.setAttribute("mainCategory", mainCategory);
                response.sendRedirect("admin/searchResult_MainCategory.jsp");
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
