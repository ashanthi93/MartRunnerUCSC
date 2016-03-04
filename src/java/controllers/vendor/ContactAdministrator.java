package controllers.vendor;

import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContactAdministrator extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            HttpSession session = request.getSession();
            String message=request.getParameter("message");
            String userId=(String) session.getAttribute("ID");
            int flag=0;
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String messageTime=dateFormat.format(cal.getTime());
            
            Vendor vendor=new Vendor();
            vendor.setUserID(userId);
            String vendorId=vendor.getIDByUserID();
            
            Vendor messageVendor=new Vendor();
            messageVendor.setVendorID(vendorId);
            messageVendor.setMessage(message);
            messageVendor.setFlag(flag);
            messageVendor.setMessageTime(messageTime);
            
            boolean isSend=messageVendor.sendMessageToAdmin();
            
            if(isSend){

                session.setAttribute("success", 1);
                session.setAttribute("successHead", "Message Sent");
                session.setAttribute("successMsg", "Your message sent to admin!");
                response.sendRedirect("vendor/contactAdmin.jsp");
               
            }else{
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Message Sent Fails");
                session.setAttribute("errorMsg", "Unable to send message!");
                response.sendRedirect("vendor/contactAdmin.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ContactAdministrator.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
