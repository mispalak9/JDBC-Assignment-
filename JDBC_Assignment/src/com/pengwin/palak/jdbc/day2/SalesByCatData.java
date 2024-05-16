// Day 2 Assignment 2 Using SalesByCatData ClassName
// SalesByCatData.java
package com.pengwin.palak.jdbc.day2;

public class SalesByCatData {
    private String productName;
    private double totalPurchase;

    // Constructor
    public SalesByCatData(String productName, double totalPurchase) {
        this.productName = productName;
        this.totalPurchase = totalPurchase;
    }

    // Getters and Setters
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getTotalPurchase() {
        return totalPurchase;
    }

    public void setTotalPurchase(double totalPurchase) {
        this.totalPurchase = totalPurchase;
    }
}
