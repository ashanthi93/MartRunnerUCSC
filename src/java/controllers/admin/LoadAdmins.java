package controllers.admin;

import classes.Admin;
import classes.SuperAdmin;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadAdmins extends HttpServlet {

    List<Admin> adminList;                  //to load list
    
    SuperAdmin superAdmin = new SuperAdmin();             //create superadmin object to call the method
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            
            superAdmin.setUserID((String)session.getAttribute("ID"));                   //set admin id of calling admin
            
            adminList = superAdmin.loadAdmins();                 //call method to load admins
            
            if(adminList.size()>0){                         //set attribute to pass adminList
                
                session.setAttribute("adminList",adminList);                
                
            }else{                                         //error message if there are no admin to remove                                    
                
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Load Fails");
                session.setAttribute("errorMsg", "Unable to load admin list !");
                response.sendRedirect("admin/adminHomePage.jsp");
            }
            
        } catch(SQLException e){
            System.err.println("SQLException : " + e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoadAdmins.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoadAdmins.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
