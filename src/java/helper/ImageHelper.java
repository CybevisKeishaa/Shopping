/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;

/**
 *
 * @author Anonymous
 */
public class ImageHelper {

    private final String SAVE_URL = "/img/";
    private final String PROJECT_PATH ;
    
    public ImageHelper(HttpServlet servlet){
        this.PROJECT_PATH = servlet.getServletContext().getRealPath(SAVE_URL);
    }

    public  String processImageUpload(Part imagePart, String imgName) throws IOException, ServletException {
        // Ensure that the image part is not null
        if (imagePart == null) {
            throw new ServletException("Image part is missing");
        }
        // Make sure the directory exists
        File uploadDir = new File(PROJECT_PATH);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String contentType = getExtensionFromContentType(imagePart.getContentType());
        // Generate the complete path to save the image
        String imagePath = uploadDir + File.separator + imgName + contentType;

        // Write the image to the directory
        try (InputStream input = imagePart.getInputStream()) {
            Files.copy(input, Paths.get(imagePath), StandardCopyOption.REPLACE_EXISTING);
        }
        // Return the relative URL path that can be used to access the image
        return imgName + contentType;
    }

    public String getExtensionFromContentType(String contentType) {
        switch (contentType) {
            case "image/jpeg":
                return ".jpg";
            case "image/png":
                return ".png";
            case "image/gif":
                return ".gif";
            default:
                return "." + contentType.split("/")[1]; // Unsupported type
        }
    }
}
