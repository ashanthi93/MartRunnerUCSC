
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


public class RemovePaymentDetails extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String vendorId=request.getParameter("vendorName");//retriving vendor ID of the selected vendor
            Vendor vendor=new Vendor();
            vendor.setVendorID(vendorId);
            String name=vendor.getVendornameByVendorID();//retriving related vendor name using the ID
            
            List<Object[]> stallDetails=vendor.getStallDetails();//retriving the stall details of the selected vendor
            List<String[]> passingValues=new ArrayList<String[]>();
            
            //If stall details are available
            if(!(stallDetails.isEmpty())){
                for(int i=0;i<stallDetails.size();i++){
                    Object[] ob=stallDetails.get(i);
                    //When market day equals to Thursday
                    if(ob[0].equals("TH")){
                        String marketDay="Thursday";
                        String stallType="";
                        
                         //Setting values for stall type
                        if(Double.parseDouble(ob[1]+"")==0.5){
                            stallType="Half Stall"; 
                        }else if(Double.parseDouble(ob[1]+"")==1.0){
                            stallType="Full Stall";
                        }else if(Double.parseDouble(ob[1]+"")==2.0){
                            stallType="Two Stalls";
                        }
                        // retreiving paymentThID,paidDate,expiredDate of the related vendor
                        String[] paymentDetails=vendor.getThursdayPaymentDetails();
                       
                        //Setting values to the array---passingValues
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
                    //When market day equals to Saturday
                    if(ob[0].equals("SA")){
                        String marketDay="Saturday";
                        String stallType="";
                        
                        //Setting values for the stall type
                        if(Double.parseDouble(ob[1]+"")==0.5){
                            stallType="Half Stall"; 
                        }else if(Double.parseDouble(ob[1]+"")==1.0){
                            stallType="Full Stall";
                        }else if(Double.parseDouble(ob[1]+"")==2.0){
                            stallType="Two Stalls";
                        }
                        
                        // retreiving paymentSaID,paidDate,expiredDate of the related vendor
                        String[] paymentDetails=vendor.getSaturdayPaymentDetails();
                         
                        //Setting values to the array---passingValues
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
                session.setAttribute("passingValues", passingValues); //Setting the array(**passingValues) to the session
                response.sendRedirect("admin/removingPaymentDetails.jsp");//Redirecting to removingPaymentDetails.jsp page
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(RemovePaymentDetails.class.getName()).log(Level.SEVERE, null, ex);
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
