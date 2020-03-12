/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CommentDTO implements Serializable{
    private int ID;
    private String content;
    private int articleID;
    private String commentatorEmail;
    private String commentatorName;
    private String commentDate;

    public CommentDTO() {
    }

    public CommentDTO(String content, int articleID, String commentatorEmail) {
        this.content = content;
        this.articleID = articleID;
        this.commentatorEmail = commentatorEmail;
    }

    public CommentDTO(int ID, String content, int articleID, String commentatorEmail, String commentatorName) {
        this.ID = ID;
        this.content = content;
        this.articleID = articleID;
        this.commentatorEmail = commentatorEmail;
        this.commentatorName = commentatorName;
    }

    public CommentDTO(int ID, String content, int articleID, String commentatorEmail, String commentatorName, String commentDate) {
        this.ID = ID;
        this.content = content;
        this.articleID = articleID;
        this.commentatorEmail = commentatorEmail;
        this.commentatorName = commentatorName;
        this.commentDate = commentDate;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public String getCommentatorEmail() {
        return commentatorEmail;
    }

    public void setCommentatorEmail(String commentatorEmail) {
        this.commentatorEmail = commentatorEmail;
    }

    public String getCommentatorName() {
        return commentatorName;
    }

    public void setCommentatorName(String commentatorName) {
        this.commentatorName = commentatorName;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }
}
