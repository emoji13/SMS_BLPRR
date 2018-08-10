package com.sms.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sms.dao.LoginDAO;
import com.sms.entity.Login;
import com.sms.service.LoginService;


public class LoginServiceImpl implements LoginService {

	private LoginDAO loginDAO;
	
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	@Override
	public String getLogin(HttpServletRequest request) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String user_name = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String message="";
		List<Login> list = loginDAO.getLogin();
		int countUser=0;
		String message2="";
	
		for(int i=0;i<list.size();i++){	
			if(list.get(i).getUsername().equals(user_name)){
				session.setAttribute("user", user_name);
				if(list.get(i).getPassword().equals(password)){
					session.setAttribute("pass", password);
					session.setAttribute("access",list.get(i).getAccessLevel());
					session.setAttribute("tag", list.get(i).getActiveTag());
					message ="SUCCESS";
				}else{
					session.setAttribute("tag", list.get(i).getActiveTag()); 
				}
				countUser += 1;
				
				if(list.get(i).getAttempts().equals(2)){
					session.setAttribute("message_locked_invalid","Account Locked.Please contact the Administrator");
	                message2="LOCKED";
				}else{
					session.setAttribute("message_locked_invalid","Invalid username or password.");
				}
			}else{
				countUser += 0;
			}
		}
		session.setAttribute("message2",message2);
		session.setAttribute("count_user", countUser);

		return message;
	}

	@Override
	public void updateLogin(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		params.put("username", request.getParameter("username"));
		params.put("activeTag", request.getParameter("activeTag"));
		
		this.loginDAO.updateLogin(params);

	}

	@Override
	public void updateAttempts(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Map<String, Object> params = new HashMap<>();
		params.put("username", session.getAttribute("user"));
		
		this.loginDAO.updateAttempts(params);
	}

	@Override
	public void updateResetAttempts(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Map<String, Object> params = new HashMap<>();
		params.put("username", session.getAttribute("user"));
		
		this.loginDAO.updateResetAttempts(params);
	}

	@Override
	public void updateResetAllAttempts() throws SQLException {
		// TODO Auto-generated method stub
		this.loginDAO.updateResetAllAttempts();
	}
}
