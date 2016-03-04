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
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.joda.time.*;

public class Admin extends User {

    /* Start of RegisterUser method */
    public boolean RegisterUser(User user, Connection connection, DatabaseConnection dbConn) throws SQLException {

        Statement statement;
        String query;

        boolean inserted = false;               //To find whether vendor inserted into the database

        try {

            //set userID of new user from calculateUserID method
            user.setUserID(this.calculateUserID(connection, dbConn));

            //set password of new user from random password method
            user.setUserPwd(this.randomPassword());

            //set userPrivilage
            user.setUserPrivilage(2);

            //query to insert new user to user table 
            query = "INSERT INTO user (userID,userFirstName,userLastName,userPwd,userNIC,userEmail,userContactNo,userPrivilage) VALUES ('" + user.getUserID() + "','" + user.getUserFirstname() + "','" + user.getUserLastName() + "','" + user.getUserPwd() + "','" + user.getUserNIC() + "','" + user.getUserEmail() + "','" + user.getUserContactNo() + "','" + user.getUserPrivilage() + "')";

            statement = connection.createStatement();
            int i = statement.executeUpdate(query);

            if (i == 1) {
                inserted = true;                            //Check whether user is inserted into user table
            }

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return inserted;
    }
    /* End of RegisterUser method */

    /* Start of calculateUserID method */
    public String calculateUserID(Connection connection, DatabaseConnection dbConn) {

        ResultSet resultSet;
        String query, lastID, newID = null;
        int id;

        try {
            //query to find last userID from user table
            query = "SELECT userID FROM user ORDER BY userID DESC LIMIT 1";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //get lastID form user table
                lastID = resultSet.getString(1);

                //increment userID
                id = Integer.parseInt(lastID.substring(1));
                id += 1;

                //set new userID
                newID = "u" + String.valueOf(id);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        }
        return newID;
    }
    /* End of calculateUserID method */

    /* Start of randomPassword method */
    public String randomPassword() {
        char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
        StringBuilder pass = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 20; i++) {
            char c = chars[random.nextInt(chars.length)];
            pass.append(c);
        }
        String rPassword = pass.toString();
        return rPassword;
    }
    /* End of randomPassword method */

    /* Start of registerVendor method */
    public boolean RegisterVendor(Vendor vendor) throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean inserted = false;           //To find whether vendor is inserted into the database

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //Register vendor as a user
            inserted = this.RegisterUser(vendor, connection, dbConn);

            if (inserted) {
                //set vendorID from calculateVendorID method
                vendor.setVendorID(calculateVendorID(connection, dbConn));

                int hidden = 0;

                //query to insert vendor into vendor table
                query = "INSERT INTO vendor VALUES ('" + vendor.getVendorID() + "','" + vendor.getUserID() + "','" + vendor.getVendorName() + "','" + vendor.getFixedLine() + "','" + vendor.getAddress() + "','" + vendor.getVendorType() + "','" + vendor.getMainCatg() + "','" + vendor.getProductCatgID() + "','" + vendor.getProductLevel() + "','" + vendor.getEiLevel() + "','" + vendor.getSiLevel() + "','" + vendor.getPkgLevel() + "','" + vendor.getFbLink() + "','" + vendor.getTweeter() + "','" + vendor.getgPlus() + "','" + vendor.getProducts() + "','" + vendor.getDescription() + "','" + vendor.getRestriction() + "','" + vendor.getSiImpact() + "','" + vendor.getEnvImpact() + "','0')";

                statement = connection.createStatement();
                int j = statement.executeUpdate(query);

                //check whether vendor is inserted into vendor table
                if (j == 1) {
                    //set market details of vendor and check insertion is valid
                    inserted = this.setMarketDetails(connection, dbConn, vendor);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception : " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close error : " + e);
                }
            }
        }
        return inserted;
    }
    /* End of registerVendor method*/

    /* Start of calculateVendorID method */
    public String calculateVendorID(Connection connection, DatabaseConnection dbConn) {

        ResultSet resultSet;
        String query, lastID, newID = null;
        int id;

        try {
            //query to get last vendorID from vendor table
            query = "SELECT vendorID FROM vendor ORDER BY vendorID DESC LIMIT 1";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //set lastID form resultset
                lastID = resultSet.getString(1);

                //increment id
                id = Integer.parseInt(lastID.substring(1));
                id += 1;

                //set new vendorID
                newID = "v" + String.valueOf(id);
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception : " + e);
        }
        return newID;
    }
    /* End of calculateVendorID method */

    /* Start of setMarketDetails method */
    public boolean setMarketDetails(Connection connection, DatabaseConnection dbConn, Vendor vendor) {

        Statement statement;
        String query;
        boolean inserted = false;                               //To find whether marketDetails added to the database
        double nSatllType;                                      //To set stall type for GM(Good Market Shop) vendors
        int k;

        try {
            for (String m : vendor.getMarketDays()) {
                if ("GM".equals(m)) {
                    nSatllType = 0.0;

                    //query to insert vendors belong to GM(Good Market Shop)
                    query = "INSERT INTO vendor_market VALUES ('" + vendor.getVendorID() + "','" + m + "','" + nSatllType + "','0')";
                } else {
                    //query to insert vednors belong to other market days
                    query = "INSERT INTO vendor_market VALUES ('" + vendor.getVendorID() + "','" + m + "','" + vendor.getStallType() + "','0')";
                }

                statement = connection.createStatement();
                k = statement.executeUpdate(query);

                //check whether market details inserted to the tables
                if (k == 1) {
                    inserted = true;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        }
        return inserted;
    }
    /* End of setMarketDetails method */

    /* Start of searchByMainCategory method */
    public List<Vendor> searchByMainCategory(String mainCategory) throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query = "";

        List<Vendor> vendorList = new ArrayList();          //arraylist to hold vendor objects

        try {

            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            /*query to get vendor list from vendor datbale accroding to main category*/
            if ("SE".equals(mainCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE vendorMainCatg='SE' AND hidden='0' ORDER BY vendorName";
            } else if ("RP".equals(mainCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE vendorMainCatg='RP' AND hidden='0' ORDER BY vendorName";
            } else if ("RB".equals(mainCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE vendorMainCatg='RB' AND hidden='0' ORDER BY vendorName";
            }

            //get results 
            resultSet = dbConn.getResult(query, connection);

            /* add vendor objects to vendorlist */
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));

                vendorList.add(vendor);
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
        return vendorList;
    }
    /* End of searchByMainCategory method */

    /* Start of searchByProductCategory method */
    public List<Vendor> searchByProductCategory(String productCategory) throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query = "";

        List<Vendor> vendorList = new ArrayList();              //arraylist to hold vendor objects

        try {

            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            /*query to get vendor list from vendor datbale accroding to product category*/
            if ("OP".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='OP' AND hidden='0' ORDER BY vendorName";
            } else if ("AF".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='AF' AND hidden='0' ORDER BY vendorName";
            } else if ("PF".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='PF' AND hidden='0' ORDER BY vendorName";
            } else if ("NB".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='NB' AND hidden='0' ORDER BY vendorName";
            } else if ("AH".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='AH' AND hidden='0' ORDER BY vendorName";
            } else if ("TR".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='TR' AND hidden='0' ORDER BY vendorName";
            } else if ("SP".equals(productCategory)) {
                query = "SELECT vendorID,vendorName FROM vendor WHERE productCatgID='SP' AND hidden='0' ORDER BY vendorName";
            }

            //get results
            resultSet = dbConn.getResult(query, connection);

            /* add vendor objects to vendorlist */
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));

                vendorList.add(vendor);
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
        return vendorList;
    }
    /* End of searchByProductCategory method */

    /* Start of searchByMarketType method */
    public List<Vendor> searchByMarketType(String marketDays[]) throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query = null;

        List<Vendor> vendorList = new ArrayList();          //vendorList to hold vendor objects

        try {

            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            if (marketDays.length == 3) {

                //query if all market days were selected
                query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor_market t2 ON t1.vendorID = t2.vendorID JOIN vendor_market t3 ON t1.vendorID = t3.vendorID JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'TH' AND t2.marketDay='SA' AND t3.marketDay='GM' AND t1.hidden='0';";

            } else if (marketDays.length == 2) {

                //query if two market days selected
                if ("TH".equals(marketDays[0]) && "SA".equals(marketDays[1])) {

                    query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor_market t2 ON t1.vendorID = t2.vendorID JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'TH' AND t2.marketDay='SA' AND t1.hidden='0'";

                } else if ("TH".equals(marketDays[0]) && "GM".equals(marketDays[1])) {

                    query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor_market t2 ON t1.vendorID = t2.vendorID JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'TH' AND t2.marketDay='GM' AND t1.hidden='0'";

                } else if ("SA".equals(marketDays[0]) && "GM".equals(marketDays[1])) {

                    query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor_market t2 ON t1.vendorID = t2.vendorID JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'SA' AND t2.marketDay='GM' AND t1.hidden='0'";

                }
            } else if (marketDays.length == 1) {

                //query if one marketDay selected
                if ("TH".equals(marketDays[0])) {

                    query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'TH' AND t1.hidden='0' ORDER BY vendorName";

                } else if ("SA".equals(marketDays[0])) {

                    query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'SA' AND t1.hidden='0' ORDER BY vendorName";

                } else if ("GM".equals(marketDays[0])) {

                    query = "SELECT v.vendorID, v.vendorName FROM vendor_market t1 JOIN vendor v ON t1.vendorID = v.vendorID WHERE t1.marketDay = 'GM' AND t1.hidden='0' ORDER BY vendorName";

                }
            }

            //get vendorList from database
            resultSet = dbConn.getResult(query, connection);

            //add vendorList to vendor list
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));

                vendorList.add(vendor);
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
        return vendorList;
    }
    /* End of searchByMarketType method */

    /* Start of getLocalLanguageVendorList method */
    public List<Vendor> getLocalLanguageVendorList() throws SQLException {
        
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Vendor> vendorList = new ArrayList();

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get local language vendor list
            query = "SELECT vendorID,vendorName FROM vendor WHERE vendorType=0 AND hidden=0 ORDER BY vendorName ASC";

            //execute query
            resultSet = dbConn.getResult(query, connection);

            /* add vendors to list */
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));

                vendorList.add(vendor);
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
        return vendorList;
    }
    /* End of getLocalLanguageVendorList method */
    
    /* start of loadVendors method */
    public List<Vendor> loadVendors() throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Vendor> vendorList = new ArrayList();              //array to hold vendor list

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get vendor list
            query = "SELECT vendorID,vendorName FROM vendor WHERE hidden=0 ORDER BY vendorName ASC";
            
            resultSet = dbConn.getResult(query, connection);

            //add vendors to vendor list using result set
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));

                vendorList.add(vendor);
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
        return vendorList;
    }
    /* end of loadVendors method */

    /* start of loadBlackListVendors method */
    public List<BlacklistVendors> loadBlackListVendors() throws SQLException {

        String query;

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;

        List<BlacklistVendors> blackListVendors = new ArrayList();            //array to hold blackList vendor list

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get blacklist vendor list
            query = "SELECT vendorID,vendorName,reason,blacklistDate FROM blacklist_vendor WHERE removedBlacklist = 0 ORDER BY vendorName ASC";

            resultSet = dbConn.getResult(query, connection);

            //add vendors to blacklist vendor list using query results
            while (resultSet.next()) {
                BlacklistVendors vendor = new BlacklistVendors();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));
                vendor.setBlackListReason(resultSet.getString(3));
                vendor.setBlacklistDate(resultSet.getString(4));

                blackListVendors.add(vendor);
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
        return blackListVendors;
    }
    /* end of loadBlackListVendors method */

    /* start of loadHiddenVendors method */
    public List<HiddenVendors> loadHiddenVendors() throws SQLException {

        String query;
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;

        List<HiddenVendors> hiddenVendors = new ArrayList();               //array to hold hidden vendor list

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get hidden vendor list
            query = "SELECT vendorID,vendorName,reason,hideDate FROM hidden_vendor WHERE removedUser = 0 ORDER BY vendorName ASC";

            resultSet = dbConn.getResult(query, connection);

            //add hidden vendor to list using query results
            while (resultSet.next()) {
                HiddenVendors vendor = new HiddenVendors();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));
                vendor.setHiddenReason(resultSet.getString(3));
                vendor.setHideDate(resultSet.getString(4));

                hiddenVendors.add(vendor);
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
        return hiddenVendors;
    }
    /* end of loadHiddenVendors method */

    /* start of getProfileDetailsVendor */
    public boolean getProfileDetailsVendor(Vendor vendor) throws SQLException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        boolean getDetails = false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get details from vendor table
            query = "SELECT * FROM vendor WHERE vendorID = '" + vendor.getVendorID() + "' ";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {

                //set vendor attributes
                vendor.setUserID(resultSet.getString(2));
                vendor.setVendorName(resultSet.getString(3));
                vendor.setFixedLine(resultSet.getString(4));
                vendor.setAddress(resultSet.getString(5));
                vendor.setMainCatg(resultSet.getString(7));
                vendor.setProductCatgID(resultSet.getString(8));
                vendor.setProductLevel(Integer.parseInt(resultSet.getString(9)));
                vendor.setEiLevel(Integer.parseInt(resultSet.getString(10)));
                vendor.setSiLevel(Integer.parseInt(resultSet.getString(11)));
                vendor.setPkgLevel(Integer.parseInt(resultSet.getString(12)));
                vendor.setFbLink(resultSet.getString(13));
                vendor.setTweeter(resultSet.getString(14));
                vendor.setgPlus(resultSet.getString(15));
                vendor.setProducts(resultSet.getString(16));
                vendor.setDescription(resultSet.getString(17));
                vendor.setRestriction(resultSet.getString(18));
                vendor.setSiImpact(resultSet.getString(19));
                vendor.setEnvImpact(resultSet.getString(20));

                //query to get details from user table
                query = "SELECT * FROM user WHERE userID = '" + vendor.getUserID() + "'";

                resultSet = dbConn.getResult(query, connection);

                if (resultSet.next()) {

                    //set vendor attributes
                    vendor.setUserFirstname(resultSet.getString(2));
                    vendor.setUserLastName(resultSet.getString(3));
                    vendor.setUserNIC(resultSet.getString(5));
                    vendor.setUserEmail(resultSet.getString(6));
                    vendor.setUserContactNo(resultSet.getString(7));

                    getDetails = true;
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
        return getDetails;
    }
    /* end of getProfileDetailsVendor */

    /* start of changeVendorType method */
    public int changeVendorType(Vendor vendor) throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        Statement statement;
        String query;

        int update = 0;                 //to check update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update useremail and change vendor type
            query = "UPDATE user, vendor SET vendor.vendorType = 1, user.userEmail = '" + vendor.getUserEmail() + "' WHERE vendor.userID = user.userID AND vendor.vendorID = '" + vendor.getVendorID() + "'";

            statement = connection.createStatement();
            int i = statement.executeUpdate(query);

            //check update happens or not
            if (i == 2) {
                update = 1;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection Close Error : " + e);
                }
            }
        }
        return update;
    }
    /* end of changeVendorType method */

    /* start of getLLVendorPwd method */
    public boolean getLLVendorPwd(Vendor vendor) throws SQLException {

        boolean get = false;

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to get password
            query = "SELECT userPwd FROM user WHERE userID = '" + vendor.getUserID() + "'";

            //get results
            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                get = true;
                vendor.setUserPwd(resultSet.getString(1));
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close Error : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection Close Error : " + e);
                }
            }
        }
        return get;
    }
    /* end of getLLVendorPwd method */

    /* start of insertBlackListUser method */
    public int insertBlackListUser(BlacklistVendors blackListVendor) throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement1, statement2, statement3;
        ResultSet resultSet = null, resultSet2 = null;

        String query;

        int insertedBL = 0;                                 //insertedBl = 0 if error occurs
        Date currentDate;
        Calendar calendar = Calendar.getInstance();
        Timestamp blackListDate;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            blackListVendor.setVendorName(blackListVendor.getVendornameByVendorID());             //need to insert into blacklist table
            blackListVendor.setUserID(blackListVendor.getUserIDByVendorID());                     //need to insert into blacklist table
            int i = 0;                                                                              //to check statements execute

            currentDate = calendar.getTime();
            blackListDate = new Timestamp(currentDate.getTime());

            if (!(blackListVendor.getVendorName().equals("")) && !(blackListVendor.getUserID().equals(""))) {

                query = "INSERT INTO blacklist_vendor (userID,vendorID, vendorName, reason, blacklistDate) VALUES ('" + blackListVendor.getUserID() + "','" + blackListVendor.getVendorID() + "','" + blackListVendor.getVendorName() + "', '" + blackListVendor.getBlackListReason() + "','" + blackListDate + "')";

                statement1 = connection.createStatement();
                i = statement1.executeUpdate(query);            //check insert into blacklist table
                
                if (i == 1) {

                    query = "UPDATE user,vendor,vendor_market SET user.hidden = 1, vendor_market.hidden = 1, vendor.hidden = 1 WHERE vendor.vendorID = vendor_market.vendorID AND user.userID = vendor.userID AND vendor.vendorID = '" + blackListVendor.getVendorID() + "'";

                    statement2 = connection.createStatement();
                    i = statement2.executeUpdate(query);                //to hide vendor in vendor, user and vendor market table
                
                    query = "SELECT DISTINCT m.marketDay FROM vendor_market m JOIN payment_TH t ON m.vendorID = t.vendorID JOIN payment_sa s ON m.vendorID = t.vendorID WHERE (m.marketDay = 'TH' OR m.marketDay = 'SA') AND m.vendorID = '" + blackListVendor.getVendorID() + "'";

                    statement3 = connection.createStatement();
                    resultSet = statement3.executeQuery(query);     //check whether this user has payment if only user has attendandane and then hide

                    if (resultSet.next()) {
                        do {
                            if (resultSet.getString(1).equals("TH")) {

                                query = "UPDATE attendance_th,payment_th SET attendance_th.hidden = 1, payment_th.hidden = 1 WHERE attendance_th.vendorID = payment_th.vendorId AND attendance_th.vendorID = '" + blackListVendor.getVendorID() + "'";

                                statement3 = connection.createStatement();
                                i = statement3.executeUpdate(query);                    //update attendance and payment tables  

                            } else if (resultSet.getString(1).equals("SA")) {

                                query = "UPDATE attendance_sa,payment_sa SET attendance_sa.hidden = 1, payment_sa.hidden = 1 WHERE attendance_sa.vendorID = payment_sa.vendorId AND attendance_sa.vendorID = '" + blackListVendor.getVendorID() + "'";

                                statement3 = connection.createStatement();
                                i = statement3.executeUpdate(query);                    //update attendance and payment tables  
                            }
                        } while (resultSet.next());
                    }
                }
            }
            
            if (i > 0) {
                insertedBL = 1;                 //to check process done
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null && resultSet2 != null) {
                try {
                    resultSet.close();
                    resultSet2.close();
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
        return insertedBL;
    }
    /* end of insertBlackListUser method */

    /* start of insertHiddenVendor method */
    public int insertHiddenVendor(HiddenVendors hiddenVendor) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement1, statement2, statement3;
        ResultSet resultSet = null, resultSet2 = null;

        String query;

        int insertedHL = 0;                                 //insertedBl = 0 if error occurs

        Date currentDate;
        Calendar calendar = Calendar.getInstance();
        Timestamp hideDate;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            hiddenVendor.setVendorName(hiddenVendor.getVendornameByVendorID());             //need to insert into blacklist table
            hiddenVendor.setUserID(hiddenVendor.getUserIDByVendorID());                     //need to insert into blacklist table
            int i = 0;                                                          //to check statements execute

            currentDate = calendar.getTime();
            hideDate = new Timestamp(currentDate.getTime());

            if (!(hiddenVendor.getVendorName().equals("")) && !(hiddenVendor.getUserID().equals(""))) {

                query = "INSERT INTO hidden_vendor (userID,vendorID, vendorName, reason, hideDate) VALUES ('" + hiddenVendor.getUserID() + "','" + hiddenVendor.getVendorID() + "','" + hiddenVendor.getVendorName() + "', '" + hiddenVendor.getHiddenReason() + "','" + hideDate + "')";

                statement1 = connection.createStatement();
                i = statement1.executeUpdate(query);            //check insert into blacklist table

                if (i == 1) {

                    query = "UPDATE user,vendor,vendor_market SET user.hidden = 1, vendor_market.hidden = 1, vendor.hidden = 1 WHERE vendor.vendorID = vendor_market.vendorID AND user.userID = vendor.userID AND vendor.vendorID = '" + hiddenVendor.getVendorID() + "'";

                    statement2 = connection.createStatement();
                    i = statement2.executeUpdate(query);                //to hide vendor in vendor, user and vendor market table

                    query = "SELECT DISTINCT m.marketDay FROM vendor_market m JOIN payment_TH t ON m.vendorID = t.vendorID JOIN payment_sa s ON m.vendorID = t.vendorID WHERE (m.marketDay = 'TH' OR m.marketDay = 'SA') AND m.vendorID = '" + hiddenVendor.getVendorID() + "'";

                    statement3 = connection.createStatement();
                    resultSet = statement3.executeQuery(query);     //check whether this user has payment if only user has attendandane and then hide

                    if (resultSet.next()) {
                        do {
                            if (resultSet.getString(1).equals("TH")) {

                                query = "UPDATE attendance_th,payment_th SET attendance_th.hidden = 1, payment_th.hidden = 1 WHERE attendance_th.vendorID = payment_th.vendorId AND attendance_th.vendorID = '" + hiddenVendor.getVendorID() + "'";

                                statement3 = connection.createStatement();
                                i = statement3.executeUpdate(query);                    //update attendance and payment tables  

                            } else if (resultSet.getString(1).equals("SA")) {

                                query = "UPDATE attendance_sa,payment_sa SET attendance_sa.hidden = 1, payment_sa.hidden = 1 WHERE attendance_sa.vendorID = payment_sa.vendorId AND attendance_sa.vendorID = '" + hiddenVendor.getVendorID() + "'";

                                statement3 = connection.createStatement();
                                i = statement3.executeUpdate(query);                    //update attendance and payment tables  
                            }
                        } while (resultSet.next());
                    }
                }
            }
            if (i > 0) {
                insertedHL = 1;                 //to check process done
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null && resultSet2 != null) {
                try {
                    resultSet.close();
                    resultSet2.close();
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
        return insertedHL;
    }
    /* end of insertHiddenVendor method */

    /* start of undoBlackListUser method */
    public int undoBlackListUser(BlacklistVendors blackListVendor) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement1, statement2, statement3, statement4;
        ResultSet resultSet = null;

        String query;

        int removedBL = 0;                                 //removedBl = 0 if error occurs

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            int i;                                                          //to check statements execute

            query = "UPDATE user,vendor,vendor_market SET user.hidden = 0, vendor_market.hidden = 0, vendor.hidden = 0 WHERE vendor.vendorID = vendor_market.vendorID AND user.userID = vendor.userID AND vendor.vendorID = '" + blackListVendor.getVendorID() + "'";

            statement1 = connection.createStatement();
            i = statement1.executeUpdate(query);                //to hide vendor in vendor, user and vendor market table

            query = "SELECT DISTINCT m.marketDay FROM vendor_market m JOIN payment_TH t ON m.vendorID = t.vendorID JOIN payment_sa s ON m.vendorID = t.vendorID WHERE (m.marketDay = 'TH' OR m.marketDay = 'SA') AND m.vendorID = '" + blackListVendor.getVendorID() + "'";

            statement2 = connection.createStatement();
            resultSet = statement2.executeQuery(query);     //check whether this user has payment if only user has attendandane and then hide

            if (resultSet.next()) {
                do {
                    if (resultSet.getString(1).equals("TH")) {

                        query = "UPDATE attendance_th,payment_th SET attendance_th.hidden = 0, payment_th.hidden = 0 WHERE attendance_th.vendorID = payment_th.vendorId AND attendance_th.vendorID = '" + blackListVendor.getVendorID() + "'";

                        statement3 = connection.createStatement();
                        i = statement3.executeUpdate(query);                    //update attendance and payment tables  
                    } else if (resultSet.getString(1).equals("SA")) {

                        query = "UPDATE attendance_sa,payment_sa SET attendance_sa.hidden = 0, payment_sa.hidden = 0 WHERE attendance_sa.vendorID = payment_sa.vendorId AND attendance_sa.vendorID = '" + blackListVendor.getVendorID() + "'";

                        statement3 = connection.createStatement();
                        i = statement3.executeUpdate(query);                    //update attendance and payment tables  
                    }
                } while (resultSet.next());
            }
            if (i > 0) {
                query = "UPDATE blacklist_vendor SET removedBlacklist = 1 WHERE vendorID = '" + blackListVendor.getVendorID() + "'";

                statement4 = connection.createStatement();
                i = statement4.executeUpdate(query);                            //update blacklist table to hide the vendor

                if (i == 1) {
                    removedBL = 1;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
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
        return removedBL;
    }
    /* end of undoBlackListUser method */

    /* start of undoHiddenUser method */
    public int undoHiddenUser(HiddenVendors hiddenVendors) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement1, statement2, statement3, statement4;
        ResultSet resultSet = null;

        String query;

        int removedHL = 0;                                 //removedHl = 0 if error occurs

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            int i;                                                          //to check statements execute

            query = "UPDATE user,vendor,vendor_market SET user.hidden = 0, vendor_market.hidden = 0, vendor.hidden = 0 WHERE vendor.vendorID = vendor_market.vendorID AND user.userID = vendor.userID AND vendor.vendorID = '" + hiddenVendors.getVendorID() + "'";

            statement1 = connection.createStatement();
            i = statement1.executeUpdate(query);                //to hide vendor in vendor, user and vendor market table

            query = "SELECT DISTINCT m.marketDay FROM vendor_market m JOIN payment_TH t ON m.vendorID = t.vendorID JOIN payment_sa s ON m.vendorID = t.vendorID WHERE (m.marketDay = 'TH' OR m.marketDay = 'SA') AND m.vendorID = '" + hiddenVendors.getVendorID() + "'";

            statement2 = connection.createStatement();
            resultSet = statement2.executeQuery(query);     //check whether this user has payment if only user has attendandane and then hide

            if (resultSet.next()) {
                do {
                    if (resultSet.getString(1).equals("TH")) {

                        query = "UPDATE attendance_th,payment_th SET attendance_th.hidden = 0, payment_th.hidden = 0 WHERE attendance_th.vendorID = payment_th.vendorId AND attendance_th.vendorID = '" + hiddenVendors.getVendorID() + "'";

                        statement3 = connection.createStatement();
                        i = statement3.executeUpdate(query);                    //update attendance and payment tables  

                    } else if (resultSet.getString(1).equals("SA")) {

                        query = "UPDATE attendance_sa,payment_sa SET attendance_sa.hidden = 0, payment_sa.hidden = 0 WHERE attendance_sa.vendorID = payment_sa.vendorId AND attendance_sa.vendorID = '" + hiddenVendors.getVendorID() + "'";

                        statement3 = connection.createStatement();
                        i = statement3.executeUpdate(query);                    //update attendance and payment tables  

                    }
                } while (resultSet.next());
            }
            if (i > 0) {
                query = "UPDATE hidden_vendor SET removedUser = 1 WHERE vendorID = '" + hiddenVendors.getVendorID() + "' AND removedUser = 0";

                statement4 = connection.createStatement();
                i = statement4.executeUpdate(query);

                if (i == 1) {
                    removedHL = 1;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
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
        return removedHL;
    }
    /* end of undoHiddenUser method */

    /* start of changeToHiddenVendor method */
    public boolean changeToHiddenVendor(BlacklistVendors blacklistVendors) throws SQLException {

        boolean change = false;                         //to check change happens or not

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        Statement statement1, statement2;
        ResultSet resultSet = null;
        String query;

        HiddenVendors hiddenVendor = new HiddenVendors();
        int i;

        Date currentDate;                                   //attribute to get current date
        Calendar calendar = Calendar.getInstance();
        Timestamp hideDate;

        try {
            connection = dbConn.setConnection();

            //get current date to insert into the database table
            currentDate = calendar.getTime();
            hideDate = new Timestamp(currentDate.getTime());

            //query to get blacklist vendor details from database
            query = "SELECT * FROM blacklist_vendor WHERE vendorID = '" + blacklistVendors.getVendorID() + "'";

            resultSet = dbConn.getResult(query, connection);

            //add the blacklist vendor details into new hidden vendor object
            if (resultSet.next()) {
                hiddenVendor.setUserID(resultSet.getString(2));
                hiddenVendor.setVendorID(resultSet.getString(3));
                hiddenVendor.setVendorName(resultSet.getString(4));
                hiddenVendor.setHiddenReason(resultSet.getString(5));

                //remove the vendor from the blacklist table
                query = "UPDATE blacklist_vendor SET removedBlacklist = 1 WHERE vendorID = '" + hiddenVendor.getVendorID() + "' AND removedBlacklist=0";

                statement1 = connection.createStatement();
                i = statement1.executeUpdate(query);

                if (i == 1) {

                    //insert the vendor into hidden vendor table
                    query = "INSERT INTO hidden_vendor (userID,vendorID, vendorName, reason, hideDate) VALUES ('" + hiddenVendor.getUserID() + "','" + hiddenVendor.getVendorID() + "','" + hiddenVendor.getVendorName() + "', '" + hiddenVendor.getHiddenReason() + "','" + hideDate + "')";

                    statement2 = connection.createStatement();
                    i = statement2.executeUpdate(query);

                    if (i == 1) {
                        change = true;
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
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
        return change;
    }
    /* end of changeToHiddenVendor method */

    /* start of getBlacklistVendorDetails method */
    public boolean getBlacklistVendorDetails(BlacklistVendors blacklistVendor) throws SQLException {

        boolean details = false;                    //to check details return or not

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to get blacklist vendor details
            query = "SELECT * FROM blacklist_vendor WHERE vendorID = '" + blacklistVendor.getVendorID() + "' AND removedBlacklist = 0";

            resultSet = dbConn.getResult(query, connection);

            //set blacklistVendor details
            if (resultSet.next()) {
                details = true;

                blacklistVendor.setUserID(resultSet.getString(2));
                blacklistVendor.setVendorName(resultSet.getString(4));
                blacklistVendor.setBlackListReason(resultSet.getString(5));
                blacklistVendor.setBlacklistDate(resultSet.getString(6));
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception : " + e);
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
        return details;
    }
    /* end of getBlacklistVendorDetails method */

    /* start of getHiddenVendorDetails method */
    public boolean getHiddenVendorDetails(HiddenVendors hiddenVendors) throws SQLException {

        boolean details = false;

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to get hidden vendor details
            query = "SELECT * FROM hidden_vendor WHERE vendorID = '" + hiddenVendors.getVendorID() + "' AND removedUser = 0";

            resultSet = dbConn.getResult(query, connection);

            //set hidden vendor details to hiddenVendor object
            if (resultSet.next()) {
                details = true;

                hiddenVendors.setUserID(resultSet.getString(2));
                hiddenVendors.setVendorName(resultSet.getString(4));
                hiddenVendors.setHiddenReason(resultSet.getString(5));
                hiddenVendors.setHideDate(resultSet.getString(6));
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception : " + e);
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
        return details;
    }
    /* end of getHiddenVendorDetails method */

    /* start of loadVendorsAttendingThursday method */
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
            String dateColumn = this.createDateColumnName(dateCol);

            //query to get paid vendors for current week
            query = "SELECT DISTINCT a.vendorID, v.vendorName, a." + dateColumn + " FROM attendance_th a JOIN vendor v ON v.vendorID = a.vendorID JOIN payment_th p ON p.vendorID = a.vendorID WHERE p.expiredDate >= '" + dateColumn + "' ORDER BY vendorName";

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
    /* end of loadVendorsAttendingThursday method */

    /* start of loadVendorsAttendingSaturday method */
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
            String dateColumn = this.createDateColumnName(dateCol);

            //query to get paid vendors for current week
            query = "SELECT DISTINCT a.vendorID, v.vendorName, a." + dateColumn + " FROM attendance_sa a JOIN vendor v ON v.vendorID = a.vendorID JOIN payment_sa p ON p.vendorID = a.vendorID WHERE p.expiredDate >= '" + dateColumn + "'";

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
    /* end of loadVendorsAttendingSaturday method */

    /* start of setVendorAttendanceThursday method */
    public int setVendorAttendanceThursday(String attendVendorList[]) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        Statement statement;
        ResultSet resultSet = null;
        String query;

        int set = 0;

        /* For Date calculation */
        Calendar cal = Calendar.getInstance();
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

        if (dayOfWeek == 1) {   //for sunday    -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 4);
        } else if (dayOfWeek == 2) {     //for monday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 3);
        } else if (dayOfWeek == 6) {     //for friday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 6);
        } else if (dayOfWeek == 7) {     //for saturday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 5);
        } else if (dayOfWeek == 3) {     //for tuesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 2);
        } else if (dayOfWeek == 4) {     //for wednesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 1);
        } else if (dayOfWeek == 5) {     //for thursday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 7);
        }

        Date date = cal.getTime();
        cal.setTime(date);
        LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String dateColumn = this.createDateColumnName(dateCol);
        /*End of date calculation*/

        //to count update happens for each vendor
        int count = 0;

        try {
            connection = dbConn.setConnection();

            for (String vendorID : attendVendorList) {

                //query to update attendance status from thursday market
                query = "UPDATE attendance_th SET " + dateColumn + " = '1' WHERE vendorID = '" + vendorID + "'";

                //execute update 
                statement = connection.createStatement();
                int i = statement.executeUpdate(query);

                if (i == 0) {
                    break;              //if update doesn't happen execution break
                } else {

                    //query to get expiredDate of payment
                    query = "SELECT expiredDate FROM payment_th WHERE vendorID = '" + vendorID + "'";

                    //execute query
                    resultSet = dbConn.getResult(query, connection);

                    if (resultSet.next()) {

                        /* decrement expired date by a week */
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        Date expiredDate = format.parse(resultSet.getString(1));

                        if (date.before(expiredDate)) {
                            
                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(expiredDate);
                            calendar.add(Calendar.DAY_OF_MONTH, -7);
                            expiredDate = calendar.getTime();
                            Timestamp newExpiredDate = new Timestamp(expiredDate.getTime());

                            //query to update payment by a week
                            query = "UPDATE payment_th SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + vendorID + "'";

                            //execute update
                            int j = statement.executeUpdate(query);

                            if (j == 0) {
                                set = -1;           //check update fails
                                break;
                            } else {
                                count++;
                            }
                        } else {
                            count++;
                        }
                    }
                }
            }

            /* check update is successfull for all selected vendors */
            if (count == attendVendorList.length) {
                set = 1;
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (ParseException ex) {
            System.err.println("ParseException : " + ex);
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
        return set;
    }
    /* end of setVendorAttendanceThursday method */

    /* start of setVendorAttendanceSaturday method*/
    public int setVendorAttendanceSaturday(String attendVendorList[]) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        Statement statement;
        ResultSet resultSet = null;
        String query;

        int set = 0;

        /* For Date calculation */
        Calendar cal = Calendar.getInstance();
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

        if (dayOfWeek == 1) {   //for sunday    -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 6);
        } else if (dayOfWeek == 2) {     //for monday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 5);
        } else if (dayOfWeek == 1) {     //for friday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 1);
        } else if (dayOfWeek == 7) {     //for saturday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 7);
        } else if (dayOfWeek == 3) {     //for tuesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 4);
        } else if (dayOfWeek == 4) {     //for wednesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 3);
        } else if (dayOfWeek == 5) {     //for thursday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 2);
        }

        Date date = cal.getTime();
        cal.setTime(date);
        LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String dateColumn = this.createDateColumnName(dateCol);
        /*End of date calculation*/

        //to count update happens for each vendor
        int count = 0;

        try {

            connection = dbConn.setConnection();

            for (String vendorID : attendVendorList) {

                //query to update attendance status from saturday market
                query = "UPDATE attendance_sa SET " + dateColumn + " = '1' WHERE vendorID = '" + vendorID + "'";

                //execute update 
                statement = connection.createStatement();
                int i = statement.executeUpdate(query);

                if (i == 0) {
                    break;              //if update doesn't happen execution break
                } else {

                    //query to get expiredDate of payment
                    query = "SELECT expiredDate FROM payment_sa WHERE vendorID = '" + vendorID + "'";

                    //execute query
                    resultSet = dbConn.getResult(query, connection);

                    if (resultSet.next()) {

                        /* decrement expired date by a week */
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        Date expiredDate = format.parse(resultSet.getString(1));

                        if (date.before(expiredDate)) {

                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(expiredDate);
                            calendar.add(Calendar.DAY_OF_MONTH, -7);
                            expiredDate = calendar.getTime();
                            Timestamp newExpiredDate = new Timestamp(expiredDate.getTime());

                            //query to update payment by a week
                            query = "UPDATE payment_sa SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + vendorID + "'";

                            //execute update
                            int j = statement.executeUpdate(query);

                            if (j == 0) {
                                set = -1;           //check update fails
                                break;
                            } else {
                                count++;
                            }
                        } else {
                            count++;
                        }
                    }
                }
            }

            /* check update is successfull for all selected vendors */
            if (count == attendVendorList.length) {
                set = 1;
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (ParseException ex) {
            System.err.println("ParseException : " + ex);
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
        return set;
    }
    /* end of setVendorAttendanceSaturday */

    /* start of removeVendorAttendanceThursday method */
    public int removeVendorAttendanceThursday(String notAttendVendorList[]) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        Statement statement;
        ResultSet resultSet = null;
        String query;

        int set = 0;

        /* For Date calculation */
        Calendar cal = Calendar.getInstance();
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

        if (dayOfWeek == 1) {   //for sunday    -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 4);
        } else if (dayOfWeek == 2) {     //for monday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 3);
        } else if (dayOfWeek == 6) {     //for friday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 6);
        } else if (dayOfWeek == 7) {     //for saturday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 5);
        } else if (dayOfWeek == 3) {     //for tuesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 2);
        } else if (dayOfWeek == 4) {     //for wednesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 1);
        } else if (dayOfWeek == 5) {     //for thursday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 7);
        }

        Date date = cal.getTime();
        cal.setTime(date);
        LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String dateColumn = this.createDateColumnName(dateCol);
        /*End of date calculation*/

        //to count update happens for each vendor
        int count = 0;

        try {
            connection = dbConn.setConnection();

            for (String vendorID : notAttendVendorList) {

                //query to update attendance status from thursday market
                query = "UPDATE attendance_th SET " + dateColumn + " = '0' WHERE vendorID = '" + vendorID + "'";

                //execute update 
                statement = connection.createStatement();
                int i = statement.executeUpdate(query);

                if (i == 0) {
                    break;              //if update doesn't happen execution break
                } else {

                    //query to get expiredDate of payment
                    query = "SELECT expiredDate FROM payment_th WHERE vendorID = '" + vendorID + "'";

                    //execute query
                    resultSet = dbConn.getResult(query, connection);

                    if (resultSet.next()) {

                        /* increment expired date by a week */
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        Date expiredDate = format.parse(resultSet.getString(1));
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(expiredDate);
                        calendar.add(Calendar.WEEK_OF_YEAR, 1);
                        expiredDate = calendar.getTime();
                        Timestamp newExpiredDate = new Timestamp(expiredDate.getTime());

                        //query to update payment by a week
                        query = "UPDATE payment_th SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + vendorID + "'";

                        //execute update
                        int j = statement.executeUpdate(query);

                        if (j == 0) {
                            set = -1;           //check update fails
                            break;
                        } else {
                            count++;
                        }
                    }
                }
            }

            /* check update is successfull for all selected vendors */
            if (count == notAttendVendorList.length) {
                set = 1;
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (ParseException ex) {
            System.err.println("ParseException : " + ex);
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
        return set;
    }
    /* end of removeVendorAttendanceThursday method */

    /* start of removeVendorAttendanceSaturday method*/
    public int removeVendorAttendanceSaturday(String notAttendVendorList[]) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        Statement statement;
        ResultSet resultSet = null;
        String query;

        int set = 0;

        /* For Date calculation */
        Calendar cal = Calendar.getInstance();
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

        if (dayOfWeek == 1) {   //for sunday    -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 6);
        } else if (dayOfWeek == 2) {     //for monday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 5);
        } else if (dayOfWeek == 1) {     //for friday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 1);
        } else if (dayOfWeek == 7) {     //for saturday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 7);
        } else if (dayOfWeek == 3) {     //for tuesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 4);
        } else if (dayOfWeek == 4) {     //for wednesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 3);
        } else if (dayOfWeek == 5) {     //for thursday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 2);
        }

        Date date = cal.getTime();
        cal.setTime(date);
        LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String dateColumn = this.createDateColumnName(dateCol);
        /*End of date calculation*/

        //to count update happens for each vendor
        int count = 0;

        try {

            connection = dbConn.setConnection();

            for (String vendorID : notAttendVendorList) {

                //query to update attendance status from saturday market
                query = "UPDATE attendance_sa SET " + dateColumn + " = '0' WHERE vendorID = '" + vendorID + "'";

                //execute update 
                statement = connection.createStatement();
                int i = statement.executeUpdate(query);

                if (i == 0) {
                    break;              //if update doesn't happen execution break
                } else {

                    //query to get expiredDate of payment
                    query = "SELECT expiredDate FROM payment_sa WHERE vendorID = '" + vendorID + "'";

                    //execute query
                    resultSet = dbConn.getResult(query, connection);

                    if (resultSet.next()) {

                        /* increment expired date by a week */
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        Date expiredDate = format.parse(resultSet.getString(1));

                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(expiredDate);
                        calendar.add(Calendar.WEEK_OF_YEAR, 1);
                        expiredDate = calendar.getTime();
                        Timestamp newExpiredDate = new Timestamp(expiredDate.getTime());

                        //query to update payment by a week
                        query = "UPDATE payment_sa SET expiredDate = '" + newExpiredDate + "' WHERE vendorID = '" + vendorID + "'";

                        //execute update
                        int j = statement.executeUpdate(query);

                        if (j == 0) {
                            set = -1;           //check update fails
                            break;
                        } else {
                            count++;
                        }
                    }
                }
            }

            /* check update is successfull for all selected vendors */
            if (count == notAttendVendorList.length) {
                set = 1;
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } catch (ParseException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
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
        return set;
    }
    /* end of removeVendorAttendanceSaturday */

    /* Start of loadRemainVendors method */
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
                if (!(paidVendorListID.contains(vendor.getVendorID()))) {
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
    /* End of loadRemainVendors method */

    /* Start of addNewAttendanceThursday method */
    public boolean addNewAttendanceThursday(String newVendorList[]) throws ParseException {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement;
        String query1, query2;

        boolean update = false;

        List<String> vendorsInAttendance = new ArrayList<String>();

        /* For Date calculation */
        Calendar cal = Calendar.getInstance();
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

        if (dayOfWeek == 1) {   //for sunday    -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 4);
        } else if (dayOfWeek == 2) {     //for monday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 3);
        } else if (dayOfWeek == 6) {     //for friday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 6);
        } else if (dayOfWeek == 7) {     //for saturday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 5);
        } else if (dayOfWeek == 3) {     //for tuesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 2);
        } else if (dayOfWeek == 4) {     //for wednesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 1);
        } else if (dayOfWeek == 5) {     //for thursday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 7);
        }

        Date date = cal.getTime();
        cal.setTime(date);
        LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String dateColumn = this.createDateColumnName(dateCol);
        /*End of date calculation*/

        /* create date to pass into payment table */
        String datePaid = dateCol.toString();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date paidDate = format.parse(datePaid);
        Timestamp startDate = new Timestamp(paidDate.getTime());
        Timestamp expiredDate = new Timestamp(paidDate.getTime());

        try {

            connection = dbConn.setConnection();

            //query to get vendorIDs in attendance_th table
            query1 = "SELECT vendorID FROM attendance_th";

            resultSet = dbConn.getResult(query1, connection);

            while (resultSet.next()) {
                String vendorID = resultSet.getString(1);
                vendorsInAttendance.add(vendorID);
            }

            int i = 0;              //to check update happens for each vendor

            for (String vendorID : newVendorList) {
                if (vendorsInAttendance.contains(vendorID)) {
                    //query if vendor is already in the attendance table
                    query1 = "UPDATE payment_th SET paidDate = '" + startDate + "' , expiredDate = '" + expiredDate + "' WHERE vendorID = '" + vendorID + "'";

                    query2 = "UPDATE attendance_th SET " + dateColumn + " = '1' WHERE vendorID = '" + vendorID + "'";
                } else {
                    //query if vendor is not in attendance table
                    query1 = "INSERT INTO payment_th (vendorId, paidDate, expiredDate) VALUES ('" + vendorID + "' , '" + startDate + "' , '" + expiredDate + "')";

                    query2 = "INSERT INTO attendance_th (vendorID, " + dateColumn + ") VALUES ('" + vendorID + "', '1')";
                }

                //execute update 
                statement = connection.createStatement();
                int j = statement.executeUpdate(query1);

                if (j == 0) {
                    break;
                } else {
                    statement = connection.createStatement();
                    int k = statement.executeUpdate(query2);

                    if (k == 0) {
                        break;
                    } else {
                        i++;
                    }
                }
            }

            if (i == newVendorList.length) {
                update = true;
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
        return update;
    }
    /* End of addNewAttendanceThursday method */

    /* Start of addNewAttendanceSaturday method */
    public boolean addNewAttendanceSaturday(String newVendorList[]) throws ParseException {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement;
        String query1, query2;

        boolean update = false;

        List<String> vendorsInAttendance = new ArrayList<String>();

        /* For Date calculation */
        Calendar cal = Calendar.getInstance();
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

        if (dayOfWeek == 1) {   //for sunday    -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 6);
        } else if (dayOfWeek == 2) {     //for monday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 5);
        } else if (dayOfWeek == 1) {     //for friday   -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 1);
        } else if (dayOfWeek == 7) {     //for saturday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 7);
        } else if (dayOfWeek == 3) {     //for tuesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 4);
        } else if (dayOfWeek == 4) {     //for wednesday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 3);
        } else if (dayOfWeek == 5) {     //for thursday -- THIS IS ONLY FOR CONFIRMATION BY ADMIN
            cal.add(Calendar.DATE, 2);
        }

        Date date = cal.getTime();
        cal.setTime(date);
        LocalDate dateCol = new LocalDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String dateColumn = this.createDateColumnName(dateCol);
        /*End of date calculation*/

        /* create date to pass into payment table */
        String datePaid = dateCol.toString();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date paidDate = format.parse(datePaid);
        Timestamp startDate = new Timestamp(paidDate.getTime());
        Timestamp expiredDate = new Timestamp(paidDate.getTime());

        try {

            connection = dbConn.setConnection();

            //query to get vendorIDs in attendance_sa table
            query1 = "SELECT vendorID FROM attendance_sa";

            resultSet = dbConn.getResult(query1, connection);

            while (resultSet.next()) {
                String vendorID = resultSet.getString(1);
                vendorsInAttendance.add(vendorID);
            }

            int i = 0;              //to check update happens for each vendor

            for (String vendorID : newVendorList) {
                if (vendorsInAttendance.contains(vendorID)) {
                    //query if vendor is already in the attendance table
                    query1 = "UPDATE payment_sa SET paidDate = '" + startDate + "' , expiredDate = '" + expiredDate + "' WHERE vendorID = ' " + vendorID + " '";

                    query2 = "UPDATE attendance_sa SET " + dateColumn + " = '1' WHERE vendorID = '" + vendorID + "'";
                } else {
                    //query if vendor is not in attendance table
                    query1 = "INSERT INTO payment_sa (vendorId, paidDate, expiredDate) VALUES ('" + vendorID + "' , '" + startDate + "' , '" + expiredDate + "')";

                    query2 = "INSERT INTO attendance_sa (vendorID, " + dateColumn + ") VALUES ('" + vendorID + "', '1')";
                }

                //execute update 
                statement = connection.createStatement();
                int j = statement.executeUpdate(query1);

                if (j == 0) {
                    break;
                } else {
                    statement = connection.createStatement();
                    int k = statement.executeUpdate(query2);

                    if (k == 0) {
                        break;
                    } else {
                        i++;
                    }
                }
            }

            if (i == newVendorList.length) {
                update = true;
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
        return update;
    }
    /* End of addNewAttendanceSaturday method */

    /* Start of getFullYearAttendance method */
    public List<Vendor> getFullYearAttendance(String day, List<LocalDate> days) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Vendor> attendanceList = new ArrayList();                  //array to hold vendor list

        try {
            connection = dbConn.setConnection();

            if (day.equals("TH")) {

                List<LocalDate> thursdays = days;

                String thursdayCol = "";
                int noOfDays = thursdays.size();
                LocalDate last = thursdays.get(noOfDays - 1);

                for (LocalDate date : thursdays) {

                    String dateColumn = this.createDateColumnName(date);

                    if (date.equals(last)) {
                        thursdayCol += dateColumn;
                    } else {
                        thursdayCol += dateColumn + ",";
                    }
                }

                //query to get results
                query = "SELECT a.vendorID,v.vendorName, " + thursdayCol + " FROM attendance_th a JOIN vendor v ON v.vendorID = a.vendorID WHERE a.hidden=0";

                //execute update
                resultSet = dbConn.getResult(query, connection);

                /* add vendors with attendance details */
                while (resultSet.next()) {

                    Vendor vendor = new Vendor();
                    vendor.setVendorID(resultSet.getString(1));
                    vendor.setVendorName(resultSet.getString(2));

                    /* set attendance details */
                    String attendance[] = new String[noOfDays];
                    for (int i = 3; i < noOfDays + 3; i++) {
                        attendance[i - 3] = resultSet.getString(i);
                    }
                    vendor.setAttendancePeriodThursday(attendance);

                    //add vendor to list
                    attendanceList.add(vendor);
                }
            } else {
                List<LocalDate> saturdays = days;

                String saturdayCol = "";
                int noOfDays = saturdays.size();
                LocalDate last = saturdays.get(noOfDays - 1);

                for (LocalDate date : saturdays) {

                    String dateColumn = this.createDateColumnName(date);

                    if (date.equals(last)) {
                        saturdayCol += dateColumn;
                    } else {
                        saturdayCol += dateColumn + ",";
                    }
                }

                //query to get results
                query = "SELECT a.vendorID,v.vendorName, " + saturdayCol + " FROM attendance_sa a JOIN vendor v ON v.vendorID = a.vendorID WHERE a.hidden=0";

                //execute update
                resultSet = dbConn.getResult(query, connection);

                /* add vendors with attendance details */
                while (resultSet.next()) {

                    Vendor vendor = new Vendor();
                    vendor.setVendorID(resultSet.getString(1));
                    vendor.setVendorName(resultSet.getString(2));

                    /* set attendance details */
                    String attendance[] = new String[noOfDays];
                    for (int i = 3; i < noOfDays + 3; i++) {
                        attendance[i - 3] = resultSet.getString(i);
                    }
                    vendor.setAttendancePeriodSaturday(attendance);

                    //add vendor to list
                    attendanceList.add(vendor);
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
        return attendanceList;
    }
    /* End of getFullYearAttendance method */

    /* Start of getFullYearAttendanceByName method */
    public Vendor getFullYearAttendanceByName(String day, List<LocalDate> days, Vendor vendor) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        try {
            connection = dbConn.setConnection();

            if (day.equals("TH")) {
                List<LocalDate> thursdays = days;

                String thursdayCol = "";
                int noOfDays = thursdays.size();
                LocalDate last = thursdays.get(noOfDays - 1);

                for (LocalDate date : thursdays) {

                    String dateColumn = this.createDateColumnName(date);

                    if (date.equals(last)) {
                        thursdayCol += dateColumn;
                    } else {
                        thursdayCol += dateColumn + ",";
                    }
                }

                //query to get results
                query = "SELECT " + thursdayCol + " FROM attendance_th WHERE vendorID = '" + vendor.getVendorID() + "' and hidden=0";

                //execute query 
                resultSet = dbConn.getResult(query, connection);

                //set attendance details of vendor
                if (resultSet.next()) {

                    String attendance[] = new String[noOfDays];

                    for (int i = 1; i < noOfDays + 1; i++) {
                        attendance[i - 1] = resultSet.getString(i);
                    }

                    vendor.setAttendancePeriodThursday(attendance);
                }
            } else {
                List<LocalDate> saturdays = days;

                String saturdayCol = "";
                int noOfDays = saturdays.size();
                LocalDate last = saturdays.get(noOfDays - 1);

                for (LocalDate date : saturdays) {

                    String dateColumn = this.createDateColumnName(date);

                    if (date.equals(last)) {
                        saturdayCol += dateColumn;
                    } else {
                        saturdayCol += dateColumn + ",";
                    }
                }

                //query to get results
                query = "SELECT " + saturdayCol + " FROM attendance_sa WHERE vendorID = '" + vendor.getVendorID() + "' and hidden=0";

                //execute update
                resultSet = dbConn.getResult(query, connection);

                //set attendance details of vendor
                if (resultSet.next()) {
                    String attendance[] = new String[noOfDays];

                    for (int i = 1; i < noOfDays + 1; i++) {
                        attendance[i - 1] = resultSet.getString(i);
                    }

                    vendor.setAttendancePeriodSaturday(attendance);
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
        return vendor;
    }
    /* End of getFullYearAttendanceByName method */

    /* Start of getMarketDayAttendance method */
    public List<Vendor> getMarketDayAttendance(String day, String date) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Vendor> vendorList = new ArrayList();          //array to hold vendors

        try {
            connection = dbConn.setConnection();

            //query to get attendance status of vendors 
            if (day.equals("TH")) {
                query = "SELECT v.vendorID, v.vendorName, " + date + " FROM vendor v JOIN attendance_th a ON v.vendorID = a.vendorID WHERE (" + date + " = '0' OR " + date + " = '1') AND a.hidden = '0'";
            } else {
                query = "SELECT v.vendorID, v.vendorName, " + date + " FROM vendor v JOIN attendance_sa a ON v.vendorID = a.vendorID WHERE (" + date + " = '0' OR " + date + " = '1') AND a.hidden = '0'";
            }

            //execute query
            resultSet = dbConn.getResult(query, connection);

            //add vendors to list
            while (resultSet.next()) {
                Vendor vendor = new Vendor();

                vendor.setVendorID(resultSet.getString(1));
                vendor.setVendorName(resultSet.getString(2));
                vendor.setAttendance(resultSet.getString(3));

                vendorList.add(vendor);
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close eroor : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close eroor : " + e);
                }
            }
        }
        return vendorList;
    }
    /* End of getMarketDayAttendance method */

    /* Start of getMarketDayAttendanceOfVendor method */
    public Vendor getMarketDayAttendanceOfVendor(String day, String date, Vendor vendor) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to get attendance status
            if (day.equals("TH")) {
                query = "SELECT " + date + " FROM attendance_th WHERE vendorId = '" + vendor.getVendorID() + "' AND hidden = '0'";
            } else {
                query = "SELECT " + date + " FROM attendance_sa WHERE vendorId = '" + vendor.getVendorID() + "' AND hidden = '0'";
            }

            //execute query
            resultSet = dbConn.getResult(query, connection);

            //set attendance status
            if (resultSet.next()) {
                vendor.setAttendance(resultSet.getString(1));
            }
        } catch (SQLException e) {
            System.err.println("SQLException : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close eroor : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close eroor : " + e);
                }
            }
        }
        return vendor;
    }
    /* End of getMarketDayAttendanceOfVendor method */

    /* Start of checkVendorBelongToMarket method */
    public boolean checkVendorBelongToMarket(String day, String vendorID) {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        boolean belong = false;

        try {
            connection = dbConn.setConnection();

            //query to check vendor belongs to market
            query = "SELECT vendorID FROM vendor_market WHERE marketDay = '" + day + "' AND vendorID = '" + vendorID + "'";

            resultSet = dbConn.getResult(query, connection);

            //check result 
            if (resultSet.next()) {
                belong = true;
            }

        } catch (SQLException e) {
            System.err.println("SQL eroor : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close eroor : " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close eroor : " + e);
                }
            }
        }
        return belong;
    }
    /* End of checkVendorBelongToMarket method */

    /* start of getThursdays */
    public List<LocalDate> getThursdays(LocalDate start, LocalDate end) {

        List<LocalDate> result = new ArrayList();

        /* set thursdays of year */
        for (LocalDate date = start; date.isBefore(end); date = date.plusDays(1)) {
            int day = date.getDayOfWeek();
            if (day == DateTimeConstants.THURSDAY) {
                result.add(date);
            }
        }
        return result;
    }
    /* end of getThursdays */

    /* start of getSaturdays */
    public List<LocalDate> getSaturdays(LocalDate start, LocalDate end) {

        List<LocalDate> result = new ArrayList();

        /* set saturdays of year */
        for (LocalDate date = start; date.isBefore(end); date = date.plusDays(1)) {
            int day = date.getDayOfWeek();
            if (day == DateTimeConstants.SATURDAY) {
                result.add(date);
            }
        }
        return result;
    }
    /* end of getSaturdays */

    public List<Vendor> viewAllVendorMessages(String vendorId) {
        List<Vendor> messageList = new ArrayList<Vendor>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_vendor WHERE(vendorId='" + vendorId + "') order by messageTime desc";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Vendor messageVendor = new Vendor();
                messageVendor.setId(resultSet.getInt("id"));
                messageVendor.setVendorID(resultSet.getString("vendorId"));
                messageVendor.setMessage(resultSet.getString("message"));
                messageVendor.setFlag(resultSet.getInt("flag"));
                messageVendor.setMessageTime(resultSet.getString("messageTime"));
                messageList.add(messageVendor);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return messageList;
        }
    }

    public Vendor getMessageVendor(int id) {
        Vendor messageVendor = new Vendor();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_vendor WHERE (id=" + id + ")";

            ResultSet resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                messageVendor.setId(id);
                messageVendor.setVendorID(resultSet.getString("vendorId"));
                messageVendor.setMessage(resultSet.getString("message"));
                messageVendor.setFlag(resultSet.getInt("flag"));
                messageVendor.setMessageTime(resultSet.getString("messageTime"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return messageVendor;
        }
    }

    public int changeVendorMessageFlag(Vendor messageVendor) {
        int x = -1;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE message_vendor set flag=1 WHERE (id='" + messageVendor.getId() + "') AND(vendorId='" + messageVendor.getVendorID() + "')AND (messageTime='" + messageVendor.getMessageTime() + "') AND (message='" + messageVendor.getMessage() + "')";
            x = statement.executeUpdate(query);

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return x;
        }
    }

    public List<Vendor> viewVendorMessages() {
        List<Vendor> messageList = new ArrayList<Vendor>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_vendor WHERE (flag=0) order by messageTime";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Vendor messageVendor = new Vendor();
                messageVendor.setId(resultSet.getInt("id"));
                messageVendor.setVendorID(resultSet.getString("vendorId"));
                messageVendor.setMessage(resultSet.getString("message"));
                messageVendor.setFlag(resultSet.getInt("flag"));
                messageVendor.setMessageTime(resultSet.getString("messageTime"));

                messageList.add(messageVendor);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return messageList;
        }
    }

    public List<Vendor> viewAllMessagedVendors() {
        List<Vendor> messageList = new ArrayList<Vendor>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM message_vendor  order by vendorId";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Vendor messageVendor = new Vendor();
                messageVendor.setId(resultSet.getInt("id"));
                messageVendor.setVendorID(resultSet.getString("vendorId"));
                messageVendor.setMessage(resultSet.getString("message"));
                messageVendor.setFlag(resultSet.getInt("flag"));
                messageVendor.setMessageTime(resultSet.getString("messageTime"));
                messageList.add(messageVendor);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return messageList;
        }
    }

    //view all customer messages to the admin
    public List<Customer> viewAllCustomerFeedbacks() throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        List<Customer> messagelist = new ArrayList();
        boolean inserted = false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get paidDate and expiredDate of given vendor
            query = "SELECT * FROM message_customer where  flag=1";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                Customer customer = new Customer();

                customer.setMessageID(resultSet.getInt(1));
                customer.setCustomername(resultSet.getString(2));
                //System.out.println(customer.getCustomername());
                customer.setContactno(resultSet.getString(3));
                customer.setCustomeremail(resultSet.getString(4));
                customer.setFeedback(resultSet.getString(5));
                customer.setFlag(resultSet.getInt(6));
                //System.out.println(customer.getFlag());

                messagelist.add(customer);
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return messagelist;
    }

    //view unread customer messages to the admin
    public List<Customer> viewCustomerFeedbacks() throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        List<Customer> messagelist = new ArrayList();
        boolean inserted = false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get paidDate and expiredDate of given vendor
            query = "SELECT * FROM message_customer where  flag=0";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                Customer customer = new Customer();

                customer.setMessageID(resultSet.getInt(1));
                customer.setCustomername(resultSet.getString(2));
                //System.out.println(customer.getCustomername());
                customer.setContactno(resultSet.getString(3));
                customer.setCustomeremail(resultSet.getString(4));
                customer.setFeedback(resultSet.getString(5));
                customer.setFlag(resultSet.getInt(6));
                //System.out.println(customer.getFlag());

                messagelist.add(customer);
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return messagelist;
    }
    
    public List<Payment> viewPaidVendorsForNextMarketDays(String marketday) throws SQLException {

        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        List<Payment> vendorList = new ArrayList();
        boolean inserted = false;

        //expired date of payment
        Date currentDate = new Date();

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            currentDate = Date.from(java.time.Instant.now());

            if (marketday == "TH") {
                //query to get paid vendors
                query = "SELECT * FROM payment_th WHERE  expiredDate > CURDATE() and hidden=0";

            } else {
                query = "SELECT * FROM payment_sa WHERE  expiredDate > CURDATE() and hidden=0";

            }

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                //create payment object
                Payment payment = new Payment();
                
                //get vendor id
                payment.setVendorID(resultSet.getString(2));
                
                //get expired date
                payment.setExpiredDate(resultSet.getDate(4));
                
                //get vendor name
                Vendor vendor = new Vendor();
                vendor.setVendorID(payment.getVendorID());
                payment.setVendorname(vendor.getVendornameByVendorID());
                //add objects to list
                vendorList.add(payment);
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }
        return vendorList;
    }
    
    public List<Vendor> viewNewProductRequests(){
        List<Vendor> requestList=new ArrayList<Vendor>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM productrequests_vendor WHERE (flag=0)";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Vendor requestVendor = new Vendor();
                requestVendor.setRequestId(resultSet.getInt("requestId"));
                requestVendor.setVendorID(resultSet.getString("vendorId"));
                requestVendor.setProducts(resultSet.getString("productName"));
                requestVendor.setDescription(resultSet.getString("productDescription"));
                requestVendor.setMessageTime(resultSet.getString("requestTime"));
                requestVendor.setFlag(resultSet.getInt("flag"));
                requestList.add(requestVendor);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return  requestList;
        }   
    }
    
    public List<Vendor> viewNewPromotionalPostRequests(){
        List<Vendor> requestList=new ArrayList<Vendor>();
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM vendor_posts WHERE (flag=0)";

            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Vendor requestVendor = new Vendor();
                requestVendor.setRequestId(resultSet.getInt("postId"));
                requestVendor.setVendorID(resultSet.getString("vendorId"));
                requestVendor.setMessageTime(resultSet.getString("requestTime"));
                requestVendor.setFlag(resultSet.getInt("flag"));
                requestList.add(requestVendor);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return  requestList;
        }
        
        
    }
}
