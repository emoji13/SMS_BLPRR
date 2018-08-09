package com.sms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sms.entity.IssuedSupply;

public interface IssuedSuppliesDAO {
	List<IssuedSupply> getIssuedSupplies(String param);
	void insertIssuedSupply(Map<String, Object> params) throws SQLException;
	void updateIssuedSupply(Map<String, Object> params) throws SQLException;
}
