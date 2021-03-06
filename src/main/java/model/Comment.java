package model;

public class Comment {
    private Integer commentId = null;
    private String commentAuthorId = null;
    private String commentDetail = null;
    private Integer shopId = null;
    private String commentAuthorName = null;

    public Comment(int commentId,String commentAuthorId,String commentDetail,int shopId,String commentAuthorName){
        this.commentId = commentId;
        this.commentAuthorId = commentAuthorId;
        this.commentDetail = commentDetail;
        this.shopId = shopId;
        this.commentAuthorName = commentAuthorName;
    }

    public Comment(){
    }


    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
    public void setCommentAuthorId(String commentAuthorId) {
        this.commentAuthorId = commentAuthorId;
    }
    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }
    public void setShopId(int shopId) {
        this.shopId = shopId;
    }
    public void setCommentAuthorName(String commentAuthorName) {
        this.commentAuthorName = commentAuthorName;
    }


    public int getCommentId(int commentId){
        return this.commentId;
    }
    public String getCommentAuthorName(String commentAuthorName){
        return this.commentAuthorName;
    }
    public String getCommentDetail(String commentDetail){
        return this.commentDetail;
    }
    public String getCommentAuthorId(String commentAuthorId){
        return this.commentAuthorId;
    }
    public Integer getShopId(int shopId){
        return this.shopId;
    }
}
