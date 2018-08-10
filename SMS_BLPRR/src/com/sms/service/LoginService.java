package com.sms.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	String getLogin(HttpServletRequest request) throws SQLException, IOException;
	void updateLogin(HttpServletRequest request) throws SQLException;
	void updateAttempts(HttpServletRequest request) throws SQLException;
	void updateResetAttempts(HttpServletRequest request) throws SQLException;
	void updateResetAllAttempts() throws SQLException;
}
