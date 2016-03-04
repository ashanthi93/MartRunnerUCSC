package controllers.admin.viewMessages;

import classes.Admin;

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

public class ViewAllMessagedVendors extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //start session
            HttpSession session=request.getSession();
            //create admin object
            Admin admin=new Admin();
            //method to load all messages of vendor
            List<Vendor> messageList=admin.viewAllMessagedVendors();
            
            List<Vendor> allMessageNameList=new ArrayList<Vendor>();
            List<String> idList=new ArrayList<String>();
             if(!(messageList.isEmpty())){
                for (Vendor messageVendor : messageList) {
                    Vendor vendor=new Vendor();
                    vendor.setVendorID(messageVendor.getVendorID());
                    String name = vendor.getVendornameByVendorID();
                    vendor.setVendorName(name);
                    
                    if(!(idList.contains(vendor.getVendorID()))){
                        allMessageNameList.add(vendor);
                        idList.add(messageVendor.getVendorID());
                    }
                }
             }
             //set session attributes
            session.setAttribute("allMessageNameList",allMessageNameList );
            
        } catch (SQLException ex) {
            Logger.getLogger(ViewAllMessages_Vendor.class.getName()).log(Level.SEVERE, null, ex);
                    
        } finally {
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
