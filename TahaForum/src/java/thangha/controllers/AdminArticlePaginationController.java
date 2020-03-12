/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.daos.ArticleDAO;
import thangha.dtos.ArticleDTO;

/**
 *
 * @author Admin
 */
public class AdminArticlePaginationController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(MainController.class.getName());

    private final String SUCCESS = "admin.jsp";

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
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            String pattern = (String) session.getAttribute("pattern");
            String searchStatus = (String) session.getAttribute("search_status");

            String spageid = request.getParameter("page");
            if (spageid == null) {
                spageid = "1";
            }
            int pageID = Integer.parseInt(spageid);
            int total = 20;
            if (pageID == 1) {
                pageID = pageID - 1;
            } else {
                pageID = pageID - 1;
                pageID = pageID * total;
            }

            ArticleDAO articleDAO = new ArticleDAO();
            List<ArticleDTO> indexList = articleDAO.getListArticle(pattern, searchStatus, pageID, total);

            int numberOfArticles = articleDAO.getNumberOfArticleByTitleAndStatus(pattern, searchStatus);
            if (numberOfArticles == 0) {
                request.setAttribute("SEARCH_MESSAGE", "There are no article to display!");
            } else {
                int numberOfPage = (numberOfArticles - 1) / total + 1;
                ArrayList<Integer> listPage = new ArrayList<>();
                for (int i = 1; i <= numberOfPage; i++) {
                    listPage.add(i);
                }
                request.setAttribute("LIST_ARTICLE", indexList);
                request.setAttribute("NB_PAGE", listPage);
            }

        } catch (Exception e) {
            LOGGER.error("Error at AdminArticlePaginationController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
