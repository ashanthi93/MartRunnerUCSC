package classes;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.joda.time.LocalDate;

public class Vendor extends User {

    /* Vendor Attributes */
    private String vendorID, vendorName, address, fixedLine, mainCatg, productCatgID, fbLink, gPlus, tweeter;
    private String products, description, restriction, siImpact, envImpact;
    private String marketDays[], attendancePeriodThursday[], attendancePeriodSaturday[];
    private String attendance;
    private int productLevel, pkgLevel, siLevel, eiLevel, vendorType;
    private double stallType;

    //Attrubute for expired date of payments
    Date expiredDate = new Date();

    private int requestId; //Vendor's new product request id
    private int id; //Vendor's message id
    private String message;
    private int flag;
    private String messageTime;

    /* Constructor */
    public Vendor() {
        vendorID = "";
        vendorName = "";
        address = "";
        fixedLine = "";
        mainCatg = "";
        productCatgID = "";
        fbLink = "";
        gPlus = "";
        tweeter = "";
        products = "";
        description = "";
        restriction = "";
        siImpact = "";
        envImpact = "";
        productLevel = 0;
        pkgLevel = 0;
        siLevel = 0;
        eiLevel = 0;
        vendorType = -1;
        stallType = 0;

        expiredDate = null;
        attendancePeriodThursday = null;
        attendancePeriodSaturday = null;
    }

    /*Start of getter methods*/
    public String getVendorID() {
        return vendorID;
    }

    public String getVendorName() {
        return vendorName;
    }

    public String getAddress() {
        return address;
    }

    public String getFixedLine() {
        return fixedLine;
    }

    public String getMainCatg() {
        return mainCatg;
    }

    public String getProductCatgID() {
        return productCatgID;
    }

    public String getFbLink() {
        return fbLink;
    }

    public String getgPlus() {
        return gPlus;
    }

    public String getTweeter() {
        return tweeter;
    }

    public String getProducts() {
        return products;
    }

    public String getDescription() {
        return description;
    }

    public String getRestriction() {
        return restriction;
    }

    public String getSiImpact() {
        return siImpact;
    }

    public String getEnvImpact() {
        return envImpact;
    }

    public int getProductLevel() {
        return productLevel;
    }

    public int getPkgLevel() {
        return pkgLevel;
    }

    public int getSiLevel() {
        return siLevel;
    }

    public int getEiLevel() {
        return eiLevel;
    }

    public String[] getMarketDays() {
        return marketDays;
    }

    public double getStallType() {
        return stallType;
    }

    public int getVendorType() {
        return vendorType;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public String getAttendance() {
        return attendance;
    }

    public String[] getAttendancePeriodThursday() {
        return attendancePeriodThursday;
    }

    public String[] getAttendancePeriodSaturday() {
        return attendancePeriodSaturday;
    }

    public int getId() {
        return id;
    }

    public String getMessage() {
        return message;
    }

    public int getFlag() {
        return flag;
    }

    public String getMessageTime() {
        return messageTime;
    }

    public int getRequestId() {
        return requestId;
    }
    
    /*End of getter methods*/

    /*Start of setter methods*/
    public void setVendorID(String vendorID) {
        this.vendorID = vendorID;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setFixedLine(String fixedLine) {
        this.fixedLine = fixedLine;
    }

    public void setMainCatg(String mainCatg) {
        this.mainCatg = mainCatg;
    }

    public void setProductCatgID(String productCatgID) {
        this.productCatgID = productCatgID;
    }

    public void setFbLink(String fbLink) {
        this.fbLink = fbLink;
    }

    public void setgPlus(String gPlus) {
        this.gPlus = gPlus;
    }

    public void setTweeter(String tweeter) {
        this.tweeter = tweeter;
    }

    public void setProducts(String products) {
        this.products = products;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRestriction(String restriction) {
        this.restriction = restriction;
    }

    public void setSiImpact(String siImpact) {
        this.siImpact = siImpact;
    }

    public void setEnvImpact(String envImpact) {
        this.envImpact = envImpact;
    }

    public void setProductLevel(int productLevel) {
        this.productLevel = productLevel;
    }

    public void setPkgLevel(int pkgLevel) {
        this.pkgLevel = pkgLevel;
    }

    public void setSiLevel(int siLevel) {
        this.siLevel = siLevel;
    }

    public void setEiLevel(int eiLevel) {
        this.eiLevel = eiLevel;
    }

    public void setMarketDays(String[] marketDays) {
        this.marketDays = marketDays;
    }

    public void setStallType(double stallType) {
        this.stallType = stallType;
    }

    public void setVendorType(int vendorType) {
        this.vendorType = vendorType;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    public void setAttendancePeriodThursday(String[] attendancePeriodThursday) {
        this.attendancePeriodThursday = attendancePeriodThursday;
    }

    public void setAttendancePeriodSaturday(String[] attendancePeriodSaturday) {
        this.attendancePeriodSaturday = attendancePeriodSaturday;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public void setMessageTime(String messageTime) {
        this.messageTime = messageTime;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }
    
    /*End of setter methods*/

    /* Start of updateCell method*/
    public boolean updateCellInVendor(String fieldName, String cellValue) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean update = false;                 //to check whether update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update a cell value in vendor table
            query = "UPDATE vendor SET " + fieldName + " = TRIM(Replace(Replace(Replace('" + cellValue + "','\t',''),'\n',''),'\r','')) WHERE userID = '" + this.getUserID() + "'";

            statement = connection.createStatement();

            //to check whether update occurs or not
            if (statement.executeUpdate(query) == 1) {
                update = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close Error: " + e);
                }
            }
        }
        return update;
    }
    /* End of updateCell method*/

    /* Start of updateFixedLine method */
    public boolean updateFixedLine(String cellValue) throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean update = false;             //to check whether update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update fixedLine of a vendor
            query = "UPDATE vendor SET vendorFixedLine = TRIM(Replace(Replace(Replace('" + cellValue + "','\t',''),'\n',''),'\r','')) WHERE userID='" + this.getUserID() + "'";

            statement = connection.createStatement();

            //check whether update occurs or not
            if (statement.executeUpdate(query) == 1) {
                update = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception : " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close Error: " + e);
                }
            }
        }
        return update;
    }
    /* End of updateFixedLine method */

    /* Start of updateVendorCategories method*/
    public boolean updateVendorCategories(String fieldName) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query = null;

        boolean update = false;                 //to check whether update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            if (fieldName.equals("mainCategory")) {
                //query to update a cell value in vendor table
                if (this.getMainCatg().equals("SE")) {
                    query = "UPDATE vendor SET vendorMainCatg ='SE' WHERE userID = '" + this.getUserID() + "'";
                } else if (this.getMainCatg().equals("RB")) {
                    query = "UPDATE vendor SET vendorMainCatg ='RB' WHERE userID = '" + this.getUserID() + "'";
                } else {
                    query = "UPDATE vendor SET vendorMainCatg ='RP' WHERE userID = '" + this.getUserID() + "'";
                }
            } else if (fieldName.equals("productCatg")) {
                //query to update a cell value in vendor table
                if (this.getProductCatgID().equals("AF")) {
                    query = "UPDATE vendor SET productCatgID ='AF' WHERE userID = '" + this.getUserID() + "'";
                } else if (this.getProductCatgID().equals("AH")) {
                    query = "UPDATE vendor SET productCatgID ='AH' WHERE userID = '" + this.getUserID() + "'";
                } else if (this.getProductCatgID().equals("NB")) {
                    query = "UPDATE vendor SET productCatgID ='NB' WHERE userID = '" + this.getUserID() + "'";
                } else if (this.getProductCatgID().equals("OP")) {
                    query = "UPDATE vendor SET productCatgID ='OP' WHERE userID = '" + this.getUserID() + "'";
                } else if (this.getProductCatgID().equals("PF")) {
                    query = "UPDATE vendor SET productCatgID ='PF' WHERE userID = '" + this.getUserID() + "'";
                } else if (this.getProductCatgID().equals("SP")) {
                    query = "UPDATE vendor SET productCatgID ='SP' WHERE userID = '" + this.getUserID() + "'";
                } else {
                    query = "UPDATE vendor SET productCatgID ='TR' WHERE userID = '" + this.getUserID() + "'";
                }
            }

            statement = connection.createStatement();

            //to check whether update occurs or not
            if (statement.executeUpdate(query) == 1) {
                update = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close Error: " + e);
                }
            }
        }
        return update;
    }
    /* End of updateVendorCategories method*/

    /* Start of updateLevel method*/
    public boolean updateLevel(String fieldName, int cellValue) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean update = false;                 //to check whether update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update a cell value in vendor table
            query = "UPDATE vendor SET " + fieldName + " =' " + cellValue + "' WHERE userID = '" + this.getUserID() + "'";

            statement = connection.createStatement();

            //to check whether update occurs or not
            if (statement.executeUpdate(query) == 1) {
                update = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close Error: " + e);
                }
            }
        }
        return update;
    }
    /* End of updateLevel method*/

    /* Start of getIDByName method */
    public String getIDByName() throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get vendorID by vendorName
            query = "SELECT vendorID FROM vendor WHERE vendorName='" + this.getVendorName() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //set vendorID from resultSet
                this.setVendorID(resultSet.getString(1));
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return this.getVendorID();
    }
    /* End of getIDByName method */

    /* Start of getIDByUserID method */
    public String getIDByUserID() throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get vendorID from userID
            query = "SELECT vendorID FROM vendor WHERE userID='" + this.getUserID() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //set vendorID from resultSet
                this.setVendorID(resultSet.getString(1));
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return this.getVendorID();
    }
    /* End of getIDByUserID method */

    /* Start of getUserIDByVendorID method */
    public String getUserIDByVendorID() throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get userID from vendorID
            query = "SELECT userID FROM vendor WHERE vendorID='" + this.getVendorID() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //set userID from resultSet
                this.setUserID(resultSet.getString(1));
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return this.getUserID();
    }
    /* End of getUserIDByVendorID method */

    /* Start of getVendornameByVendorID method */
    public String getVendornameByVendorID() throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get vendorname from vendorID
            query = "SELECT vendorName FROM vendor WHERE vendorID='" + this.getVendorID() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //set vendorName from resultSet
                this.setVendorName(resultSet.getString(1));
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return this.getVendorName();
    }
    /* End of getVendorNameByVendorID method */

    /* Start of checkPayment method */
    public int checkPayment(String day) throws SQLException, ParseException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        int paid = 0;                                           //check user has paid

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            if ("TH".equals(day)) {

                //query to check vendor belongs to thursday market
                query = "SELECT vendorID FROM vendor_market WHERE vendorID = '" + this.getVendorID() + "' and marketDay = 'TH' ";

                resultSet = dbConn.getResult(query, connection);

                if (resultSet.next()) {

                    //query to check vendor inserted in payment table
                    query = "SELECT vendorID FROM payment_th WHERE vendorID = '" + this.getVendorID() + "'";

                    resultSet = dbConn.getResult(query, connection);

                    if (resultSet.next()) {

                        //query to  select payment expiry date
                        query = "SELECT expiredDate FROM payment_th WHERE vendorID = '" + this.getVendorID() + "' ";

                        resultSet = dbConn.getResult(query, connection);

                        if (resultSet.next()) {

                            //get String form of expiry date
                            String expDate = resultSet.getString(1);

                            //Change String to date type and set expiredDate
                            SimpleDateFormat eDate = new SimpleDateFormat("yyyy-MM-dd");
                            this.setExpiredDate(eDate.parse(expDate));

                            paid = 1;               //set ok if user has paid 
                        }
                    } else {
                        paid = -1;                  //set error if vendor doesn't have paid
                    }
                } else {
                    paid = 2;                       //set error if vendor doesn't belong to market
                }
            } else if ("SA".equals(day)) {

                //query to check vendor belongs to saturday market
                query = "SELECT vendorID FROM vendor_market WHERE vendorID = '" + this.getVendorID() + "' and marketDay = 'SA' ";

                resultSet = dbConn.getResult(query, connection);

                if (resultSet.next()) {

                    //query to check vendor inserted into payment table
                    query = "SELECT vendorID FROM payment_sa WHERE vendorID = '" + this.getVendorID() + "'";

                    resultSet = dbConn.getResult(query, connection);

                    if (resultSet.next()) {

                        //query to  select payment expiry date
                        query = "SELECT expiredDate FROM payment_sa WHERE vendorID = '" + this.getVendorID() + "' ";

                        resultSet = dbConn.getResult(query, connection);

                        if (resultSet.next()) {

                            //get String form of expiry date
                            String expDate = resultSet.getString(1);

                            //Change String to date type and set expiredDate
                            SimpleDateFormat eDate = new SimpleDateFormat("yyyy-MM-dd");
                            this.setExpiredDate(eDate.parse(expDate));

                            paid = 1;               //set user has paid 
                        }
                    } else {
                        paid = -1;                  //set error if vendor doesn't have paid
                    }
                } else {
                    paid = 2;                       //set error if vendor doesn't belong to market
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL error : " + e);
        } catch (ParseException e) {
            System.out.println("Parse error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return paid;
    }
    /* End of checkPayment method */

    /* Start of getAttendanceStatus method */
    public String getAttendanceStatus(String day) throws SQLException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        String status = null;                      //to get attendance status

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            Calendar cal = Calendar.getInstance();
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

            if ("TH".equals(day)) {
                if (dayOfWeek == 1) {   //for sunday
                    cal.add(Calendar.DATE, 4);
                } else if (dayOfWeek == 2) {      //for monday
                    cal.add(Calendar.DATE, 3);
                } else if (dayOfWeek == 6) {     //for friday
                    cal.add(Calendar.DATE, 6);
                } else if (dayOfWeek == 7) {     //for saturday
                    cal.add(Calendar.DATE, 5);
                }

                Date date = cal.getTime();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);

                LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
                String dateColumn = this.createDateColumnName(dateCol);

                //query to get attendance status from thursday market
                query = "SELECT " + dateColumn + " FROM attendance_th WHERE vendorID = '" + this.getVendorID() + "'";

                resultSet = dbConn.getResult(query, connection);

                //set attendance status
                if (resultSet.next()) {
                    status = resultSet.getString(1);
                }
            } else {
                //query to get attendance status from saturday market
                if (dayOfWeek == 1) {   //for sunday
                    cal.add(Calendar.DATE, 6);
                } else if (dayOfWeek == 5) {      //for monday
                    cal.add(Calendar.DATE, 3);
                }

                Date date = cal.getTime();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);

                LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
                String dateColumn = this.createDateColumnName(dateCol);

                //query to get attendance status from saturday market
                query = "SELECT " + dateColumn + " FROM attendance_sa WHERE vendorID = '" + this.getVendorID() + "'";

                resultSet = dbConn.getResult(query, connection);

                //set attendance status
                if (resultSet.next()) {
                    status = resultSet.getString(1);
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return status;
    }
    /* End of getAttendanceStatus method */

    /* Start of confirmAttendance method */
    public int confirmAttendance(String day, int status) throws SQLException, ParseException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement;
        String query;

        int change = 0;                      //to get attendance status change

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            Date date = new Date();

            Calendar cal = Calendar.getInstance();
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

            if ("TH".equals(day)) {
                if (dayOfWeek == 1) {   //for sunday
                    cal.add(Calendar.DATE, 4);
                } else if (dayOfWeek == 2) {     //for monday
                    cal.add(Calendar.DATE, 3);
                } else if (dayOfWeek == 6) {     //for friday
                    cal.add(Calendar.DATE, 6);
                } else if (dayOfWeek == 7) {     //for saturday
                    cal.add(Calendar.DATE, 5);
                }

                date = cal.getTime();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);

                LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
                String dateColumn = this.createDateColumnName(dateCol);

                //query to get attendance status from thursday market
                query = "UPDATE attendance_th SET " + dateColumn + " = '" + status + "' WHERE vendorID ='" + this.getVendorID() + "';";

            } else {

                if (dayOfWeek == 1) {   //for sunday
                    cal.add(Calendar.DATE, 6);
                } else if (dayOfWeek == 2) {      //for monday
                    cal.add(Calendar.DATE, 5);
                }

                date = cal.getTime();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);

                LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
                String dateColumn = this.createDateColumnName(dateCol);

                //query to get attendance status from saturday market
                query = "UPDATE attendance_sa SET " + dateColumn + " = '" + status + "' WHERE vendorID = '" + this.getVendorID() + "'";
            }

            System.out.println("Query : " + query);
            
            statement = connection.createStatement();
            int i = statement.executeUpdate(query);

            System.out.println("i : " + i);
            
            //check changes apply
            if (i == 1) {
                change = 1;
            }

            //query to get expiredDate of payment
            if (day.equals("TH")) {
                query = "SELECT expiredDate FROM payment_th WHERE vendorID = '" + this.getVendorID() + "'";
            } else {
                query = "SELECT expiredDate FROM payment_sa WHERE vendorID = '" + this.getVendorID() + "'";
            }

            //execute query
            resultSet = dbConn.getResult(query, connection);

            if (status == 1) {

                if (resultSet.next()) {

                    /* decrement expired date by a week */
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Date expiryDate = format.parse(resultSet.getString(1));

                    if (date.before(expiryDate)) {

                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(expiryDate);
                        calendar.add(Calendar.DAY_OF_MONTH, -7);
                        expiryDate = calendar.getTime();
                        Timestamp newExpiredDate = new Timestamp(expiryDate.getTime());

                        //query to update payment by a week
                        if (day.equals("TH")) {
                            query = "UPDATE payment_th SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + this.getVendorID() + "'";
                        } else {
                            query = "UPDATE payment_sa SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + this.getVendorID() + "'";
                        }
                        
                        //execute update
                        int j = statement.executeUpdate(query);
                        
                        System.out.println("j ::" + j);

                        if (j == 1) {
                            change = 1;
                        } else {
                            change = -1;
                        }
                    } else {
                        change = 1;
                    }
                }
            } else {

                if (resultSet.next()) {

                    /* increment expired date by a week */
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Date expiryDate = format.parse(resultSet.getString(1));
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(expiryDate);
                    calendar.add(Calendar.WEEK_OF_YEAR, 1);
                    expiryDate = calendar.getTime();
                    Timestamp newExpiredDate = new Timestamp(expiryDate.getTime());

                    //query to update payment by a week
                    if (day.equals("TH")) {
                        query = "UPDATE payment_th SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + this.getVendorID() + "'";
                    } else {
                        query = "UPDATE payment_sa SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + this.getVendorID() + "'";
                    }

                    //execute update
                    int j = statement.executeUpdate(query);

                    System.out.println("j ::" + j);
                    
                    if (j == 1) {
                        change = 1;
                    } else {
                        change = -1;
                    }
                }
            }
            
            System.out.println("Catch : " + change);
            
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close error : " + e);
                }
            }
        }
        return change;
    }
    /* End of confirmAttendance method */

    /* Start of getProfileEditDetails method */
    public boolean getProfileEditDetails() throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        boolean get = false;
        try {
            /* set user details */
            get = this.getProfileDetails();

            if (get) {
                dbConn = new DatabaseConnection();
                connection = dbConn.setConnection();

                //query to get vendor details
                query = "SELECT vendorName, vendorFixedLine,address, fbLink, tweeterLink, gPlusLink FROM vendor WHERE vendorID = '" + this.getVendorID() + "' ";

                //execute query to get results
                resultSet = dbConn.getResult(query, connection);

                /* set vendor details */
                if (resultSet.next()) {
                    this.setVendorName(resultSet.getString(1));
                    this.setFixedLine(resultSet.getString(2));
                    this.setAddress(resultSet.getString(3));
                    this.setFbLink(resultSet.getString(4));
                    this.setTweeter(resultSet.getString(5));
                    this.setgPlus(resultSet.getString(6));
                    get = true;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close error : " + e);
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
        return get;
    }
    /* End of getProfileEditDetails method */

    public List<String[]> getThurdayPaidVendors() {
        List<String[]> vendorList = new ArrayList<String[]>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT p.paymentThID,p.vendorId, v.vendorName FROM Payment_th p,Vendor v WHERE (p.hidden=0) AND (p.vendorId=v.vendorId)";

            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                String[] detailArray = new String[3];
                for (int i = 0; i < detailArray.length; i++) {
                    detailArray[i] = resultSet.getString(i + 1);
                }
                vendorList.add(detailArray);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return vendorList;
        }

    }

    public List<String[]> getSaturdayPaidVendors() {
        List<String[]> vendorList = new ArrayList<String[]>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT p.paymentSaID,p.vendorId, v.vendorName FROM payment_sa p,Vendor v WHERE (p.hidden=0) AND (p.vendorId=v.vendorId)";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                String[] detailArray = new String[3];
                for (int i = 0; i < detailArray.length; i++) {
                    detailArray[i] = resultSet.getString(i + 1);
                    System.out.println("i" + i);
                }
                vendorList.add(detailArray);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return vendorList;
        }

    }

    public List<ResultList> getTravelVendors() {
        List<ResultList> vendorList = new ArrayList<ResultList>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT v.vendorID,v.vendorName FROM vendor v,product_category p WHERE (v.productCatgID=p.productCatgID) AND(p.productCatgID='TR')";
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                ResultList resultList = new ResultList();
                resultList.setVendorID(resultSet.getString(1));
                resultList.setVendorName(resultSet.getString(2));
                vendorList.add(resultList);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return vendorList;
        }

    }

    public String[] getVendorProfileDetail(String vendorID) {
        String[] dataList = new String[14];
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT v.vendorName,v.products,v.vendorType,p.productCatgName,v.productLevel,v.eiLevel,v.siLevel,v.address,u.userContactNo,v.vendorFixedLine,v.fbLink,v.tweeterLink,v.gPlusLink ,v.description FROM vendor v, user u, product_category p WHERE (v.vendorID='" + vendorID + "') AND (v.userID=u.userID) AND(v.productCatgID=p.productCatgID)";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {

                for (int i = 0; i < dataList.length; i++) {
                    dataList[i] = resultSet.getString(i + 1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return dataList;
        }

    }

    public String[] getThursdayPaymentDetails() {
        String[] detailArray = new String[3];
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT paymentThID,paidDate,expiredDate FROM payment_th  WHERE (hidden=0) AND (vendorId='" + this.vendorID + "')";

            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                for (int i = 0; i < detailArray.length; i++) {
                    detailArray[i] = resultSet.getString(i + 1);
                }
            } else {
                detailArray = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return detailArray;
        }
    }

    public String[] getSaturdayPaymentDetails() {
        String[] detailArray = new String[3];
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT paymentSaID,paidDate,expiredDate FROM payment_sa  WHERE (hidden=0) AND (vendorId='" + this.vendorID + "')";

            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                for (int i = 0; i < detailArray.length; i++) {
                    detailArray[i] = resultSet.getString(i + 1);

                }
            } else {
                detailArray = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return detailArray;
        }
    }

    public List<Object[]> getStallDetails() {
        List<Object[]> stallDetails = new ArrayList<Object[]>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT marketDay,stallType FROM vendor_market WHERE (hidden=0) AND (vendorID='" + this.vendorID + "')";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Object[] details = new Object[2];
                details[0] = resultSet.getString("marketDay");
                details[1] = resultSet.getDouble("stallType");
                stallDetails.add(details);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return stallDetails;
        }
    }

    public Double getVendorStallTypeById() {
        Double stall = -1.0;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT m.stallType FROM vendor v, vendor_market m WHERE (v.vendorID='" + this.vendorID + "') AND (v.vendorID=m.vendorID)";

            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                stall = resultSet.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return stall;
        }

    }

    public boolean sendMessageToAdmin() {
        boolean isSend = false;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "INSERT INTO message_vendor(vendorId,message,messageTime,flag) VALUES('" + this.getVendorID() + "','" + this.getMessage() + "','" + this.getMessageTime() + "','" + this.getFlag() + "')";

            int x = statement.executeUpdate(query);
            isSend = (x > 0);
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isSend;
        }

    }

    public String getVendorIdByUserId() {
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT vendorID FROM vendor WHERE (userID='" + this.getUserID() + "')";
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                this.vendorID = resultSet.getString("vendorID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return this.vendorID;
        }
    }

    public List<Customer> viewAllMessagedCustomers() {
        List<Customer> messageList = new ArrayList<Customer>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_customer_to_vendor WHERE (vendorID='" + this.getVendorID() + "') order by email";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Customer messageCustomer = new Customer();
                messageCustomer.setId(resultSet.getInt("id"));
                messageCustomer.setCustomername(resultSet.getString("customerName"));
                messageCustomer.setCustomeremail(resultSet.getString("email"));
                messageCustomer.setContactno(resultSet.getString("contactNo"));
                messageCustomer.setMessage(resultSet.getString("message"));
                messageCustomer.setFlag(resultSet.getInt("flag"));
                messageCustomer.setMessageTime(resultSet.getString("messageTime"));
                messageList.add(messageCustomer);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return messageList;
        }
    }

    public List<Customer> viewAllCustomerMessages(String email) {
        List<Customer> messageList = new ArrayList<Customer>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_customer_to_vendor WHERE(email='" + email + "') AND (vendorID='" + this.getVendorID() + "') order by email";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Customer messageCustomer = new Customer();
                messageCustomer.setId(resultSet.getInt("id"));
                messageCustomer.setCustomername(resultSet.getString("customerName"));
                messageCustomer.setCustomeremail(resultSet.getString("email"));
                messageCustomer.setContactno(resultSet.getString("contactNo"));
                messageCustomer.setMessage(resultSet.getString("message"));
                messageCustomer.setFlag(resultSet.getInt("flag"));
                messageCustomer.setMessageTime(resultSet.getString("messageTime"));
                messageList.add(messageCustomer);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            System.out.println("message list admin class:" + messageList.size());
            return messageList;
        }
    }

    public List<Customer> viewCustomerMessages() {
        List<Customer> messageList = new ArrayList();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_customer_to_vendor WHERE (vendorID='" + this.getVendorID() + "') AND (flag=0)";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setId(resultSet.getInt("ID"));
                customer.setCustomername(resultSet.getString("customerName"));
                customer.setContactno(resultSet.getString("contactNo"));
                customer.setCustomeremail(resultSet.getString("email"));
                customer.setMessage(resultSet.getString("message"));
                customer.setMessageTime(resultSet.getString("messageTime"));
                customer.setFlag(resultSet.getInt("flag"));

                messageList.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return messageList;
        }

    }
    
    public boolean sendProductRequest() {
        boolean isAdded = false;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "INSERT INTO productrequests_vendor(vendorId,productName,productDescription,requestTime,flag) VALUES('" + this.getVendorID() + "','" + this.getProducts() + "','" + this.getDescription() + "','" + this.getMessageTime() + "'," + this.getFlag() + ")";
            isAdded = (statement.executeUpdate(query) > 0);

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isAdded;
        }
    }
    
    public boolean approveProductRequest() {
        boolean isApproved = false;
        boolean isUpdated = false;
        String existingProducts = "";
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT products FROM vendor WHERE (vendorID='" + this.getVendorID() + "')";
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                existingProducts = resultSet.getString("products");
            }
            existingProducts = existingProducts.concat(",");
            existingProducts = existingProducts.concat(this.getProducts());

            query = "UPDATE vendor SET products='" + existingProducts + "' WHERE (vendorID='" + this.getVendorID() + "')";
            isUpdated = (statement.executeUpdate(query) > 0);

            if (isUpdated) {
                query = "UPDATE productrequests_vendor SET flag=1 WHERE (requestId='" + this.getRequestId() + "') ";
                isApproved = (statement.executeUpdate(query) > 0);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isApproved;
        }
    }

    public boolean rejectProductRequest() {
        boolean isRejected = false;

        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE productrequests_vendor SET flag=-1 WHERE (requestId='" + this.getRequestId() + "') ";
            isRejected = (statement.executeUpdate(query) > 0);

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isRejected;
        }
    }

    public String getVendorIdByRequestId() {
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT vendorId FROM productrequests_vendor WHERE (requestId='" + this.getRequestId() + "')";
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                this.setVendorID(resultSet.getString("vendorId"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return this.vendorID;
        }
    }

    public String getProductNameByRequestId() {
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT productName FROM productrequests_vendor WHERE (requestId='" + this.getRequestId() + "')";
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                this.setProducts(resultSet.getString("productName"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return this.products;
        }
    }
    
    public int[] sendPromotionalPostUploadRequest() {
        boolean isSend = false;
        boolean isExist = false;
        int[] returnValue = new int[2];
        returnValue[0] = 0;
        returnValue[1] = 0;

        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM vendor_posts WHERE (flag=0)";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                if (resultSet.getString("vendorId").equals(this.getVendorID())) {
                    isExist = true;
                    returnValue[0] = 1;
                    break;
                }
            }
            if (!isExist) {
                query = "INSERT INTO vendor_posts(vendorId,requestTime,flag) VALUES('" + this.getVendorID() + "','" + this.getMessageTime() + "'," + this.getFlag() + ")";
                isSend = (statement.executeUpdate(query) > 0);
                if (isSend) {
                    returnValue[1] = 1;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return returnValue;
        }

    }
    
    public boolean approvePostRequest() {
        boolean isApproved = false;

        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE  vendor_posts SET flag=1 WHERE (postId='" + this.getRequestId() + "') ";
            isApproved = (statement.executeUpdate(query) > 0);

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isApproved;
        }
    }
    
    public String getVendorIDByPostRequest(){
        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        
        try{
        
            connection = dbConn.setConnection();
            
            String query = "SELECT vendorId FROM vendor_posts WHERE postId = '" + this.getRequestId() + "' ";
            
            resultSet = dbConn.getResult(query, connection);
            
            if(resultSet.next()){
                this.setVendorID(resultSet.getString(1));
            }
            
        }catch(Exception e){
            System.err.println("Exception : " + e);
        }
        return this.getVendorID();
    }

    public boolean rejectPostRequest() {
        boolean isApproved = false;

        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE  vendor_posts SET flag=-1 WHERE (postId='" + this.getRequestId() + "') ";
            isApproved = (statement.executeUpdate(query) > 0);

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isApproved;
        }
    }
    
    public String getEmailByPostRequestId() {
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT u.userEmail FROM user u, vendor v, vendor_posts p WHERE (u.userID=v.userID) AND (v.vendorID=p.vendorID) AND (p.postId='" + this.getRequestId() + "')";
            ResultSet resultSet= statement.executeQuery(query);
            if(resultSet.next()){
                this.setUserEmail(resultSet.getString("userEmail"));
           }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return this.getUserEmail();
        }
    }
    
    public String getEmailByProductRequestId() {
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT u.userEmail FROM user u, vendor v, productrequests_vendor p WHERE (u.userID=v.userID) AND (v.vendorID=p.vendorID) AND (p.requestId='" + this.getRequestId() + "')";
            ResultSet resultSet= statement.executeQuery(query);
            if(resultSet.next()){
                this.setUserEmail(resultSet.getString("userEmail"));
           }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return this.getUserEmail();
        }
    }
}
