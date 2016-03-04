package controllers.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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

public class UploadThursdayStallAssigmentSevlet extends HttpServlet {

    //initialize Buffered Image
    BufferedImage image = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        try {

           // Check Whether it is MultipartContent request
            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        InputStream instream = item.getInputStream();
                        image = ImageIO.read(instream);//read image
                    }
                }
                // write image into the file
                ImageIO.write(image, "jpg", new File("D:\\MartRunner\\web\\static\\images\\ThursdayStallAssigment\\out.jpg"));

                // check image is valid or not
                if (image != null) {
                    session.setAttribute("success", 1);
                    session.setAttribute("successHead", "Upload Successfully");
                    session.setAttribute("successMsg", "Stall Assignment upload successfully!");
                    response.sendRedirect("admin/adminHomePage.jsp");
                } else {
                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "Upload Fails");
                    session.setAttribute("errorMsg", "No Image Selected!");
                    response.sendRedirect("admin/uploadStallAssignment.jsp");
                }
            } else {
                // error Occured it is not a multipart content
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "Upload Fails");
                session.setAttribute("errorMsg", "No Image Selected!");
                response.sendRedirect("admin/uploadStallAssignment.jsp");
            }
        } catch (java.lang.IllegalArgumentException ex) {
            session.setAttribute("error", 1);
            session.setAttribute("errorHead", "Upload Fails");
            session.setAttribute("errorMsg", "No Image Selected!");
            response.sendRedirect("admin/uploadStallAssignment.jsp");
        } catch (FileUploadException ex) {
            System.err.println("FileUploadException : " + ex);
        } catch (IOException ex) {
            System.err.println("IOException : " + ex);
        }
    }

}
