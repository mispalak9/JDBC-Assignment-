// Day 2 Assignment 2 Using DataDisplayer ClassName
// DataDisplayer.java
package com.pengwin.palak.jdbc.day2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class DataDisplayer {
    public static void displayRowsPerPage(Connection connection) {
        try (Scanner scanner = new Scanner(System.in)) {
            SalesByCategoryRunner runner = new SalesByCategoryRunner(7);
            System.out.println("Displaying records for Order Year = 1996 and Category name = Seafood:");
            displayRecords(runner, connection, "Seafood", 1996, scanner);

            System.out.println("\nDisplaying records for Order Year = 1996 and Category name = Produce:");
            displayRecords(runner, connection, "Produce", 1996, scanner);
        } catch (SQLException | InputMismatchException e) {
            e.printStackTrace();
        }
    }

    private static void displayRecords(SalesByCategoryRunner runner, Connection connection, String categoryName, int orderYear, Scanner scanner) throws SQLException {
        int pageNumber = 1;
        while (true) {
            System.out.println("Page Number: " + pageNumber);
            List<SalesByCatData> salesByCatDataList = runner.fetchRecords(connection, categoryName, orderYear);
            if (salesByCatDataList.isEmpty()) {
                System.out.println("No more records to display.");
                break;
            }

            System.out.println("ProductName\tTotalPurchase");
            for (SalesByCatData data : salesByCatDataList) {
                System.out.println(data.getProductName() + "\t" + data.getTotalPurchase());
            }

            System.out.println("Options: N - Next Page, P - Previous Page, X - Exit");
            String option = scanner.nextLine().toUpperCase();

            switch (option) {
                case "N":
                    pageNumber++;
                    break;
                case "P":
                    if (pageNumber > 1) {
                        pageNumber--;
                    } else {
                        System.out.println("Already at the first page.");
                    }
                    break;
                case "X":
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid option. Please try again.");
            }
        }
    }

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/Northwind";
        String username = "root";
        String password = "9812134298"; // Consider using more secure methods for storing passwords

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            displayRowsPerPage(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
