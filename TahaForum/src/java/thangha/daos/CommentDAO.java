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
import javax.naming.NamingException;
import thangha.dtos.CommentDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class CommentDAO implements Serializable{

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

    public int getNumberOfCommentByArticleID(int articleID) throws SQLException, NamingException {
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ID) AS Result FROM Comments "
                        + "WHERE ArticleID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, articleID);
                if (rs.next()) {
                    result = rs.getInt("Result");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public ArrayList<CommentDTO> getCommentsByArticleID(int articleID) throws SQLException, NamingException {
        ArrayList<CommentDTO> listComments = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Content, ArticleID, CommentatorEmail, CommentDate "
                        + "FROM Comments WHERE ArticleID = ? ORDER BY CommentDate DESC";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, articleID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    String content = rs.getString("Content");
                    int rsArticleID = rs.getInt("ArticleID");
                    String commentatorEmail = rs.getString("CommentatorEmail");
                    
                    Timestamp postingDateSQL = rs.getTimestamp("CommentDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
                    String commentDate = dateFormater.format(postingDateSQL);
                    
                    AccountDAO accountDAO = new AccountDAO();
                    String commentatorName = accountDAO.getNameByEmail(commentatorEmail);
                    
                    CommentDTO commentDTO = new CommentDTO(ID, content, rsArticleID, commentatorEmail, commentatorName, commentDate);
                    listComments.add(commentDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return listComments;
    }

    public boolean addNewComment(CommentDTO commentDTO) throws SQLException, NamingException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Comments (Content, ArticleID, "
                        + "CommentatorEmail, CommentDate) VALUES (?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, commentDTO.getContent());
                ps.setInt(2, commentDTO.getArticleID());
                ps.setString(3, commentDTO.getCommentatorEmail());
                
                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
                ps.setTimestamp(4, timestamp);
                
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
