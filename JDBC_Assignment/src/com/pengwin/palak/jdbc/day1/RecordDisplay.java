// Day1 - Assignment 1 Using RecordDisplay Class
package com.pengwin.palak.jdbc.day1;
import java.sql.*;
// Class name: RecordDisplay
public class RecordDisplay {
    private Connection conn;

    // Method to establish connection to the database
    public void connect(String dbName, String username, String password) {
        try {
            // Update to use the new MySQL JDBC driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/" + dbName + "?useSSL=false&serverTimezone=UTC";
            // Establish connection using DriverManager
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to database successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to close the connection
    public void disconnect() {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Connection closed successfully.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to display records
    public void displayRecords() {
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Name, Title, CONCAT(Address, ', ', City, ', ', Country) AS Address, HomePhone FROM Employee");



            // Print column headers
            System.out.println("EmployeeID\tName\tTitle\tAddress\tHomePhone");

            // Print each record
            while (rs.next()) {
                System.out.println(rs.getInt("EmployeeID") + "\t" +
                        rs.getString("Name") + "\t" +
                        rs.getString("Title") + "\t" +
                        rs.getString("Address") + "\t" +
                        rs.getString("HomePhone"));
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Main class is used to call the logic.
    public static void main(String[] args) {
        RecordDisplay recordDisplay = new RecordDisplay();
        // Connect to the "Northwind" database with provided credentials
        recordDisplay.connect("northwind", "root", "9812134298");
        // Display records from the "Employee" table
        recordDisplay.displayRecords();
        // Disconnect from the database
        recordDisplay.disconnect();
    }
}

// Day 1 Assignment 2 Java Code is provided down with the same given classname. I have made modifications to incorporate some features based on Assignment 2 questions. However, to run this program, we need to separately execute Assignment 2 and Assignment 1 so that we can obtain outputs independently according to the respective questions.
// Using RecordDisplay Class

/* package com.pengwin.palak.jdbc.day1;
import java.sql.*;

public class RecordDisplay {
    private Connection conn;

    // Method to establish connection to the database
    public void connect(String dbName, String username, String password) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/" + dbName + "?useSSL=false&serverTimezone=UTC";
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to database successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to close the connection
    public void disconnect() {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Connection closed successfully.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to display records, with optional employeeID for filtering
    public void displayRecords(Integer employeeID) {
        try {
            // Create SQL query, with WHERE clause if employeeID is provided
            String query = "SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Name, Title, CONCAT(Address, ', ', City, ', ', Country) AS Address, HomePhone FROM Employee";
            if (employeeID != null) {
                query += " WHERE EmployeeID = " + employeeID;
            }

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Print column headers
            System.out.println("EmployeeID\tName\tTitle\tAddress\tHomePhone");

            // Print each record
            while (rs.next()) {
                System.out.println(rs.getInt("EmployeeID") + "\t" +
                        rs.getString("Name") + "\t" +
                        rs.getString("Title") + "\t" +
                        rs.getString("Address") + "\t" +
                        rs.getString("HomePhone"));
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Main class is used to call the logic.
    public static void main(String[] args) {
        RecordDisplay recordDisplay = new RecordDisplay();
        // Connect to the "Northwind" database with provided credentials
        recordDisplay.connect("northwind", "root", "9812134298");
        // Display records from the "Employee" table
        recordDisplay.displayRecords(null);  // Display all records
        recordDisplay.displayRecords(1);  // Display record for employee with ID 1
        // Disconnect from the database
        recordDisplay.disconnect();
    }
}
*/