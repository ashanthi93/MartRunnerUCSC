package controllers.admin.payment;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdatePayment_Final extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String name=request.getParameter("name"); //retriving selected vendor name
            String marketDay=request.getParameter("day"); //retriving market day
            String stallType=request.getParameter("stall"); //retriving stall type
            
            HttpSession session=request.getSession();
            session.setAttribute("finalUpdateName", name); //Setting vendor name to the session
            session.setAttribute("finalUpdateMarketDay", marketDay); //Setting market day to the session
            session.setAttribute("finalUpdateStallType", stallType); //Setting stall type to the session
            
            response.sendRedirect("admin/updatePayment_Final.jsp");
        } finally {
            
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
    }

}
