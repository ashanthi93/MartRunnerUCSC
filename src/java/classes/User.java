package classes;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.joda.time.LocalDate;

public class User {

    /* User Attributes */
    private String userID, userFirstname, userLastName, userPwd, userNIC, userEmail, userContactNo;
    private int userPrivilage;
    private long lastLogon;

    /* Constructor */
    public User() {
        userID = "";
        userFirstname = "";
        userLastName = "";
        userPwd = "";
        userNIC = "";
        userEmail = "";
        userContactNo = "";
        userPrivilage = 0;
    }

    /*Start of getter methods*/
    public String getUserID() {
        return userID;
    }

    public String getUserFirstname() {
        return userFirstname;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public String getUserNIC() {
        return userNIC;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getUserContactNo() {
        return userContactNo;
    }

    public int getUserPrivilage() {
        return userPrivilage;
    }

    public long getLastLogon() {
        return lastLogon;
    }
    /*End of getter methods*/

    /*Start of setter methods*/
    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setUserFirstname(String userFirstname) {
        this.userFirstname = userFirstname;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public void setUserNIC(String userNIC) {
        this.userNIC = userNIC;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setUserContactNo(String userContactNo) {
        this.userContactNo = userContactNo;
    }

    public void setUserPrivilage(int userPrivilage) {
        this.userPrivilage = userPrivilage;
    }

    public void setLastLogon(long lastLogon) {
        this.lastLogon = lastLogon;
    }
    /*End of setter methods*/

    /* Start of LoginUser method */
    public int loginUser() throws SQLException {

        Connection connection = null;
        ResultSet resultSet = null;
        DatabaseConnection dbConn;

        int logged = 0;
        String query;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //Check whether user is registered user or not and get firstname and lastname of registered user
            query = "SELECT userPrivilage, userID, userFirstName, lastLogon FROM user WHERE userID = '" + this.userID + "' AND userPwd = SHA1('" + this.userPwd + "') AND hidden='0'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                //set userPrivilage of user
                this.setUserPrivilage(Integer.parseInt(resultSet.getString(1)));

                //set userID of user
                this.setUserID(resultSet.getString(2));

                //set firstname of user
                this.setUserFirstname(resultSet.getString(3));

                //set lastlogin time
                this.setLastLogon(Long.parseLong(resultSet.getString(4)));

                logged = 1;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
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
        //return privilage to logged into active home page
        return logged;
    }
    /* End of LoginUser method */

    /* Start of ChangeLastLogon method */
    public boolean changeLastLogon() throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean setTime = false;                //check change time is inserter or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update last logon time
            query = "UPDATE user SET lastLogon = '" + this.getLastLogon() + "' WHERE userID = '" + this.getUserID() + "'";

            statement = connection.createStatement();
            int i = statement.executeUpdate(query);

            if (i == 1) {
                setTime = true;        //Check whether last logon time is inserted into user table
            }

        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close eroor : " + e);
                }
            }
        }
        return setTime;
    }
    /* End of ChangeLastLogon method */

    /* Start of updateCell method*/
    public boolean updateCell(String fieldName, String cellValue) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean update = false;                 //to check whether update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update a cell value in user table
            query = "UPDATE user SET " + fieldName + " = TRIM(Replace(Replace(Replace('" + cellValue + "','\t',''),'\n',''),'\r','')) WHERE userID = '" + this.getUserID() + "'";

            statement = connection.createStatement();

            //to check whether update occurs or not
            if (statement.executeUpdate(query) == 1) {
                update = true;

                if ("userFirstName".equals(fieldName)) {
                    this.setUserFirstname(cellValue);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
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

    /* Start of updateNIC method */
    public boolean updateNIC(String cellValue) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean update = false;                 //to check whether update happens or not   

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update userNIC
            query = "UPDATE user SET userNIC = TRIM(Replace(Replace(Replace('" + cellValue + "','\t',''),'\n',''),'\r','')) WHERE userID='" + this.getUserID() + "'";

            statement = connection.createStatement();

            //to check whether update occurs or not
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
    /* End of updateNIC method */

    /* Start of updateContactNumber method */
    public boolean updateContactNumber(String cellValue) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean update = false;                         //to check whether update happens or not   

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to update userContatcNumber
            query = "UPDATE user SET userContactNo = TRIM(Replace(Replace(Replace('" + cellValue + "','\t',''),'\n',''),'\r','')) WHERE userID='" + this.getUserID() + "'";

            statement = connection.createStatement();

            //to check whether update occurs or not
            if (statement.executeUpdate(query) == 1) {
                update = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
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
    /* End of updateContactNumber method */

    /* Start of changePassword method */
    public int changePassword(String prvPassword, String newPassword) throws SQLException {
        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        ResultSet resultSet = null;
        String query;

        int change = 0;                      //to check whether password change or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to check current password
            query = "SELECT userID,userPwd FROM user WHERE userPwd = SHA1('" + prvPassword + "') AND userID = '" + this.getUserID() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {

                //query to update new password
                query = "UPDATE user SET userPwd = SHA1('" + newPassword + "') WHERE userID = '" + this.getUserID() + "'";

                statement = connection.createStatement();

                //check whether update happens or not
                if (statement.executeUpdate(query) == 1) {
                    change = 2;
                } else {
                    change = 1;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error : " + e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    System.err.println("Resultset close Error: " + e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    System.err.println("Connection close Error: " + e);
                }
            }
        }
        return change;
    }
    /* End of changePassword method */

    /* Start of getProfileDetails method */
    public boolean getProfileDetails() throws SQLException {
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        boolean get = false;            //check update happens or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to profile details 
            query = "SELECT userLastName, userNIC, userEmail, userContactNo FROM user WHERE userID = '" + this.getUserID() + "'";

            //execute query to get results
            resultSet = dbConn.getResult(query, connection);

            /* set user attributes */
            if (resultSet.next()) {
                this.setUserLastName(resultSet.getString(1));
                this.setUserNIC(resultSet.getString(2));
                this.setUserEmail(resultSet.getString(3));
                this.setUserContactNo(resultSet.getString(4));
                get = true;
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
    /* End of getProfileDetails method */

    /* Start of firstLogin method */
    public int firstLogin(String newPassword) throws SQLException {
        int log = 0;

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to check valid user logged in
            query = "SELECT userID, userFirstName, userPrivilage FROM user WHERE userID = '" + this.getUserID() + "' AND userPwd = '" + this.getUserPwd() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                log = 1;

                //set user attributes
                this.setUserID(resultSet.getString(1));
                this.setUserFirstname(resultSet.getString(2));
                this.setUserPrivilage(Integer.parseInt(resultSet.getString(3)));

                //update new password
                query = "UPDATE user SET userPwd = SHA1('" + newPassword + "') WHERE userID = '" + this.getUserID() + "'";

                statement = connection.createStatement();

                //check whether update happens or not
                if (statement.executeUpdate(query) == 1) {
                    log = 2;
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
        return log;
    }
    /* End of firstLogin method */

    /* Start of checkUser method */
    public int checkUser() throws SQLException {
        
        int in = 0;
        
        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to check valid user and not hidden 
            query = "SELECT hidden,userEmail FROM user WHERE userID = '" + this.getUserID() + "'";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                if ("0".equals(resultSet.getString(1))) {
                    in = 1;
                    this.setUserEmail(resultSet.getString(2));
                } else {
                    in = -1;
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
        return in;
    }
    /* End of checkUser method */
    
    /* Start of resetUserPwd method */
    public boolean resetUserPwd() throws SQLException {
        boolean reset = false;
        
        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        Statement statement;
        String query;

        try {
            connection = dbConn.setConnection();

            //query to reset password
            query = "UPDATE user SET userPwd = SHA1('" + this.getUserPwd() + "') WHERE userID = '" + this.getUserID() + "'";

            statement = connection.createStatement();

            //check whether update happens or not
            if (statement.executeUpdate(query) == 1) {
                reset = true;
            }
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

        return reset;
    }
    /* End of resetUserPwd method */
    
    /* start of getUserEmailID method */
    public boolean getUserEmailID() {

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        boolean getEmail = false;                       //to check email set or not

        try {
            connection = dbConn.setConnection();

            query = "SELECT userEmail FROM user WHERE userID = '" + this.getUserID() + "'";

            //get results from user table
            resultSet = dbConn.getResult(query, connection);

            //check resultset return value or not
            if (resultSet.next()) {
                this.setUserEmail(resultSet.getString(1));
                getEmail = true;
            }
        } catch (SQLException e) {
            System.err.println("SQLError : " + e);
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
        return getEmail;
    }
    /* end of getUserEmailID method */
    
    /* start of createDateColumnName */
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
    /* end of createDateColumnName */
}
