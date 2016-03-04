package classes;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.joda.time.LocalDate;

public class Customer {

    private String customername, customeremail, feedback, contactno, messageTime, message;
    private int flag, messageID, id;

    public Customer() {
        this.messageID = 0;
        this.customername = "";
        this.customeremail = "";
        this.feedback = "";
        this.contactno = "";
        this.flag = 0;
    }

    public Customer(String customername, String customeremail, String contactno, String messageTime, String message, int id, int flag) {
        this.customername = customername;
        this.customeremail = customeremail;
        this.contactno = contactno;
        this.messageTime = messageTime;
        this.message = message;
        this.id = id;
        this.flag = flag;
    }

    public Customer(String customername, String customeremail, String contactno, String message, String messageTime, int flag) {
        this.customername = customername;
        this.customeremail = customeremail;
        this.contactno = contactno;
        this.message = message;
        this.messageTime = messageTime;
        this.flag = flag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(String messageTime) {
        this.messageTime = messageTime;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getCustomeremail() {
        return customeremail;
    }

    public void setCustomeremail(String customeremail) {
        this.customeremail = customeremail;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getContactno() {
        return contactno;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public boolean addMessageCustomer() {
        Connection connection;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean inserted = false;
        try {
            int k;
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query for insert message
            query = "INSERT INTO message_customer (customername,email,contactno,message,flag) VALUES ('" + this.getCustomername() + "','" + this.getCustomeremail() + "','" + this.getContactno() + "','" + this.getFeedback() + "','0')";

            statement = connection.createStatement();
            k = statement.executeUpdate(query);
            if (k == 1) {
                inserted = true;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return inserted;
    }

    public boolean updateMessageFlag(int id) {
        DatabaseConnection dbConn;
        Connection connection = null;
        Statement statement;
        String query;
        int i = 0;
        boolean inserted = false;
        int ID = id;
        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            query = "UPDATE message_customer SET flag=1 where ID='" + ID + "'";

            statement = connection.createStatement();
            i = statement.executeUpdate(query);
            if (i > 0) {
                inserted = true;
            }

        } catch (Exception e) {
            System.out.println("SQL ERROR: " + e);
        }
        return inserted;
    }

    public boolean sendMessageToVendor(String vendorID) {
        boolean isSent = false;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();

            String query = "INSERT INTO message_customer_to_vendor(customerName,contactNo,email,message,flag,messageTime,vendorID) VALUES('" + this.getCustomername() + "','" + this.getContactno() + "','" + this.getCustomeremail() + "','" + this.getMessage() + "'," + this.getFlag() + ",'" + this.getMessageTime() + "','" + vendorID + "');";
            Statement statement = connection.createStatement();
            isSent = (statement.executeUpdate(query) > 0);
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isSent;
        }
    }

    public boolean updateFlag_CustomerMessageToVendor() {
        boolean isUpdated = false;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE message_customer_to_vendor SET flag=1 WHERE(ID='" + this.getId() + "')";
            isUpdated = (statement.executeUpdate(query) > 0);

        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isUpdated;
        }

    }
    
    //method for get saturday vendor list//
    public List<Vendor> getSaturdayVendorList() throws SQLException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;

        String query1;

        List<Vendor> results = new ArrayList();

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            query1 = "SELECT v.vendorID, v.vendorName FROM vendor_market m JOIN vendor v ON v.vendorID=m.vendorID WHERE m.marketDay='SA';";

            resultSet = dbConn.getResult(query1, connection);

            while (resultSet.next()) {
                Vendor resultList = new Vendor();

                resultList.setVendorID(resultSet.getString(1));
                resultList.setVendorName(resultSet.getString(2));

                results.add(resultList);
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }
        return results;
    }

    //_____________________________________________________________________________________________________________________________________________//
    //Method for get Thursday vendor list// 
     public List<Vendor> getThursdayVendorList() throws SQLException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;

        String query = "";

        List<Vendor> results = new ArrayList();

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            query = "SELECT v.vendorID, v.vendorName FROM vendor_market m JOIN vendor v ON v.vendorID=m.vendorID WHERE m.marketDay='TH';";

            resultSet = dbConn.getResult(query, connection);

            while (resultSet.next()) {
                Vendor resultList = new Vendor();

                resultList.setVendorID(resultSet.getString(1));
                resultList.setVendorName(resultSet.getString(2));

                results.add(resultList);
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }
        return results;
    }
   
    //____________________________________________________________________________________________________________________________________________//
     public List<Vendor> getMarketVendorList() throws SQLException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;

        String query = "";

        List<Vendor> results = new ArrayList();

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            query = "SELECT v.vendorID, v.vendorName FROM vendor_market m JOIN vendor v ON v.vendorID=m.vendorID WHERE m.marketDay='GM';";

            resultSet = dbConn.getResult(query, connection);

            while (resultSet.next()) {
                Vendor resultList = new Vendor();

                resultList.setVendorID(resultSet.getString(1));
                resultList.setVendorName(resultSet.getString(2));

                results.add(resultList);
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }
        return results;
    }
     
     //_____________________________________________________________________________________________________________________________________________//
     public List<Vendor> loadVendorsAttendingSaturday() {

        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Vendor> saturdayAttendVendors = new ArrayList();           //array to hold paid vendor list

        try {
            connection = databaseConnection.setConnection();

            /* create date for current market day from current day*/
            Calendar cal = Calendar.getInstance();
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

            if (dayOfWeek == 1) {                   //for sunday
                cal.add(Calendar.DATE, 6);
            } else if (dayOfWeek == 2) {            //for monday
                cal.add(Calendar.DATE, 5);
            } else if (dayOfWeek == 3) {            //for tuesday
                cal.add(Calendar.DATE, 4);
            } else if (dayOfWeek == 4) {            //for wednesday
                cal.add(Calendar.DATE, 3);
            } else if (dayOfWeek == 5) {            //for thursday
                cal.add(Calendar.DATE, 2);
            } else if (dayOfWeek == 6) {             //for friday
                cal.add(Calendar.DATE, 1);
            } else {                                 //for saturday
                cal.add(Calendar.DATE, 0);
            }

            Date date = cal.getTime();
            cal.setTime(date);
            LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
            System.out.println("Date : " + dateCol);
            String dateColumn = this.createDateColumnName(dateCol);

            //query to get paid vendors for current week
            query = "SELECT DISTINCT a.vendorID, v.vendorName, a." + dateColumn + " FROM attendance_sa a JOIN vendor v ON v.vendorID = a.vendorID JOIN payment_sa p ON p.vendorID = a.vendorID WHERE p.expiredDate >= '" + dateColumn + "'";
            System.out.println("Query : " + query);

            //execute query to get results
            resultSet = databaseConnection.getResult(query, connection);

            /*add vendors from resultlist to array*/
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));
                vendor.setAttendance(resultSet.getString(3));

                saturdayAttendVendors.add(vendor);
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("ResultSet close error : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close error : " + e);
                }
            }
        }
        return saturdayAttendVendors;
    }
     
     //_______________________________________________________________________________________________________________________________//
     public List<Vendor> loadVendorsAttendingThursday() {

        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Vendor> thursdayAttendVendors = new ArrayList();           //array to hold paid vendor list

        try {
            connection = databaseConnection.setConnection();

            /* create date for current market day from current day*/
            Calendar cal = Calendar.getInstance();
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

            if (dayOfWeek == 1) {                   //for sunday
                cal.add(Calendar.DATE, 4);
            } else if (dayOfWeek == 2) {            //for monday
                cal.add(Calendar.DATE, 3);
            } else if (dayOfWeek == 3) {            //for tuesday
                cal.add(Calendar.DATE, 2);
            } else if (dayOfWeek == 4) {            //for wednesday
                cal.add(Calendar.DATE, 1);
            } else if (dayOfWeek == 5) {            //for thursday
                cal.add(Calendar.DATE, 0);
            } else if (dayOfWeek == 6) {             //for friday
                cal.add(Calendar.DATE, 6);
            } else {                                 //for saturday
                cal.add(Calendar.DATE, 5);
            }

            Date date = cal.getTime();
            cal.setTime(date);
            LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
            System.out.println("Date : " + dateCol);
            String dateColumn = this.createDateColumnName(dateCol);

            //query to get paid vendors for current week
            query = "SELECT DISTINCT a.vendorID, v.vendorName, a." + dateColumn + " FROM attendance_th a JOIN vendor v ON v.vendorID = a.vendorID JOIN payment_th p ON p.vendorID = a.vendorID WHERE p.expiredDate >= '" + dateColumn + "' ORDER BY vendorName";

            System.out.println("Query : " + query);

            //execute query to get results
            resultSet = databaseConnection.getResult(query, connection);

            //add vendors to vendor list
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));
                vendor.setAttendance(resultSet.getString(3));

                thursdayAttendVendors.add(vendor);
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("ResultSet close error : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close error : " + e);
                }
            }
        }
        return thursdayAttendVendors;
    }
     
     //_________________________________________________//
     public String createDateColumnName(LocalDate date) {
        int y = date.getYear();
        int m = date.getMonthOfYear();
        int d = date.getDayOfMonth();

        /* create dateColumn according to column name style */
        String dateColumn = Integer.toString(y) + "_";

        if (String.valueOf(m).length() == 1) {
            dateColumn += "0" + Integer.toString(m) + "_";
        } else {
            dateColumn += Integer.toString(m) + "_";
        }

        if (String.valueOf(d).length() == 1) {
            dateColumn += "0" + Integer.toString(d);
        } else {
            dateColumn += Integer.toString(d);
        }
        return dateColumn;
    }
     
     //________________________________________________//
     public List<Vendor> loadRemainVendors(String day, List<String> paidVendorListID) {
        
        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;
        
        List<Vendor> remainVendors = new ArrayList();           //array to hold remainig vendors 

        try {
            connection = dbConn.setConnection();

            //qquery to get vendors belong to seperate market days
            if (day.equals("TH")) {
                query = "SELECT DISTINCT v.vendorID, v.vendorName FROM vendor v JOIN vendor_market m ON m.vendorID = v.vendorID WHERE m.marketDay = 'TH' ORDER BY v.vendorName";
            } else {
                query = "SELECT DISTINCT v.vendorID, v.vendorName FROM vendor v JOIN vendor_market m ON m.vendorID = v.vendorID WHERE m.marketDay = 'SA' ORDER BY v.vendorName";
            }

            //execute query to get results
            resultSet = dbConn.getResult(query, connection);

            /* add vendors to leftVendorList  */
            while (resultSet.next()) {
                Vendor vendor = new Vendor();
                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));
                
                //add vendors who did not confirm attendance earlier
                if(!(paidVendorListID.contains(vendor.getVendorID()))){
                    remainVendors.add(vendor);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("ResultSet close error : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close error : " + e);
                }
            }
        }
        return remainVendors;
    }
}
