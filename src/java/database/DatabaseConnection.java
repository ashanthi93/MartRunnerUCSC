package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    public Connection connection;
    public Statement statement;
    public ResultSet resultSet;
    
    public DatabaseConnection(){}
    
    public Connection setConnection() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/martrunner", "root","ashi");
        }
        catch(ClassNotFoundException e){
            System.err.println("Couldn't find databse driver : " + e.getMessage());
        }
        return connection;
    }
    
    public ResultSet getResult(String query, Connection connection){
        this.connection = connection;
        try{
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
        }
        catch(SQLException e){
            System.err.println("SQL Problem : " + e.getMessage());
            System.err.println("SQL State : " + e.getMessage());
            System.err.println("Vendor error : " + e.getMessage());
        }
        return resultSet;
    }
}
