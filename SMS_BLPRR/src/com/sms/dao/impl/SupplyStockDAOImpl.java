package com.sms.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sms.dao.SupplyStockDAO;
import com.sms.entity.Supply;
import com.sms.entity.SupplyStock;

public class SupplyStockDAOImpl implements SupplyStockDAO {
	
private SqlMapClient sqlMapClient;
	
	public SqlMapClient getSqlMapClient(){
		return sqlMapClient;
	} 
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	@SuppressWarnings("unchecked")
	public List<SupplyStock> getSupplyStock() throws SQLException {
		List<SupplyStock> listSupplyStock = new ArrayList<>();
		try{
			listSupplyStock = this.getSqlMapClient().queryForList("getSupplyStock");
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return listSupplyStock;
	}
	
	@SuppressWarnings("unchecked")
	public List<Supply> getSupplyNames() throws SQLException {
		List<Supply> listSupplyNames = new ArrayList<>();
		try{
			listSupplyNames = this.getSqlMapClient().queryForList("getSupplyNames");
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return listSupplyNames;
	}
	
	@SuppressWarnings("unchecked")
	public List<Supply> getAllSupplyNames() throws SQLException {
		List<Supply> listSupplyNames = new ArrayList<>();
		try{
			listSupplyNames = this.getSqlMapClient().queryForList("getAllSupplyNames");
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return listSupplyNames;
	}
	
	@Override
	public void insertSupplyStock(Map<String, Object> params) throws SQLException {
		try{
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		
		this.getSqlMapClient().update("insertSupplyStock", params);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();
		
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}
	
	@Override
	public void updateAddedStock(Map<String, Object> params) throws SQLException {
		try{
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		
		this.getSqlMapClient().update("updateAddedStock", params);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();
		
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}
	
	@Override
	public void updateSupplyQuantity(Map<String, Object> params) throws SQLException {
		try{
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		
		this.getSqlMapClient().update("updateStockQuantity", params);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();
		
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<SupplyStock> searchSupplyStock(Map<String, Object> search) throws SQLException {
		List<SupplyStock> listSupplyStock = new ArrayList<>();
		try{
			listSupplyStock = this.getSqlMapClient().queryForList("searchSupplyStock", search);
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return listSupplyStock;
	}
	
	@Override
	public void updateSupplyStock(Map<String, Object> params) throws SQLException {
		try{
		this.sqlMapClient.startTransaction();
		this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
		this.sqlMapClient.startBatch();
		
		
		this.getSqlMapClient().update("updateSupplyStock", params);
		
		this.sqlMapClient.executeBatch();
		this.sqlMapClient.getCurrentConnection().commit();
		
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}
	
	
}
