package classes;

public class HiddenVendors extends Vendor {

    //attributes
    private String hiddenReason, hideDate;

    //constructor
    public HiddenVendors() {
        hiddenReason = "";
    }

    /* getter methods */
    public String getHiddenReason() {
        return hiddenReason;
    }

    public void setHideDate(String hideDate) {
        this.hideDate = hideDate;
    }  
    
    /* setter methods */
    public void setHiddenReason(String hiddenReason) {
        this.hiddenReason = hiddenReason;
    }

    public String getHideDate() {
        return hideDate;
    }
    
}
