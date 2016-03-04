/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.vendor;

import classes.Vendor;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author user
 */
public class AddPosts extends HttpServlet {

    BufferedImage image = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Come to servlet");

        HttpSession session = request.getSession();
        try {
            String vendorId = (String) session.getAttribute("vendorID");
            int flag = 0;

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String messageTime = dateFormat.format(cal.getTime());

            Vendor vendor = new Vendor();
            vendor.setVendorID(vendorId);
            vendor.setMessageTime(messageTime);
            vendor.setFlag(flag);
            int[] returnVal = vendor.sendPromotionalPostUploadRequest();

            boolean isSend = false;
            boolean isExist = false;

            if (returnVal[0] == 1) {
                isExist = true;
            }
            if (returnVal[1] == 1) {
                isSend = true;
            }

            // Check Whether it is MultipartContent request
            if (ServletFileUpload.isMultipartContent(request)) {

                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        System.out.println("1");

                        InputStream instream = item.getInputStream();
                        image = ImageIO.read(instream);//read image from inputStream
                    }
                }
                // write image into the file
                
                ImageIO.write(image, "jpg", new File("D:\\MartRunner\\web\\static\\images\\VendorPromotionalPost\\" + vendorId + ".jpg"));
                // check image is valid or not
                if (image != null) {
                    if (isSend) {
                        session.setAttribute("success", 1);
                        session.setAttribute("successHead", "Upload Successfully");
                        session.setAttribute("successMsg", "Image uploaded successfully!");
                        response.sendRedirect("vendor/addPosts.jsp");

                    } else if (!isSend && isExist) {
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Request Fails");
                        session.setAttribute("errorMsg", "Cannot send request.Earlier Request is pending!");
                        response.sendRedirect("vendor/addPosts.jsp");

                        //request.setAttribute("message", "Sorry this    Servlet only handles file upload request");
                    } else if (!isSend) {
                        session.setAttribute("error", 1);
                        session.setAttribute("errorHead", "Request Fails");
                        session.setAttribute("errorMsg", "Request sending failed");
                        response.sendRedirect("vendor/addPosts.jsp");

                        //request.setAttribute("message", "Sorry this    Servlet only handles file upload request");
                    }

                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Upload Fails");
                    session.setAttribute("errorMsg", "No Image Selected!");
                    response.sendRedirect("vendor/addPosts.jsp");
                }
            } else {
                // error Occured it is not a multipart content
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Upload Fails");
                session.setAttribute("errorMsg", "No Image Selected!");
                response.sendRedirect("vendor/addPosts.jsp");
            }

        } catch (java.lang.IllegalArgumentException ex) {
            session.setAttribute("error", 1);
            session.setAttribute("errorHead", "Upload Fails");
            session.setAttribute("errorMsg", "No Image Selected!");
            response.sendRedirect("vendor/addPosts.jsp");

        } catch (FileUploadException ex) {
            System.err.println("FileUploadException : " + ex);
        } catch (IOException ex) {
            System.err.println("IOException : " + ex);
        }

    //request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

}
