package classes;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SMS {
    String message, mobileNum;

    public SMS(String message, String mobileNum) {
        this.message = message;
        this.mobileNum = mobileNum;
    }

    public String getMessage() {
        return message;
    }

    public String getMobileNum() {
        return mobileNum;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setMobileNum(String mobileNum) {
        this.mobileNum = mobileNum;
    }
    
    public String searchMobileNumber() throws SQLException{
        String vendorID = "";
        
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        
        String query;
        
        try{
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();
            
            query = "SELECT v.vendorID FROM vendor v JOIN user u ON v.userID = u.userID WHERE u.userContactNo = '" + this.getMobileNum() + "'";
            
            resultSet = dbConn.getResult(query, connection);
            
            if(resultSet.next()){
                vendorID = resultSet.getString(1);
            }
            
        }catch(SQLException e){
            System.err.println("SQLError : " + e);
        }finally{
            resultSet.close();
            connection.close();
        }
        return vendorID;
    }
}
