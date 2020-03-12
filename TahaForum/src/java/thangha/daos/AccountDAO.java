/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.daos;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import thangha.dtos.AccountDTO;
import thangha.utils.DBUtils;
import thangha.utils.EncryptedServices;

/**
 *
 * @author Admin
 */
public class AccountDAO implements Serializable {

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

    public AccountDTO checkLogin(String email, String password) throws SQLException, NamingException, NoSuchAlgorithmException {
        AccountDTO result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT a.Name, r.Description as RoleDescription, "
                        + "s.Description as StatusDescription "
                        + "FROM Accounts a, Roles r, Status s "
                        + "WHERE Email = ? AND Password = ? "
                        + "AND a.RoleID = r.ID AND a.StatusID = s.ID ";
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                String encryptedPassword = EncryptedServices.encriptPasswordBySHA256(password);
                ps.setString(2, encryptedPassword);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String userName = rs.getString("Name");
                    String role = rs.getString("RoleDescription");
                    String status = rs.getString("StatusDescription");
                    result = new AccountDTO();
                    result.setEmail(email);
                    result.setName(userName);
                    result.setRole(role);
                    result.setStatus(status);
                }
            }
        } finally {
            closeConnection();
        }

        return result;
    }

    public boolean checkExistEmail(String email) throws SQLException, NamingException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Email FROM Accounts WHERE Email = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean registerAccount(AccountDTO dto) throws SQLException, NamingException, NoSuchAlgorithmException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                RoleDAO roleDAO = new RoleDAO();
                int roleID = roleDAO.getRoleIDByDescription(dto.getRole());

                StatusDAO statusDAO = new StatusDAO();
                int statusID = statusDAO.getStatusIDByDescription(dto.getStatus());

                String sql = "INSERT INTO Accounts (Email, Name, Password, RoleID, StatusID) "
                        + "VALUES (?,?,?,?,?);";
                ps = conn.prepareStatement(sql);
                ps.setString(1, dto.getEmail());
                ps.setString(2, dto.getName());
                String encryptedPassword = EncryptedServices.encriptPasswordBySHA256(dto.getPassword());

                ps.setString(3, encryptedPassword);
                ps.setInt(4, roleID);
                ps.setInt(5, statusID);
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getNameByEmail(String email) throws SQLException, NamingException {
        String result = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Name FROM Accounts WHERE Email = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getString("Name");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean activeAccount(AccountDTO dto) throws SQLException, NamingException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Accounts SET StatusID = 2 "
                        + "WHERE Email = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, dto.getEmail());
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
