package classes;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.joda.time.LocalDate;

public class SuperAdmin extends Admin {

    /* start of loadAdmins method */
    public List<Admin> loadAdmins() throws SQLException {

        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String query;

        List<Admin> adminList = new ArrayList();              //arraylist to hold admin list

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get admin list
            query = "SELECT userID,userFirstName FROM user WHERE hidden=0 AND userPrivilage=1 ORDER BY userFirstName ASC";
            resultSet = dbConn.getResult(query, connection);

            //add admins to adminlist
            while (resultSet.next()) {
                Admin admin = new Admin();
                admin.setUserID(resultSet.getString(1));
                admin.setUserFirstname(resultSet.getString(2));

                adminList.add(admin);
            }

        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
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
        return adminList;
    }
    /* end of loadAdmins method */

    /* Start of registerAdmin method */
    public boolean registerAdmin(Admin admin) throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean inserted = false;               //To find whether admin inserted into the database

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //set userID of new user from calculateUserID method
            admin.setUserID(this.calculateUserID(connection, dbConn));

            //set password of new user from random password method
            admin.setUserPwd(this.randomPassword());

            //set userPrivilage
            admin.setUserPrivilage(1);

            //query to insert new admin to user table 
            query = "INSERT INTO user (userID,userFirstName,userLastName,userPwd,userNIC,userEmail,userContactNo,userPrivilage) VALUES ('" + admin.getUserID() + "','" + admin.getUserFirstname() + "','" + admin.getUserLastName() + "','" + admin.getUserPwd() + "','" + admin.getUserNIC() + "','" + admin.getUserEmail() + "','" + admin.getUserContactNo() + "','" + admin.getUserPrivilage() + "')";

            statement = connection.createStatement();
            int i = statement.executeUpdate(query);

            //Check whether user is inserted into user table
            if (i == 1) {
                inserted = true;
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
        return inserted;
    }
    /* End of registerAdmin method */

    /* Start of removeAdmin method */
    public String removeAdmin(String adminID) throws SQLException {

        Connection connection = null;
        DatabaseConnection dbConn;
        Statement statement;
        ResultSet resultSet = null;
        String query;
        String emailID = "";

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to hide admin from user table 
            query = "UPDATE user SET hidden=1 WHERE userID = '" + adminID + "'";

            statement = connection.createStatement();
            int i = statement.executeUpdate(query);

            //Check whether admin is hide from the user table
            if (i == 1) {
                query = "SELECT userEmail FROM user WHERE userID = '" + adminID + "'";

                resultSet = dbConn.getResult(query, connection);

                if (resultSet.next()) {
                    emailID = resultSet.getString(1);
                } else {
                    emailID = "1";                  //to verify that admin hide but unable to get email ID
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
        return emailID;
    }
    /* End of removeAdmin method */

    /* Start of checkAttendanceUpdate method */
    public boolean checkAttendanceUpdate(int nextYear) {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        boolean update = false;                     //to check update has happen or not

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to execute
            query = "SELECT updated FROM attendance_update WHERE year = '" + nextYear + "'";

            resultSet = dbConn.getResult(query, connection);

            //check resultset values
            if (resultSet.next()) {
                if (resultSet.getString(1).equals("1")) {
                    update = true;
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
        return update;
    }
    /* End of checkAttendanceUpdate method */

    /* Start of alterAttendanceTablesThursday */
    public boolean alterAttendanceTablesThursday() {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        boolean alter = false;

        List<LocalDate> thursdaysPastYear;            //date columns for thursdays
        List<LocalDate> thursdaysNextYear;            //date columns for thursdays
        
        LocalDate start, end;

        String[] thursdaysColumnsPastYear, thursdaysColumnsNextYear;            //date columns for database table

        try {

            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            Calendar calendar = Calendar.getInstance();
            //start = new LocalDate(calendar.get(Calendar.YEAR) - 1, 1, 1);
            //end = new LocalDate(calendar.get(Calendar.YEAR) + 1, 1, 1);
            start = new LocalDate(2017, 1, 1);
            end = new LocalDate(2018, 1, 1);
            
            thursdaysPastYear = this.getThursdays(start, end);

            //start = new LocalDate(calendar.get(Calendar.YEAR) + 1, 1, 1);
            //end = new LocalDate(calendar.get(Calendar.YEAR) + 2, 1, 1);
            start = new LocalDate(2016, 1, 1);
            end = new LocalDate(2017, 1, 1);

            thursdaysNextYear = this.getThursdays(start, end);

            /* create date columns for past year */
            thursdaysColumnsPastYear = new String[thursdaysPastYear.size()];
            int i = 0;
            for (LocalDate d : thursdaysPastYear) {
                thursdaysColumnsPastYear[i] = this.createDateColumnName(d);
                i++;
            }

            /* create date columns for next year */
            thursdaysColumnsNextYear = new String[thursdaysNextYear.size()];
            i = 0;
            for (LocalDate d : thursdaysNextYear) {
                thursdaysColumnsNextYear[i] = this.createDateColumnName(d);
                i++;
            }

            /* update database attendance table */
            i = 0;
            if (thursdaysColumnsPastYear.length == thursdaysColumnsNextYear.length) {
                for (String old : thursdaysColumnsPastYear) {
                    query = "ALTER TABLE attendance_th CHANGE COLUMN "
                            + old + " " + thursdaysColumnsNextYear[i]
                            + " INT(1) NOT NULL DEFAULT '0'";
                    //System.out.println(thursdaysColumnsPastYear[i] + " : " + query);
                    Statement statement = connection.createStatement();
                    int k = statement.executeUpdate(query);
                    if (k != 0) {
                        break;
                    }
                    i++;
                }
            } else if (thursdaysColumnsPastYear.length > thursdaysColumnsNextYear.length) {
                for (String old : thursdaysColumnsPastYear) {
                    if (i == (thursdaysColumnsPastYear.length - 1)) {
                        query = "ALTER TABLE attendance_th DROP COLUMN " + old;
                        //System.out.println(old + " o: " + query);
                        Statement statement = connection.createStatement();
                        int k = statement.executeUpdate(query);
                        if (k != 0) {
                            break;
                        }
                        break;
                    }
                    query = "ALTER TABLE attendance_th CHANGE COLUMN "
                            + old + " " + thursdaysColumnsNextYear[i]
                            + " INT(1) NOT NULL DEFAULT '0'";
                    //System.out.println(old + " o: " + query);
                    Statement statement = connection.createStatement();
                    int k = statement.executeUpdate(query);
                    if (k != 0) {
                        break;
                    }
                    i++;
                }
            } else {
                for (String next : thursdaysColumnsNextYear) {
                    if (i == (thursdaysColumnsNextYear.length - 1)) {
                        query = "ALTER TABLE attendance_th ADD COLUMN " + next + " INT(1) NOT NULL DEFAULT '0'";
                        //System.out.println(next + " n: " + query);
                        Statement statement = connection.createStatement();
                        int k = statement.executeUpdate(query);
                        if (k != 0) {
                            break;
                        }
                        break;
                    }
                    query = "ALTER TABLE attendance_th CHANGE COLUMN "
                            + thursdaysColumnsPastYear[i] + " " + next
                            + " INT(1) NOT NULL DEFAULT '0'";
                    //System.out.println(next + " n: " + query);
                    Statement statement = connection.createStatement();
                    int k = statement.executeUpdate(query);
                    if (k != 0) {
                        break;
                    }
                    i++;
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
        return alter;
    }
    /* End of alterAttendanceTablesThursday */
    
    /* Start of alterAttendanceTablesSaturday */
    public boolean alterAttendanceTablesSaturday() {

        Connection connection = null;
        DatabaseConnection dbConn;
        ResultSet resultSet = null;
        String query;

        boolean alter = false;

        List<LocalDate> saturdaysPastYear;            //date columns for saturday
        List<LocalDate> saturdaysNextYear;            //date columns for saturday
        LocalDate start, end;

        String[] saturdaysColumnsPastYear, saturdaysColumnsNextYear;                            //date columns for database table

        try {

            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            Calendar calendar = Calendar.getInstance();
            //start = new LocalDate(calendar.get(Calendar.YEAR) - 1, 1, 1);
            //end = new LocalDate(calendar.get(Calendar.YEAR) + 1, 1, 1);
            start = new LocalDate(2017, 1, 1);
            end = new LocalDate(2018, 1, 1);
            
            saturdaysPastYear = this.getSaturdays(start, end);

            //start = new LocalDate(calendar.get(Calendar.YEAR) + 1, 1, 1);
            //end = new LocalDate(calendar.get(Calendar.YEAR) + 2, 1, 1);
            start = new LocalDate(2016, 1, 1);
            end = new LocalDate(2017, 1, 1);

            saturdaysNextYear = this.getSaturdays(start, end);

            /* create date columns for past year */
            saturdaysColumnsPastYear = new String[saturdaysPastYear.size()];
            int i = 0;
            for (LocalDate d : saturdaysPastYear) {
                saturdaysColumnsPastYear[i] = this.createDateColumnName(d);
                i++;
            }

            /* create date columns for next year */
            saturdaysColumnsNextYear = new String[saturdaysNextYear.size()];
            i = 0;
            for (LocalDate d : saturdaysNextYear) {
                saturdaysColumnsNextYear[i] = this.createDateColumnName(d);
                i++;
            }

            /* update database attendance table */
            i = 0;
            if (saturdaysColumnsPastYear.length == saturdaysColumnsNextYear.length) {
                for (String old : saturdaysColumnsPastYear) {
                    query = "ALTER TABLE attendance_sa CHANGE COLUMN "
                            + old + " " + saturdaysColumnsNextYear[i]
                            + " INT(1) NOT NULL DEFAULT '0'";
                    //System.out.println(old + " : " + query);
                    Statement statement = connection.createStatement();
                    int k = statement.executeUpdate(query);
                    if (k != 0) {
                        break;
                    }
                    i++;
                }
            } else if (saturdaysColumnsPastYear.length > saturdaysColumnsNextYear.length) {
                for (String old : saturdaysColumnsPastYear) {
                    if (i == (saturdaysColumnsPastYear.length - 1)) {
                        query = "ALTER TABLE attendance_sa DROP COLUMN " + old;
                        //System.out.println(old + " o: " + query);
                        Statement statement = connection.createStatement();
                        int k = statement.executeUpdate(query);
                        if (k != 0) {
                            break;
                        }
                        break;
                    }
                    query = "ALTER TABLE attendance_sa CHANGE COLUMN "
                            + old + " " + saturdaysColumnsNextYear[i]
                            + " INT(1) NOT NULL DEFAULT '0'";
                    //System.out.println(old + " o: " + query);
                    Statement statement = connection.createStatement();
                    int k = statement.executeUpdate(query);
                    if (k != 0) {
                        break;
                    }
                    i++;
                }
            } else {
                for (String next : saturdaysColumnsNextYear) {
                    if (i == (saturdaysColumnsNextYear.length - 1)) {
                        query = "ALTER TABLE attendance_sa ADD COLUMN " + next + " INT(1) NOT NULL DEFAULT '0'";
                        //System.out.println(next + " n: " + query);
                        Statement statement = connection.createStatement();
                        int k = statement.executeUpdate(query);
                        if (k != 0) {
                            break;
                        }
                        break;
                    }
                    query = "ALTER TABLE attendance_sa CHANGE COLUMN "
                            + saturdaysColumnsPastYear[i] + " " + next
                            + " INT(1) NOT NULL DEFAULT '0'";
                    //System.out.println(next + " n: " + query);
                    Statement statement = connection.createStatement();
                    int k = statement.executeUpdate(query);
                    if (k != 0) {
                        break;
                    }
                    i++;
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
        return alter;
    }
    /* End of alterAttendanceTablesSaturday */
    
}
