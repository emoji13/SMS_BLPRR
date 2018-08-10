package com.sms.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IssuedSupplyService {
	void getIssuedSupplies(HttpServletRequest request);
	void insertIssuedSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException;
	void updateIssuedSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException;
}
