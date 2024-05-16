// Day 2 Assignment 2 Using SalesByCategoryRunner ClassName
// SalesByCategoryRunner.java
package com.pengwin.palak.jdbc.day2;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SalesByCategoryRunner {
    private int rowsPerPage = 5;

    // Constructor
    public SalesByCategoryRunner() {
    }

    public SalesByCategoryRunner(int rowsPerPage) {
        this.rowsPerPage = rowsPerPage;
    }

    public int getRowsPerPage() {
        return rowsPerPage;
    }

    public void setRowsPerPage(int rowsPerPage) {
        this.rowsPerPage = rowsPerPage;
    }

    public List<SalesByCatData> fetchRecords(Connection connection, String categoryName, int orderYear) throws SQLException {
        List<SalesByCatData> salesByCatDataList = new ArrayList<>();

        try (CallableStatement callableStatement = connection.prepareCall("{call SalesByCategory(?, ?)}")) {
            callableStatement.setString(1, categoryName);
            callableStatement.setInt(2, orderYear);
            try (ResultSet resultSet = callableStatement.executeQuery()) {
                while (resultSet.next()) {
                    SalesByCatData data = new SalesByCatData(
                            resultSet.getString("ProductName"),
                            resultSet.getDouble("TotalPurchase")
                    );
                    salesByCatDataList.add(data);
                }
            }
        }
        return salesByCatDataList;
    }
}
