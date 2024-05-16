// Day 2 Assignment 1 , Main class code for Execution
/*
package com.pengwin.palak.jdbc.day3;

public class Main {
    public static void main(String[] args) {
        RowSetDisplayer displayer = new RowSetDisplayer();
        displayer.displayEmpData(1); // Display using CachedRowSet
        displayer.displayEmpData(2); // Display using WebRowSet
    }
}
*/


// Day 3 Assignment 1 , Main class code for Execution
package com.pengwin.palak.jdbc.day3;

import javax.sql.rowset.CachedRowSet;
import java.sql.Date;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        // Fetch records
        FetcherAndAdder fetcherAndAdder = new FetcherAndAdder("select EmployeeID, LastName, FirstName, Title, BirthDate from Employees", "Northwind");
        CachedRowSet cachedRowSet = fetcherAndAdder.fetchRecords();
        displayResultSet(cachedRowSet);

        // Add a new record
        fetcherAndAdder.addRecord(999, "Doe", "John", "Manager", Date.valueOf("1990-01-01"));

        // Display records after adding
        cachedRowSet = fetcherAndAdder.fetchRecords();
        displayResultSet(cachedRowSet);
    }

    private static void displayResultSet(CachedRowSet rowSet) {
        try {
            while (rowSet.next()) {
                System.out.println("EmployeeID: " + rowSet.getString("EmployeeID") +
                        ", LastName: " + rowSet.getString("LastName") +
                        ", FirstName: " + rowSet.getString("FirstName") +
                        ", Title: " + rowSet.getString("Title") +
                        ", BirthDate: " + rowSet.getString("BirthDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
