package controllers.customer;

import classes.Admin;
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


public class searchVendorOrganic extends HttpServlet {
    String productCategory, query;
    ArrayList<String> resultList = new ArrayList<String>();
    Admin admin = new Admin();
    List answer;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //start session
            HttpSession session = request.getSession();
            //method to get organic product vendors
            answer = admin.searchByProductCategory("OP");
            
            if (answer.isEmpty()) { // if there are no travel vendors
                out.println("<script type=\"text/javascript\">");
                out.println("alert('No Vendors in this Category!!!');");
                out.println("location='../index.jsp';");
                out.println("</script>");

            } else {
                // set session attribute
                session.setAttribute("SearchResults", answer);
            }
        } catch (Exception e) {
            System.err.println(e);
            
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(searchVendorOrganic.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(searchVendorOrganic.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
