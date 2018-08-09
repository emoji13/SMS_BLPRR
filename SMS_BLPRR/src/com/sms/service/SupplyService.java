package com.sms.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface SupplyService {
	void getSupplies(HttpServletRequest request) throws SQLException;
	void getSupplyTypes(HttpServletRequest request) throws SQLException;
	void insertSupply(HttpServletRequest request) throws SQLException;
	void updateSupply(HttpServletRequest request) throws SQLException;
	void searchSupply(HttpServletRequest request) throws SQLException;
}
