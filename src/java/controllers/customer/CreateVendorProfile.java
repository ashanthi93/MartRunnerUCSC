package controllers.customer;

import classes.User;
import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateVendorProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        try {
            //start session
            HttpSession session=request.getSession();
            //get vendor od
            String vendorID = request.getParameter("param");
            
            
            if(vendorID !=null){ // check if vendor id is not null
                // create new vendor object
                Vendor vendor=new Vendor();
                //method to get details of selected vendor
                String [] vendorProfileData=vendor.getVendorProfileDetail(vendorID);
                
                if(vendorProfileData!=null){
                    //se attributes of the vendor
                    vendor.setVendorID(vendorID);
                    vendor.setVendorName(vendorProfileData[0]);
                    vendor.setProducts(vendorProfileData[1]);
                    vendor.setVendorType(Integer.valueOf(vendorProfileData[2]));
                    vendor.setProductLevel(Integer.valueOf(vendorProfileData[4]));
                    vendor.setEiLevel(Integer.valueOf(vendorProfileData[5]));
                    vendor.setSiLevel(Integer.valueOf(vendorProfileData[6]));
                    vendor.setAddress(vendorProfileData[7]);
                    vendor.setFixedLine(vendorProfileData[9]);
                    vendor.setFbLink(vendorProfileData[10]);
                    vendor.setTweeter(vendorProfileData[11]);
                    vendor.setgPlus(vendorProfileData[12]);
                    vendor.setDescription(vendorProfileData[13]);
                    
                    //create user object
                    User user=new User();
                    user.setUserContactNo(vendorProfileData[8]);
                    
                    String productCategory=vendorProfileData[3];


                    //set session attributes
                    session.setAttribute("vendor", vendor);
                    session.setAttribute("user", user);
                    session.setAttribute("productCategory", productCategory);

                    
                    //redirect to jsp
                    response.sendRedirect("customer/vendorProfile.jsp");
                }
            }
                                                                        
        }catch(Exception e){
            System.err.println("Exception : " + e);
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
