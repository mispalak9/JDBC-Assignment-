// Day3 - Assignment 1 Using DataFetcher Class
package com.pengwin.palak.jdbc.day3;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.JdbcRowSet;
import javax.sql.rowset.WebRowSet;
import java.sql.*;

public class DataFetcher {
    private String command;
    private String dataSourceName;
    private String url;
    private String username;
    private String password;

    public DataFetcher(String command, String dataSourceName) {
        this.command = command;
        this.dataSourceName = dataSourceName;
        this.url = "jdbc:mysql://localhost:3306/" + dataSourceName;
        this.username = "root";
        this.password = "9812134298";
    }

    public void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public CachedRowSet executeInCached() {
        connect();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement(command);
             ResultSet resultSet = statement.executeQuery()) {

            CachedRowSet cachedRowSet = javax.sql.rowset.RowSetProvider.newFactory().createCachedRowSet();
            cachedRowSet.populate(resultSet);
            return cachedRowSet;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public WebRowSet executeInXML() {
        connect();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = connection.prepareStatement(command);
             ResultSet resultSet = statement.executeQuery()) {

            WebRowSet webRowSet = javax.sql.rowset.RowSetProvider.newFactory().createWebRowSet();
            webRowSet.populate(resultSet);
            return webRowSet;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public JdbcRowSet executeInJdbc() {
        connect();
        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            JdbcRowSet jdbcRowSet = javax.sql.rowset.RowSetProvider.newFactory().createJdbcRowSet();
            jdbcRowSet.setUrl(url);
            jdbcRowSet.setUsername(username);
            jdbcRowSet.setPassword(password);
            jdbcRowSet.setCommand(command);
            jdbcRowSet.execute();
            return jdbcRowSet;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
