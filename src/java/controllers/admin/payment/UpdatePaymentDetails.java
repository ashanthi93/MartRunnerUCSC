package controllers.admin.payment;

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


public class UpdatePaymentDetails extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String vendorId=request.getParameter("vendorName"); //Retreiving selected vendor Id 
            System.out.println(vendorId);
           
            Vendor vendor=new Vendor();
            vendor.setVendorID(vendorId);
            String name=vendor.getVendornameByVendorID();//Retreiving selected vendor's name by ID
            
            List<Object[]> stallDetails=vendor.getStallDetails(); //Retreiving selected vendor's stall details
            List<String[]> passingValues=new ArrayList<String[]>();
            
            if(!(stallDetails.isEmpty())){
                for(int i=0;i<stallDetails.size();i++){
                    Object[] ob=stallDetails.get(i);
                    //Setting stall type when market day is Thursday
                    if(ob[0].equals("TH")){
                        String marketDay="Thursday";
                        String stallType="";
                        if(Double.parseDouble(ob[1]+"")==0.5){
                            stallType="Half Stall"; 
                        }else if(Double.parseDouble(ob[1]+"")==1.0){
                            stallType="Full Stall";
                        }else if(Double.parseDouble(ob[1]+"")==2.0){
                            stallType="Two Stalls";
                        }
                        //Get the current Thursday payment details of the vendor
                        String[] paymentDetails=vendor.getThursdayPaymentDetails();
                       
                        if(paymentDetails!=null){
                            
                            String[] values=new String[5];
                            values[0]=name;
                            values[1]=paymentDetails[1];
                            values[2]=marketDay;
                            values[3]=stallType;
                            values[4]=paymentDetails[2];
                            passingValues.add(values);
                        }
                    }
                    
                     //Setting stall type when market day is Saturday
                    if(ob[0].equals("SA")){
                        String marketDay="Saturday";
                        String stallType="";
                        if(Double.parseDouble(ob[1]+"")==0.5){
                            stallType="Half Stall"; 
                        }else if(Double.parseDouble(ob[1]+"")==1.0){
                            stallType="Full Stall";
                        }else if(Double.parseDouble(ob[1]+"")==2.0){
                            stallType="Two Stalls";
                        }
                        
                          //Get the current Thursday payment details of the vendor
                        String[] paymentDetails=vendor.getSaturdayPaymentDetails();
                         
                        if(paymentDetails!=null){
                            
                            String[] values=new String[5];
                            values[0]=name;
                            values[1]=paymentDetails[1];
                            values[2]=marketDay;
                            values[3]=stallType;
                            values[4]=paymentDetails[2];
                            passingValues.add(values);
                        }
                    }
                }
                HttpSession session=request.getSession();
                session.setAttribute("passingValues", passingValues); //Setting the payment details to session
                response.sendRedirect("admin/updatingPaymentDetails.jsp"); //redirecting to the JSP page
            
            }
        
        } catch (SQLException ex) {
                Logger.getLogger(UpdatePaymentDetails.class.getName()).log(Level.SEVERE, null, ex);
             
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
    }// </editor-fold>

}
