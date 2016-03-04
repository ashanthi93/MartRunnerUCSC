package classes;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.joda.time.DateTime;
import org.joda.time.Weeks;

public class Payment {

    private String paymentID, vendorID,vendorname;
    Date paidDate = new Date();
    Date expiredDate = new Date();
    Timestamp retPaidDate;
    Timestamp retExpiredDate;
    String[] attendancearray;
    private Object con;

    public Payment() {
        this.paymentID = "";
        this.vendorID = "";
        this.paidDate = null;
        this.expiredDate = null;
        this.vendorname = "";
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public void setVendorID(String vendorID) {
        this.vendorID = vendorID;
    }

    public void setPaidDate(Date paidDate) {
        this.paidDate = paidDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public String getVendorID() {
        return vendorID;
    }

    public Date getPaidDate() {
        return paidDate;
    }

    public String getVendorname() {
        return vendorname;
    }

    public void setVendorname(String vendorname) {
        this.vendorname = vendorname;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }
    
    

    //add payment methods
    // add payment Thursday method
    public boolean addPayment_Th(int duration) {
        Connection connection;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean inserted = false;
        try {
            int k;
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //set paid date to pass to the database
            retPaidDate = new Timestamp(paidDate.getTime());

            //calculate and set expired date
            this.calulateExpiredDate(duration);
            retExpiredDate = new Timestamp(expiredDate.getTime());

            System.out.println(retPaidDate);
            System.out.println("retExpiredDate" + retExpiredDate);

            //query for insert thursday payment
            query = "INSERT INTO payment_Th (vendorId,paidDate,expiredDate,hidden) VALUES ('" + this.getVendorID() + "','" + retPaidDate + "','" + retExpiredDate + "','0')";

            //query = "INSERT INTO payment_Th (vendorId,paidDate,expiredDate,hidden) VALUES ('v10016','2015-08-05','2015-05-25','0')";
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

    // add payment Saturday method
    public boolean addPayment_Sa(int duration) {
        Connection connection;
        DatabaseConnection dbConn;
        Statement statement;
        String query;

        boolean inserted = false;
        try {
            int k;
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //set paid date to pass to the database
            retPaidDate = new Timestamp(paidDate.getTime());

            //calculate and set expired date to pass to the database
            this.calulateExpiredDate(duration);
            retExpiredDate = new Timestamp(expiredDate.getTime());

            //query for insert thursday payment
            query = "INSERT INTO payment_sa (vendorId,paidDate,expiredDate,hidden) VALUES ('" + vendorID + "','" + retPaidDate + "','" + retExpiredDate + "','" + 0 + "')";

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

    // Calulation of expired date
    public void calulateExpiredDate(int duration) {
        Calendar calforattendance = Calendar.getInstance();
        calforattendance.setTime(this.getPaidDate());
        Date newdate = calforattendance.getTime();
        SimpleDateFormat newSimpleDate = new SimpleDateFormat("yyyy-MM-dd");
        String newsimpleStartDate = newSimpleDate.format(newdate);

        if (duration == 1) {
            // one day payment
            this.setExpiredDate(this.getPaidDate());
            attendancearray = new String[1];
            attendancearray[0] = newsimpleStartDate;

        } else if (duration == 2) {
            //One Month Payment

            //create calendar object
            Calendar cal = Calendar.getInstance();
            // get the paid date
            cal.setTime(this.getPaidDate());
            //increment it by one month
            cal.add(Calendar.WEEK_OF_YEAR, 3);
            //set the expired date
            this.setExpiredDate(cal.getTime());

            //set an array for set attendance
            attendancearray = new String[4];
            attendancearray[0] = newsimpleStartDate;

            for (int i = 1; i < 4; i++) {
                calforattendance.add(Calendar.WEEK_OF_YEAR, 1);
                newdate = calforattendance.getTime();

                newsimpleStartDate = newSimpleDate.format(newdate);
                attendancearray[i] = newsimpleStartDate;
                System.out.println("attendancearray" + attendancearray[i]);
            }

        } else {
            //Quarter Payment
            //create calendar object
            Calendar cal = Calendar.getInstance();
            // get the paid date
            cal.setTime(this.getPaidDate());
            //increment it by quarter
            cal.add(Calendar.WEEK_OF_YEAR, 11);
            //set the expired date
            this.setExpiredDate(cal.getTime());

            attendancearray = new String[12];
            attendancearray[0] = newsimpleStartDate;
            for (int i = 1; i < 12; i++) {
                calforattendance.add(Calendar.WEEK_OF_YEAR, 1);
                newdate = calforattendance.getTime();

                newsimpleStartDate = newSimpleDate.format(newdate);
                attendancearray[i] = newsimpleStartDate;
                System.out.println("attendancearray" + attendancearray[i]);
            }

            /* //print the paid date
             SimpleDateFormat startDate = new SimpleDateFormat("yyyy/MM/dd");
             String StartDate = startDate.format(this.getPaidDate());
             System.out.println(StartDate);

             //print the expired date 
             String newStartDate = startDate.format(this.getExpiredDate());
             System.out.println(newStartDate);
             */
        }
    }

    //View Payment functions
    // view payment thursday function
    public String[] viewPayment_Th() throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String[] dates = new String[2];
        //boolean inserted=false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get paidDate and expiredDate of given vendor
            query = "SELECT paidDate,expiredDate FROM payment_th where (vendorId = '" + this.getVendorID() + "') AND (hidden=0)";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                dates[0] = resultSet.getString(1);
                dates[1] = resultSet.getString(2);
                //inserted = true;

            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return dates;

    }

    //view payment saturday function
    public String[] viewPayment_Sa() throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String[] dates = new String[2];
        //boolean inserted=false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get paidDate and expiredDate of given vendor
            query = "SELECT paidDate,expiredDate FROM payment_sa where (vendorId = '" + this.getVendorID() + "') AND (hidden=0)";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                dates[0] = resultSet.getString(1);
                dates[1] = resultSet.getString(2);
                //inserted = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return dates;

    }

    //Method for check weather vendor is in the payment table
    // Thursday Method for check weather vendor is in the payment table
    public boolean checkPayment_Th() throws Exception {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String vendorId;
        boolean check = false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();
            //query to get paidDate and expiredDate of given vendor
            query = "SELECT * FROM payment_th WHERE (vendorId = '" + this.getVendorID() + "') AND (hidden=0)";

            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                vendorId = resultSet.getString(2);
                check = true;
            }

        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return check;

    }

    //Saturday Method for check weather vendor is in the payment table
    public boolean checkPayment_Sa() throws Exception {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String vendorId;
        boolean check = false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();
            //query to get paidDate and expiredDate of given vendor
            query = "SELECT * FROM payment_sa WHERE (vendorId = '" + this.getVendorID() + "') AND (hidden=0)";

            resultSet = dbConn.getResult(query, connection);

            while (resultSet.next()) {
                vendorId = resultSet.getString(2);
                check = true;
            }

        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return check;

    }

    //View Payment functions for vendor
    // view payment thursday function
    public String[] viewPayment_Vendor_Th() throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String[] dates = new String[2];
        //boolean inserted=false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();

            //query to get paidDate and expiredDate of given vendor
            query = "SELECT paidDate,expiredDate FROM payment_th where (vendorId = '" + this.getVendorID() + "') AND (hidden=0) ";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                dates[0] = resultSet.getString(1);
                dates[1] = resultSet.getString(2);
                //inserted = true;

            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return dates;

    }

    //view payment saturday function
    public String[] viewPayment_Vendor_Sa() throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        String[] dates = new String[2];
        //boolean inserted=false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();
            //query to get paidDate and expiredDate of given vendor
            query = "SELECT paidDate,expiredDate FROM payment_sa where (vendorId = '" + this.getVendorID() + "') AND (hidden=0)";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                dates[0] = resultSet.getString(1);
                dates[1] = resultSet.getString(2);
                //inserted = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return dates;

    }

    //method to check weather vendor belong to the market day(used in add payment)
    public boolean checkMarketDay(String day) throws SQLException {
        String query = "";
        DatabaseConnection dbConn;
        Connection connection = null;
        ResultSet resultSet = null;
        boolean inserted = false;

        try {
            dbConn = new DatabaseConnection();
            connection = dbConn.setConnection();
            //query to get paidDate and expiredDate of given vendor
            query = "SELECT vendorID FROM vendor_market where (vendorId = '" + this.getVendorID() + "') AND (marketDay = '" + day + "')";

            resultSet = dbConn.getResult(query, connection);

            //add paidDate and expiredDate in to a array
            while (resultSet.next()) {
                inserted = true;
            }
        } catch (SQLException e) {
            System.err.println("SQL error : " + e);
        } finally {
            resultSet.close();
            connection.close();
        }

        return inserted;
    }

    //set attendance of paid vendor
    //Set Attendance Thursday Method
    public boolean setAttendanceTh() throws SQLException, ParseException {

        Connection connection;
        DatabaseConnection dbConn;
        Statement statement = null;
        ResultSet resultSet;
        String query;
        boolean inserted = false;

        dbConn = new DatabaseConnection();
        connection = dbConn.setConnection();

        query = "select * FROM attendance_th WHERE vendorID='" + this.getVendorID() + "'";

        resultSet = dbConn.getResult(query, connection);

        if (resultSet.next()) { //check if vendor is in the attendance table
            ResultSetMetaData metaData = resultSet.getMetaData();
            int count = metaData.getColumnCount();
            inserted = this.setAttendanceBodyTh(count, metaData); // call the common method

        } else { // if vendor is not in the table first insert vendor
            query = "INSERT INTO attendance_th (vendorID) VALUES ('" + this.getVendorID() + "')";
            statement = connection.createStatement();
            int k = statement.executeUpdate(query);

            if (k == 1) { // if insertion is suceeded
                ResultSetMetaData metaData = resultSet.getMetaData();
                int count = metaData.getColumnCount();
                inserted = this.setAttendanceBodyTh(count, metaData);
            }
        }
        return inserted;
    }

//common part of setAttendanceTh() if and else is taken into this method
    public boolean setAttendanceBodyTh(int count, ResultSetMetaData metaData) throws SQLException, ParseException {
        Connection connection;
        DatabaseConnection dbConn;
        String lastColumn = null, lastDay = null;

        boolean inserted = false;

        dbConn = new DatabaseConnection();
        connection = dbConn.setConnection();

        //number of column
        String columnName[] = new String[count];

        for (int i = 1; i <= count; i++) {
            columnName[i - 1] = metaData.getColumnLabel(i);
            //System.out.println(columnName[i - 1]);
        }
        //get the last column in the table
        lastColumn = columnName[count - 1];
        lastColumn = lastColumn.replace('_', '-');
        //System.out.println("last column " + lastColumn);

        //convert last column to a date
        SimpleDateFormat lastColumnSimple = new SimpleDateFormat("yyyy-MM-dd");
        Date lastColumnDate = lastColumnSimple.parse(lastColumn);
        //System.out.println("last columnDate " + lastColumnDate);

        //get the last day of attendance
        int arraylength;
        arraylength = attendancearray.length;
        lastDay = attendancearray[arraylength - 1];
        //System.out.println("last day of attendance" + lastDay);

        //convert last column to a date
        SimpleDateFormat lastDaySimple = new SimpleDateFormat("yyyy-MM-dd");
        Date lastDayDate = lastDaySimple.parse(lastDay);

        try {
            //if ((lastColumnDate.after(lastDayDate) || (lastColumnDate.equals(lastDayDate)))) { // if lastday<= lastcolumn
            for (int j = 0; j < attendancearray.length; j++) {
                String Datecolumn = attendancearray[j].replace('-', '_');
                String query1 = "UPDATE attendance_th SET " + Datecolumn + "=? WHERE vendorId = ? ";
                PreparedStatement pst;
                pst = connection.prepareStatement(query1);
                pst.setString(2, this.getVendorID());
                pst.setInt(1, 1);
                int result = pst.executeUpdate();
                System.out.println("result" + result);
                inserted = true;
            }

            /*} else { //lastday>lastcolumn
             for (int k = 0; k < attendancearray.length; k++) {
             String Datecolumn = attendancearray[k].replace('-', '_');
             System.out.println("datecolumn alter" + Datecolumn);
             String query2 = "ALTER TABLE attendance_th ADD COLUMN " + Datecolumn + " INT(1)NOT NULL DEFAULT 0"; // adding new columns to the table
             PreparedStatement pst1;
             pst1 = connection.prepareStatement(query2);
             int result1 = pst1.executeUpdate();
             System.out.println("result1" + result1);

             String query3 = "UPDATE attendance_th SET " + Datecolumn + "=? WHERE vendorId = ? ";
             PreparedStatement pst2;
             pst2 = connection.prepareStatement(query3);
             pst2.setString(2, this.getVendorID());
             pst2.setInt(1, 1);
             int result2 = pst2.executeUpdate();
             System.out.println("result2" + result2);
             inserted = true;
             }
             }*/
        } catch (Exception e) {
            System.out.println("exception" + e);
        }
        return inserted;
    }

    //Set Attendance Saturday Method
    public boolean setAttendanceSa() throws SQLException, ParseException {

        Connection connection;
        DatabaseConnection dbConn;
        Statement statement = null;
        ResultSet resultSet;
        String query, lastColumn = null, lastDay = null;
        String column;
        Date[] period;
        boolean inserted = false;

        dbConn = new DatabaseConnection();
        connection = dbConn.setConnection();

        query = "select * FROM attendance_sa WHERE vendorID='" + this.getVendorID() + "'";

        resultSet = dbConn.getResult(query, connection);
        if (resultSet.next()) {
            ResultSetMetaData metaData = resultSet.getMetaData();
            int count = metaData.getColumnCount();
            inserted = this.setAttendanceBodySa(count, metaData);

        } else {
            query = "INSERT INTO attendance_sa (vendorID) VALUES ('" + this.getVendorID() + "')";
            statement = connection.createStatement();
            int k = statement.executeUpdate(query);
            if (k == 1) {

                ResultSetMetaData metaData = resultSet.getMetaData();
                int count = metaData.getColumnCount();
                inserted = this.setAttendanceBodySa(count, metaData);

            }
        }

        inserted = true;

        return inserted;
    }

    //common part of setAttendanceSa() method if and else is taken into this method
    public boolean setAttendanceBodySa(int count, ResultSetMetaData metaData) throws SQLException, ParseException {
        Connection connection;
        DatabaseConnection dbConn;
        String lastColumn = null, lastDay = null;
        boolean inserted = false;

        dbConn = new DatabaseConnection();
        connection = dbConn.setConnection();

        //number of column
        String columnName[] = new String[count];

        for (int i = 1; i <= count; i++) {
            columnName[i - 1] = metaData.getColumnLabel(i);
            //System.out.println(columnName[i - 1]);
        }
        //get the last column in the table
        lastColumn = columnName[count - 1];
        lastColumn = lastColumn.replace('_', '-');

        //convert last column to a date
        SimpleDateFormat lastColumnSimple = new SimpleDateFormat("yyyy-MM-dd");
        Date lastColumnDate = lastColumnSimple.parse(lastColumn);

        //get the last day of attendance
        int arraylength;
        arraylength = attendancearray.length;
        lastDay = attendancearray[arraylength - 1];

        //convert last column to a date
        SimpleDateFormat lastDaySimple = new SimpleDateFormat("yyyy-MM-dd");
        Date lastDayDate = lastDaySimple.parse(lastDay);

        try {
            // if ((lastColumnDate.after(lastDayDate) || (lastColumnDate.equals(lastDayDate)))) {
            for (int j = 0; j < attendancearray.length; j++) {
                String Datecolumn = attendancearray[j].replace('-', '_');
                String query1 = "UPDATE attendance_sa SET " + Datecolumn + "=? WHERE vendorId = ? ";
                PreparedStatement pst;
                pst = connection.prepareStatement(query1);
                pst.setString(2, this.getVendorID());
                pst.setInt(1, 1);
                int result = pst.executeUpdate();
                System.out.println("result" + result);
                inserted = true;
            }

            /*  } else {
             for (int k = 0; k < attendancearray.length; k++) {
             String Datecolumn = attendancearray[k].replace('-', '_');
             System.out.println("datecolumn alter" + Datecolumn);
             String query2 = "ALTER TABLE attendance_sa ADD COLUMN " + Datecolumn + " INT(1)NOT NULL DEFAULT 0";
             PreparedStatement pst1;
             pst1 = connection.prepareStatement(query2);
             int result1 = pst1.executeUpdate();
             System.out.println("result1" + result1);

             String query3 = "UPDATE attendance_sa SET " + Datecolumn + "=? WHERE vendorId = ? ";
             PreparedStatement pst2;
             pst2 = connection.prepareStatement(query3);
             pst2.setString(2, this.getVendorID());
             pst2.setInt(1, 1);
             int result2 = pst2.executeUpdate();
             System.out.println("result2" + result2);
             inserted = true;
             }
             }*/
        } catch (Exception e) {
            System.out.println("exception" + e);
        }
        return inserted;
    }

    public boolean incrementExpiredDate(Vendor vendor, String day) {
        boolean increment = false;

        DatabaseConnection dbConn = new DatabaseConnection();
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement = null;

        String query, expiredDate;

        DateFormat dateF;

        try {

            connection = dbConn.setConnection();

            if (day.equals("TH")) {
                query = "SELECT expiredDate FROM payment_th WHERE vendorId = '" + vendor.getVendorID() + "'";
            } else {
                query = "SELECT expiredDate FROM payment_sa WHERE vendorId = '" + vendor.getVendorID() + "'";
            }
            resultSet = dbConn.getResult(query, connection);

            if (resultSet.next()) {
                expiredDate = resultSet.getString(1);

            }
        } catch (SQLException e) {
            System.err.println("SQLError : " + e);
        }

        return increment;
    }

    //Retriving the payment object of a given vendor
    public Payment getVendorPayment(String id, String marketDay) {
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();
            if (marketDay.equals("TH")) {

                String query = "SELECT paymentThID,paidDate,expiredDate FROM payment_th WHERE (vendorID='" + id + "') AND (hidden=0)";
                ResultSet resultSet = statement.executeQuery(query);

                if (resultSet.next()) {
                    this.setPaymentID(resultSet.getString("paymentThID"));
                    this.setVendorID(id);
                    this.setPaidDate(resultSet.getDate("paidDate"));
                    this.setExpiredDate(resultSet.getDate("expiredDate"));
                }
            } else if (marketDay.equals("SA")) {
                String query = "SELECT paymentSaID,paidDate,expiredDate FROM payment_sa WHERE (vendorID='" + id + "')  AND (hidden=0)";
                ResultSet resultSet = statement.executeQuery(query);
                if (resultSet.next()) {
                    this.setPaymentID(resultSet.getString("paymentSaID"));
                    this.setVendorID(id);
                    this.setPaidDate(resultSet.getDate("paidDate"));
                    this.setExpiredDate(resultSet.getDate("expiredDate"));
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return this;
        }
    }

    //use to remove a Thurday payment
    public boolean removeThurdayPayment(String id) throws SQLException {
        boolean isRemoved = false;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE payment_th SET hidden=1 WHERE (paymentThID='" + id + "')";
            int result = statement.executeUpdate(query);
            isRemoved = (result > 0) ? true : false;

        } catch (SQLException ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isRemoved;
        }
    }

    //use to remove a Saturday payment
    public boolean removeSaturdayPayment(String id) throws SQLException {
        boolean isRemoved = false;
        try {
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "UPDATE payment_sa SET hidden=1 WHERE (paymentSaID='" + id + "')";
            int result = statement.executeUpdate(query);
            isRemoved = (result > 0) ? true : false;

        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            return isRemoved;
        }
    }

    public boolean updatePayment(String marketday, int duration) throws SQLException {
        boolean isAdded = false;
        try {
            retPaidDate = new Timestamp(paidDate.getTime());
            this.setPaidDate(retPaidDate);
            this.calulateExpiredDate(duration);
            retExpiredDate = new Timestamp(expiredDate.getTime());
            this.setExpiredDate(retExpiredDate);
            System.out.println("exp date : " + this.getExpiredDate());
            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();
            String query = "";
            if (marketday.equals("TH")) {
                query = "UPDATE payment_th SET paidDate='" + this.getPaidDate() + "',expiredDate='" + this.getExpiredDate() + "' WHERE (vendorId='" + this.getVendorID() + "')";
            }
            if (marketday.equals("SA")) {
                query = "UPDATE payment_sa SET paidDate='" + this.getPaidDate() + "',expiredDate='" + this.getExpiredDate() + "' WHERE (vendorId='" + this.getVendorID() + "')";
            }
            int result = statement.executeUpdate(query);
            isAdded = (result > 0) ? true : false;

        } catch (SQLException ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isAdded;
        }
    }

    public boolean removeAttendanceTh(String id) {
        boolean isRemoved = false;
        try {

            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM payment_th WHERE (paymentThID='" + id + "')";

            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                this.paidDate = resultSet.getDate("paidDate");
                this.expiredDate = resultSet.getDate("expiredDate");
                System.out.println("paidDate" + this.getPaidDate());
                System.out.println("expDate" + this.getExpiredDate());

                Calendar calforattendance = Calendar.getInstance();
                calforattendance.setTime(this.getPaidDate());
                Date newdate = calforattendance.getTime();
                SimpleDateFormat newSimpleDate = new SimpleDateFormat("yyyy-MM-dd");
                String newsimpleStartDate = newSimpleDate.format(newdate);

                if (this.getPaidDate().equals(this.expiredDate)) {
                    // one day payment
                    attendancearray = new String[1];
                    attendancearray[0] = newsimpleStartDate;

                } else {
                    DateTime dateTime1 = new DateTime(this.getPaidDate());
                    DateTime dateTime2 = new DateTime(this.getExpiredDate());

                    int weeks = Weeks.weeksBetween(dateTime1, dateTime2).getWeeks();
                    int arraySize = weeks + 1;
                    attendancearray = new String[arraySize];
                    attendancearray[0] = newsimpleStartDate;

                    for (int i = 1; i < arraySize; i++) {
                        calforattendance.add(Calendar.WEEK_OF_YEAR, 1);
                        newdate = calforattendance.getTime();
                        newsimpleStartDate = newSimpleDate.format(newdate);
                        attendancearray[i] = newsimpleStartDate;
                        System.out.println("attendancearray" + attendancearray[i]);
                    }

                    for (int j = 0; j < attendancearray.length; j++) {
                        String Datecolumn = attendancearray[j].replace('-', '_');
                        String query1 = "UPDATE attendance_th SET " + Datecolumn + "=? WHERE vendorId = ? ";
                        PreparedStatement pst;
                        pst = connection.prepareStatement(query1);
                        pst.setString(2, this.getVendorID());
                        pst.setInt(1, 0);
                        int result = pst.executeUpdate();
                        System.out.println("result" + result);
                        isRemoved = true;
                    }

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isRemoved;

        }

    }
    
    public boolean removeAttendanceSa(String id) {
        boolean isRemoved = false;
        try {

            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = databaseConnection.setConnection();
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM payment_sa WHERE (paymentSaID='" + id + "')";

            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                this.paidDate = resultSet.getDate("paidDate");
                this.expiredDate = resultSet.getDate("expiredDate");
                System.out.println("paidDate" + this.getPaidDate());
                System.out.println("expDate" + this.getExpiredDate());

                Calendar calforattendance = Calendar.getInstance();
                calforattendance.setTime(this.getPaidDate());
                Date newdate = calforattendance.getTime();
                SimpleDateFormat newSimpleDate = new SimpleDateFormat("yyyy-MM-dd");
                String newsimpleStartDate = newSimpleDate.format(newdate);

                if (this.getPaidDate().equals(this.expiredDate)) {
                    // one day payment
                    attendancearray = new String[1];
                    attendancearray[0] = newsimpleStartDate;

                } else {
                    DateTime dateTime1 = new DateTime(this.getPaidDate());
                    DateTime dateTime2 = new DateTime(this.getExpiredDate());

                    int weeks = Weeks.weeksBetween(dateTime1, dateTime2).getWeeks();
                    int arraySize = weeks + 1;
                    attendancearray = new String[arraySize];
                    attendancearray[0] = newsimpleStartDate;

                    for (int i = 1; i < arraySize; i++) {
                        calforattendance.add(Calendar.WEEK_OF_YEAR, 1);
                        newdate = calforattendance.getTime();
                        newsimpleStartDate = newSimpleDate.format(newdate);
                        attendancearray[i] = newsimpleStartDate;
                        System.out.println("attendancearray" + attendancearray[i]);
                    }

                    for (int j = 0; j < attendancearray.length; j++) {
                        String Datecolumn = attendancearray[j].replace('-', '_');
                        String query1 = "UPDATE attendance_sa SET " + Datecolumn + "=? WHERE vendorId = ? ";
                        PreparedStatement pst;
                        pst = connection.prepareStatement(query1);
                        pst.setString(2, this.getVendorID());
                        pst.setInt(1, 0);
                        int result = pst.executeUpdate();
                        System.out.println("result" + result);
                        isRemoved = true;
                    }

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isRemoved;

        }

    }
}
