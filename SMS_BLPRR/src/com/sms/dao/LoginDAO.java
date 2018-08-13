package com.sms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sms.entity.Login;

public interface LoginDAO {

	List<Login> getLogin() throws SQLException;
	void updateLogin(Map<String, Object> params) throws SQLException;
	void updateAttempts(Map<String, Object> params) throws SQLException;
	void updateResetAttempts(Map<String, Object> params) throws SQLException;
	void updateResetAllAttempts() throws SQLException;
}
