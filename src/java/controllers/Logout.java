package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        //remove session attributes
        session.removeAttribute("User");
        session.removeAttribute("ID");
        session.removeAttribute("vendorID");
        session.removeAttribute("privilage");
        session.removeAttribute("LastName");
        session.removeAttribute("NIC");
        session.removeAttribute("MobileNo");
        session.removeAttribute("Email");
        session.removeAttribute("vendorName");
        session.removeAttribute("fixedLine");
        session.removeAttribute("fb");
        session.removeAttribute("tweet");
        session.removeAttribute("g+");
        
        session.invalidate();
        
        response.sendRedirect("index.jsp");
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
