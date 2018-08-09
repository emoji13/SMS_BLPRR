package com.sms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sms.entity.Supply;


public interface SupplyDAO {
	List<Supply> getSupplies() throws SQLException;
	List<Supply> getSupplyTypes() throws SQLException;
	List<Supply> searchSupply(String searchKey) throws SQLException;
	void insertSupply(Map<String, Object> params) throws SQLException;
	void updateSupply(Map<String, Object> params) throws SQLException;
}
