package com.sms.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface SupplyStockService {
	void getSupplyStock(HttpServletRequest request) throws SQLException;
	void getSupplyNames(HttpServletRequest request) throws SQLException;
	void insertSupplyStock(HttpServletRequest request) throws SQLException;
	void updateAddedStock(HttpServletRequest request) throws SQLException;
	void searchSupplyStock(HttpServletRequest request) throws SQLException;
	void updateSupplyStock(HttpServletRequest request) throws SQLException;
	void updateSupplyQuantity(HttpServletRequest request) throws SQLException;
}
