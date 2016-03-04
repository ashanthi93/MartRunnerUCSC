package classes;

public class BlacklistVendors extends Vendor {

    //attributes
    private String blackListReason,blacklistDate;

    //constructor
    public BlacklistVendors() {
        blackListReason = "";
    }

    /* setter methods */
    public void setBlackListReason(String blackListReason) {
        this.blackListReason = blackListReason;
    }

    public void setBlacklistDate(String blacklistDate) {
        this.blacklistDate = blacklistDate;
    }

    /* getter methods */
    public String getBlackListReason() {
        return blackListReason;
    }

    public String getBlacklistDate() {
        return blacklistDate;
    }
    
}
