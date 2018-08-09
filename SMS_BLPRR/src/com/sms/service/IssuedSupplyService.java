package com.sms.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface IssuedSupplyService {
	void getIssuedSupplies(HttpServletRequest request);
	void insertIssuedSupply(HttpServletRequest request) throws SQLException;
	void updateIssuedSupply(HttpServletRequest request) throws SQLException;
}
