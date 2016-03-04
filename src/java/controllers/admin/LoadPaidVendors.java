/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import classes.Vendor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoadPaidVendors extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Vendor vendor=new Vendor();
            boolean isExist=false;

            List<String[]> vendorListThr=vendor.getThurdayPaidVendors();
            List<String[]>  allVendors=new ArrayList<String[]>();
            
            if(!(vendorListThr.isEmpty())){
                for(int i=0;i<vendorListThr.size();i++){
                    if(allVendors.isEmpty()){
                        allVendors.add(vendorListThr.get(i));
                         
                    }else if(!(allVendors.isEmpty())){
                        for (int j=0;j<allVendors.size();j++) {
                            String[] x=allVendors.get(j);
                            String[] y=vendorListThr.get(i);
                            if(!(x[2].equals(y[2]))){
                                isExist=false;
                            }else{
                                isExist=true;
                                break;
                            }
                        }
                        if(!isExist){
                            allVendors.add(vendorListThr.get(i));
                            isExist=true;
                        }
                    }
                }
            }
            List<String[]> vendorListSat=vendor.getSaturdayPaidVendors();
             if(!(vendorListSat.isEmpty())){
                for(int i=0;i<vendorListSat.size();i++){
                    if(allVendors.isEmpty()){
                        allVendors.add(vendorListSat.get(i));
                         
                    }else if(!(allVendors.isEmpty())){
                        for (int j=0;j<allVendors.size();j++) {
                            String[] x=allVendors.get(j);
                            String[] y=vendorListSat.get(i);
                            if(!(x[2].equals(y[2]))){
                                isExist=false;
                            }else{
                                isExist=true;
                                break;
                            }
                        }
                        if(!isExist){
                            allVendors.add(vendorListSat.get(i));
                            isExist=true;
                        }
                    }
                }
            }
           
            HttpSession session=request.getSession();
            session.setAttribute("allVendors", allVendors);
            
        
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
