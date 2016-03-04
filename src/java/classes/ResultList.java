package classes;

public class ResultList {
    private String vendorID, vendorName;

    public ResultList() {
        this.vendorID = "";
        this.vendorName = "";
    }

    public String getVendorID() {
        return vendorID;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorID(String vendorID) {
        this.vendorID = vendorID;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }
}
