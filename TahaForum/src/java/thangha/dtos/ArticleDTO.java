/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ArticleDTO implements Serializable {

    private int ID;
    private String title;
    private String shortDescription;
    private String content;
    private String authorEmail;
    private String authorName;
    private String date;
    private ArrayList<CommentDTO> comments;
    private String status;

    public ArticleDTO() {
    }

    public ArticleDTO(String title, String shortDescription, String content, String authorEmail) {
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.authorEmail = authorEmail;
    }

    public ArticleDTO(int ID, String title, String shortDescription, String content, String authorEmail, String authorName, String date) {
        this.ID = ID;
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.authorEmail = authorEmail;
        this.authorName = authorName;
        this.date = date;
    }
    
    public ArticleDTO(int ID, String title, String shortDescription, String content, String authorEmail, String authorName, String date, ArrayList<CommentDTO> comments) {
        this.ID = ID;
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.authorEmail = authorEmail;
        this.authorName = authorName;
        this.date = date;
        this.comments = comments;
    }

    public ArticleDTO(int ID, String title, String shortDescription, String content, String authorEmail, String authorName, String date, ArrayList<CommentDTO> comments, String status) {
        this.ID = ID;
        this.title = title;
        this.shortDescription = shortDescription;
        this.content = content;
        this.authorEmail = authorEmail;
        this.authorName = authorName;
        this.date = date;
        this.comments = comments;
        this.status = status;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthorEmail() {
        return authorEmail;
    }

    public void setAuthorEmail(String authorEmail) {
        this.authorEmail = authorEmail;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public ArrayList<CommentDTO> getComments() {
        return comments;
    }

    public void setComments(ArrayList<CommentDTO> comments) {
        this.comments = comments;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
