/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(MainController.class.getName());

    private final String USER_LOGIN = "login.jsp";
    private final String LOGIN = "LoginController";
    private final String LOGOUT = "LogoutController";
    private final String REGISTER = "RegisterController";
    private final String VERIFICATION = "VerificationController";
    private final String SEARCH = "SearchController";
    private final String POST_NEW_ARTICLE = "PostNewArticleController";
    private final String VIEW_ARTICLE_DETAILS = "ViewArticleDetailsController";
    private final String POST_COMMENT = "PostCommentController";
    
    private final String ADMIN_VIEW_ARTICLE_DETAILS = "AdminViewArticleDetailsController";
    private final String ADMIN_APPROVE_ARTICLE = "AdminApproveArticleController";
    private final String ADMIN_DELETE_ARTICLE = "AdminDeleteArticleController";
    private final String ADMIN_SEARCH_ARTICLE = "AdminSearchArticleController";

    private final String ERROR = "index.jsp";

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
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("User_Login")) {
                url = USER_LOGIN;
            } else if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Register")) {
                url = REGISTER;
            } else if (action.equals("FinishRegister")) {
                url = VERIFICATION;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Post_New_Article")) {
                url = POST_NEW_ARTICLE;
            } else if (action.equals("View_Article_Details")) {
                url = VIEW_ARTICLE_DETAILS;
            } else if (action.equals("Post_Comment")) {
                url = POST_COMMENT;
            } else if (action.equals("Admin_View_Article_Details")) {
                url = ADMIN_VIEW_ARTICLE_DETAILS;
            } else if (action.equals("Admin_Approve_Article")) {
                url = ADMIN_APPROVE_ARTICLE;
            } else if (action.equals("Admin_Delete_Article")) {
                url = ADMIN_DELETE_ARTICLE;
            } else if (action.equals("Admin_Article_Search")) {
                url = ADMIN_SEARCH_ARTICLE;
            }
        } catch (Exception e) {
            LOGGER.error("Error at MainController: " + e.toString());
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
