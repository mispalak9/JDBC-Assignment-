// Day 2 Assignment 1 Using RowsFetcher ClassName
// RowsFetcher.java
package com.pengwin.palak.jdbc.day2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RowsFetcher {
    private int rowsPerPage = 5;

    // Constructor
    public RowsFetcher() {
    }

    public RowsFetcher(int rowsPerPage) {
        this.rowsPerPage = rowsPerPage;
    }

    public int getRowsPerPage() {
        return rowsPerPage;
    }

    public void setRowsPerPage(int rowsPerPage) {
        this.rowsPerPage = rowsPerPage;
    }

    public List<EmpData> getRowsPerPage(Connection connection, int pageNumber) throws SQLException {
        List<EmpData> empDataList = new ArrayList<>();
        int startRow = (pageNumber - 1) * rowsPerPage;

        String query = "SELECT * FROM employee LIMIT ?, ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, startRow);
            preparedStatement.setInt(2, rowsPerPage);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    EmpData empData = new EmpData(
                            resultSet.getInt("employeeId"),
                            resultSet.getString("name"),
                            resultSet.getString("title"),
                            resultSet.getString("address"),
                            resultSet.getString("homePhone")
                    );
                    empDataList.add(empData);
                }
            }
        }

        return empDataList;
    }
}
