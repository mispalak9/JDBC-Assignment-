// Day3 - Assignment 1 Using RowSetDisplayer Class
package com.pengwin.palak.jdbc.day3;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.WebRowSet;
import java.sql.SQLException;

public class RowSetDisplayer {
    public void displayEmpData(int typeOfRowSet) {
        DataFetcher dataFetcher = new DataFetcher("select EmployeeID, LastName, FirstName, Title, BirthDate from Employees", "Northwind");

        switch (typeOfRowSet) {
            case 1:
                CachedRowSet cachedRowSet = dataFetcher.executeInCached();
                displayResultSet(cachedRowSet);
                break;
            case 2:
                WebRowSet webRowSet = dataFetcher.executeInXML();
                displayResultSet(webRowSet);
                break;
            default:
                System.out.println("ERROR: Invalid row set type.");
        }
    }

    private void displayResultSet(CachedRowSet rowSet) {
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

    private void displayResultSet(WebRowSet rowSet) {
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
