package model;

public class Shop {
    private Integer shopID = null;
    private String shopNAME = null;
    private String shopADDRESS = null;
    private String authorID = null;
    private String detailedINFO = null;
    private String authorNAME = null;

    public Shop(int shopID,String shopNAME,String shopADDRESS,String authorID,String detailedINFO,String authorNAME){
        this.shopID = shopID;
        this.shopNAME = shopNAME;
        this.shopADDRESS = shopADDRESS;
        this.authorID = authorID;
        this.detailedINFO = detailedINFO;
        this.authorNAME = authorNAME;
    }

    public Shop(){

    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }
    public void setShopNAME(String shopNAME) {
        this.shopNAME = shopNAME;
    }
    public void setShopADDRESS(String shopADDRESS) {
        this.shopADDRESS = shopADDRESS;
    }
    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }
    public void setDetailedINFO(String detailedINFO) {
        this.detailedINFO = detailedINFO;
    }
    public void setAuthorNAME(String authorNAME) {
        this.authorNAME = authorNAME;
    }


    public int getShopID(int shopID){
        return this.shopID;
    }
    public String getShopNAME(String shopNAME){
        return this.shopNAME;
    }
    public String getShopADDRESS(String shopADDRESS){
        return this.shopADDRESS;
    }
    public String getAuthorID(String authorID){
        return this.authorID;
    }
    public String getDetailedINFO(String detailedINFO){
        return this.detailedINFO;
    }
    public String getAuthorNAME(String authorNAME){
        return this.authorNAME;
    }
}
