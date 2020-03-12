/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.naming.NamingException;
import thangha.dtos.ArticleDTO;
import thangha.dtos.CommentDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ArticleDAO implements Serializable {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean postNewArticle(ArticleDTO articleDTO) throws SQLException, NamingException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Articles (Title, ShortDescription, "
                        + "Content, AuthorEmail, PostingDate, StatusID) "
                        + "VALUES (?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, articleDTO.getTitle());
                ps.setString(2, articleDTO.getShortDescription());
                ps.setString(3, articleDTO.getContent());
                ps.setString(4, articleDTO.getAuthorEmail());

                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
                ps.setTimestamp(5, timestamp);

                ps.setInt(6, 1);

                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ArticleDTO> getListArticleAvailable(String pattern, int start, int total) throws SQLException, NamingException {
        List<ArticleDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Title, ShortDescription, Content, AuthorEmail, "
                        + "PostingDate FROM Articles WHERE StatusID = 2 "
                        + "AND Title LIKE ? ORDER BY PostingDate DESC "
                        + "OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + pattern + "%");
                ps.setInt(2, start);
                ps.setInt(3, total);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    String title = rs.getString("Title");
                    String shortDescription = rs.getString("ShortDescription");
                    String content = rs.getString("Content");
                    String authorEmail = rs.getString("AuthorEmail");

                    Timestamp postingDateSQL = rs.getTimestamp("PostingDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy");
                    String postingDate = dateFormater.format(postingDateSQL);

                    CommentDAO commentDAO = new CommentDAO();
                    ArrayList<CommentDTO> listComments = commentDAO.getCommentsByArticleID(ID);

                    AccountDAO accountDAO = new AccountDAO();
                    String authorName = accountDAO.getNameByEmail(authorEmail);

                    ArticleDTO articleDTO = new ArticleDTO(ID, title, shortDescription, content, authorEmail, authorName, postingDate, listComments);

                    list.add(articleDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getNumberOfAvailableArticleByTitle(String pattern) throws SQLException, NamingException {
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ID) AS Result FROM Articles "
                        + "WHERE StatusID = 2 AND Title LIKE ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + pattern + "%");
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("Result");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberOfArticleByTitleAndStatus(String pattern, String searchStatus) throws NamingException, SQLException {
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ID) AS Result FROM Articles "
                        + "WHERE Title LIKE ?";
                if (!searchStatus.equals("All")) {
                    StatusDAO statusDAO = new StatusDAO();
                    int statusID = statusDAO.getStatusIDByDescription(searchStatus);
                    sql = sql + " AND StatusID = " + statusID;
                }
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + pattern + "%");
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("Result");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public ArticleDTO getArticleDetailsByID(int articleID) throws SQLException, NamingException {
        ArticleDTO articleDTO = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Title, ShortDescription, Content, AuthorEmail, "
                        + "PostingDate FROM Articles WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, articleID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String title = rs.getString("Title");
                    String shortDescription = rs.getString("ShortDescription");
                    String content = rs.getString("Content");
                    String authorEmail = rs.getString("AuthorEmail");

                    Timestamp postingDateSQL = rs.getTimestamp("PostingDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy");
                    String postingDate = dateFormater.format(postingDateSQL);

                    CommentDAO commentDAO = new CommentDAO();
                    ArrayList<CommentDTO> listComments = commentDAO.getCommentsByArticleID(articleID);

                    AccountDAO accountDAO = new AccountDAO();
                    String authorName = accountDAO.getNameByEmail(authorEmail);

                    articleDTO = new ArticleDTO(articleID, title, shortDescription, content, authorEmail, authorName, postingDate, listComments);
                }
            }
        } finally {
            closeConnection();
        }
        return articleDTO;
    }

    public boolean checkExistArticleByID(int articleID) throws SQLException, NamingException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM Articles "
                        + "WHERE ID = ? AND StatusID = 2";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, articleID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ArticleDTO> getListArticle(String pattern, String searchStatus, int start, int total) throws NamingException, SQLException {
        List<ArticleDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Title, ShortDescription, Content, AuthorEmail, "
                        + "PostingDate, StatusID FROM Articles "
                        + "WHERE Title LIKE ?";
                if (!searchStatus.equals("All")) {
                    StatusDAO statusDAO = new StatusDAO();
                    int statusID = statusDAO.getStatusIDByDescription(searchStatus);
                    sql = sql + " AND StatusID = " + statusID;
                }
                sql = sql + " ORDER BY PostingDate DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + pattern + "%");
                ps.setInt(2, start);
                ps.setInt(3, total);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    String title = rs.getString("Title");
                    String shortDescription = rs.getString("ShortDescription");
                    String content = rs.getString("Content");
                    String authorEmail = rs.getString("AuthorEmail");
                    int statusID = rs.getInt("StatusID");

                    Timestamp postingDateSQL = rs.getTimestamp("PostingDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy");
                    String postingDate = dateFormater.format(postingDateSQL);

                    CommentDAO commentDAO = new CommentDAO();
                    ArrayList<CommentDTO> listComments = commentDAO.getCommentsByArticleID(ID);

                    AccountDAO accountDAO = new AccountDAO();
                    String authorName = accountDAO.getNameByEmail(authorEmail);

                    StatusDAO statusDAO = new StatusDAO();
                    String statusDescription = statusDAO.getStatusDescriptionByID(statusID);

                    ArticleDTO articleDTO = new ArticleDTO(ID, title, shortDescription, content, authorEmail, authorName, postingDate, listComments, statusDescription);

                    list.add(articleDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean approveArticle(int articleID) throws NamingException, SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Articles SET StatusID = ? WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 2);
                ps.setInt(2, articleID);
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteArticle(int articleID) throws NamingException, SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Articles SET StatusID = ? WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 3);
                ps.setInt(2, articleID);
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
