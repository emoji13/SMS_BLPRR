package com.sms.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sms.dao.UserDAO;
import com.sms.entity.User;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UserDAOImpl implements UserDAO{
	
	private SqlMapClient userSqlMapClient;

	public SqlMapClient getUserSqlMapClient() {
		return userSqlMapClient;
	}

	public void setUserSqlMapClient(SqlMapClient sqlMapClient) {
		this.userSqlMapClient = sqlMapClient;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadRecord() throws SQLException {
		// TODO Auto-generated method stub
		
		List<User> users = new ArrayList<>();
		try{
			users = this.getUserSqlMapClient().queryForList("loadRecord");
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return users;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadRecord(String userId) throws SQLException {
		// TODO Auto-generated method stub
		
		List<User> users = new ArrayList<>();
		try{
			if(userId == "" || userId == null){
				users = this.getUserSqlMapClient().queryForList("loadRecord");
			} else {
				User user = new User();
				user.setUserId(userId);
				users = this.getUserSqlMapClient().queryForList("loadRecord", user);
			}
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return users;
		
	}

	@Override
	public void insertRecord(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		
		try{
			this.userSqlMapClient.startTransaction();
			this.userSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.userSqlMapClient.startBatch();
			
			
			this.getUserSqlMapClient().update("insertRecord", params);
			
			this.userSqlMapClient.executeBatch();
			this.userSqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.userSqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.userSqlMapClient.endTransaction();
		}
		
	}

	@Override
	public void updateRecord(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.userSqlMapClient.startTransaction();
			this.userSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.userSqlMapClient.startBatch();
			
			
			this.getUserSqlMapClient().update("updateRecord", params);
			
			this.userSqlMapClient.executeBatch();
			this.userSqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.userSqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.userSqlMapClient.endTransaction();
		}
	}

	@Override
	public void updateLogDate(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.userSqlMapClient.startTransaction();
			this.userSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.userSqlMapClient.startBatch();
			
			
			this.getUserSqlMapClient().update("updateLogDate", params);
			
			this.userSqlMapClient.executeBatch();
			this.userSqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.userSqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.userSqlMapClient.endTransaction();
		}
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadProfile(String loggedId) throws SQLException {
		List<User> users = new ArrayList<>();
		try{
			if(loggedId == "" || loggedId == null){
				users = this.getUserSqlMapClient().queryForList("loadProfile");
			} else {
				User user = new User();
				user.setUserId(loggedId);
				users = this.getUserSqlMapClient().queryForList("loadProfile", user);
			}
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		return users;
	}

	@Override
	public void updateProfile(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.userSqlMapClient.startTransaction();
			this.userSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.userSqlMapClient.startBatch();
			
			
			this.getUserSqlMapClient().update("updateProfile", params);
			
			this.userSqlMapClient.executeBatch();
			this.userSqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.userSqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.userSqlMapClient.endTransaction();
		}
	}

	@Override
	public void updatePassword(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.userSqlMapClient.startTransaction();
			this.userSqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.userSqlMapClient.startBatch();
			
			
			this.getUserSqlMapClient().update("updatePassword", params);
			
			this.userSqlMapClient.executeBatch();
			this.userSqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.userSqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.userSqlMapClient.endTransaction();
		}
	}

}
