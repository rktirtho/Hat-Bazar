/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.beans.Product;
import com.dao.ProductDBHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

/**
 *
 * @author DELL
 */
@WebServlet(urlPatterns = {"/ProductRegistation"})
public class ProductRegistation extends HttpServlet {

    Product product = new Product();

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
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");

            String savePath = "C:\\Users\\DELL\\Documents\\NetBeansProjects\\HatBajar\\web\\images\\productModel";

            // File file=new File(savePath);
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            Part part = request.getPart("filename");
            String fileName = extractFileName(part);
            product.setName(request.getParameter(ProductDBHelper.NAME));
            product.setCategory(request.getParameter(ProductDBHelper.CATEGORY));
            product.setType(request.getParameter(ProductDBHelper.TYPE));
            product.setLocation(request.getParameter(ProductDBHelper.LOCATION));
            product.setAuthorId(Integer.parseInt(request.getParameter(ProductDBHelper.AUTHOR_ID)));
            product.setUnit(Integer.parseInt(request.getParameter(ProductDBHelper.UNIT)));
            product.setUnitSize(request.getParameter(ProductDBHelper.UNIT_SIZE));
            product.setUnitPrize(Float.parseFloat(request.getParameter(ProductDBHelper.UNIT_PRICE)));

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-ddHH-mm-ss");
            LocalDateTime now = LocalDateTime.now();

            product.setView(0);
            product.setDescription(request.getParameter(ProductDBHelper.DESCRIPTION));
            String imageName = product.getAuthorId() + dtf.format(now) + ".jpg";
            product.setImage(imageName);

            out.println("<title>Servlet MedicinesRegister</title>");

            int status = ProductDBHelper.save(product);
            part.write(savePath + File.separator + imageName);
            response.sendRedirect("post-ad?sts=" + status);
            out.println("</head>");
            out.println("<body>");

            out.println("<a href=\"medicine-registration\"><h3>Go Back</h3></a>");
            out.println("</body>");
            out.println("</html>");

// 
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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
