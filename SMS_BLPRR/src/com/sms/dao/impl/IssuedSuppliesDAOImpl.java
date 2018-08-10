package com.sms.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sms.dao.IssuedSuppliesDAO;
import com.sms.entity.IssuedSupply;

public class IssuedSuppliesDAOImpl implements IssuedSuppliesDAO{
	private static final Logger LOGGER = LogManager.getLogger(IssuedSuppliesDAOImpl.class.getName());
	
	private SqlMapClient issSuppSqlMapClient;
	
	public SqlMapClient getIssSuppSqlMapClient() {
		return issSuppSqlMapClient;
	}
	
	public void setIssSuppSqlMapClient(SqlMapClient issSuppSqlMapClient) {
		this.issSuppSqlMapClient = issSuppSqlMapClient;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IssuedSupply> getIssuedSupplies(String param){
		List<IssuedSupply> isssuedSupplies = new ArrayList<>();
		try {
			isssuedSupplies = this.getIssSuppSqlMapClient().queryForList("getIssuedSupplies", param.toLowerCase());
			LOGGER.info("Issued supplies queried.");
		} catch (SQLException e) {
			LOGGER.error(e.getMessage());
		}
		return isssuedSupplies;
	}

	@Override
	public void insertIssuedSupply(Map<String, Object> params) throws SQLException {
		try{
			this.issSuppSqlMapClient.startTransaction();
			this.issSuppSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.issSuppSqlMapClient.startBatch();
			
			this.getIssSuppSqlMapClient().update("insertIssuedSupply", params);
			
			this.issSuppSqlMapClient.executeBatch();
			this.issSuppSqlMapClient.getCurrentConnection().commit();
			LOGGER.info("Supply have been issued.");
		} catch(SQLException e){
			LOGGER.error(e.getMessage());
			this.issSuppSqlMapClient.getCurrentConnection().rollback();
		} finally{
			this.issSuppSqlMapClient.endTransaction();
		}
	}

	@Override
	public void updateIssuedSupply(Map<String, Object> params) throws SQLException {
		try{
			this.issSuppSqlMapClient.startTransaction();
			this.issSuppSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.issSuppSqlMapClient.startBatch();
			
			this.getIssSuppSqlMapClient().update("updateIssuedSupply", params);
			
			this.issSuppSqlMapClient.executeBatch();
			this.issSuppSqlMapClient.getCurrentConnection().commit();
			LOGGER.info("Issued supply have been updated.");
		} catch(SQLException e){
			LOGGER.error(e.getMessage());
			this.issSuppSqlMapClient.getCurrentConnection().rollback();
		} finally{
			this.issSuppSqlMapClient.endTransaction();
		}
		
	}

	@Override
	public void updateSupplyActualCount(Map<String, Object> params) throws SQLException {
		try{
			this.issSuppSqlMapClient.startTransaction();
			this.issSuppSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.issSuppSqlMapClient.startBatch();
			
			this.getIssSuppSqlMapClient().update("updateSupplyActualCount", params);
			
			this.issSuppSqlMapClient.executeBatch();
			this.issSuppSqlMapClient.getCurrentConnection().commit();
			LOGGER.info("Supply actual count have been updated.");
		} catch(SQLException e){
			LOGGER.error(e.getMessage());
			this.issSuppSqlMapClient.getCurrentConnection().rollback();
		} finally{
			this.issSuppSqlMapClient.endTransaction();
		}
	}
	
	
}
