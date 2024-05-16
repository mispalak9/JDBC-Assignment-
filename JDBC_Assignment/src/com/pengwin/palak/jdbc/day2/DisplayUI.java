// Day 2 Assignment 1 Using DisplayUI ClassName
// DisplayUI.java
package com.pengwin.palak.jdbc.day2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class DisplayUI {
    public static void displayRowsPerPage(Connection connection) {
        try (Scanner scanner = new Scanner(System.in)) {
            RowsFetcher rowsFetcher = new RowsFetcher(7);
            int pageNumber = 1;
            while (true) {
                System.out.println("Page Number: " + pageNumber);
                List<EmpData> empDataList = rowsFetcher.getRowsPerPage(connection, pageNumber);
                if (empDataList.isEmpty()) {
                    System.out.println("No more records to display.");
                    break;
                }

                System.out.println("EmployeeId\tName\tTitle\tAddress\tHomePhone");
                for (EmpData empData : empDataList) {
                    System.out.println(empData.getEmployeeId() + "\t" + empData.getName() + "\t" +
                            empData.getTitle() + "\t" + empData.getAddress() + "\t" + empData.getHomePhone());
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
        } catch (SQLException | InputMismatchException e) {
            e.printStackTrace();
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
