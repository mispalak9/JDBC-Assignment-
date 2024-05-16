// Day1 - Assignment3, Using TableRowPrinter Class
package com.pengwin.palak.jdbc.day1;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class TableRowPrinter {
    private Connection conn;

    public void connect() {
        String url = PropertyUtil.getProperty("db.url");
        String username = PropertyUtil.getProperty("db.username");
        String password = PropertyUtil.getProperty("db.password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to database successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

    public void displayRecords() {
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Name, Title, CONCAT(Address, ', ', City, ', ', Country) AS Address, HomePhone FROM Employee");

            System.out.println("EmployeeID\tName\tTitle\tAddress\tHomePhone");

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

    public static void main(String[] args) {
        TableRowPrinter printer = new TableRowPrinter();
        printer.connect();
        printer.displayRecords();
        printer.disconnect();
    }
}

