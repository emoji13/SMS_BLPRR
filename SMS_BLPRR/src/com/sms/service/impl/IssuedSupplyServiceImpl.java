package com.sms.service.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.sms.dao.IssuedSuppliesDAO;
import com.sms.service.IssuedSupplyService;

public class IssuedSupplyServiceImpl implements IssuedSupplyService{
	
	private static final Logger LOGGER = LogManager.getLogger(IssuedSupplyServiceImpl.class.getName());
	
	private IssuedSuppliesDAO issuedSuppliesDAO;
	
	public void setIssuedSuppliesDAO(IssuedSuppliesDAO issuedSuppliesDAO) {
		this.issuedSuppliesDAO = issuedSuppliesDAO;
	}
	
	public IssuedSuppliesDAO getIssuedSuppliesDAO() {
		return issuedSuppliesDAO;
	}
	
	@Override
	public void getIssuedSupplies(HttpServletRequest request) {
		String param = request.getParameter("param") == null? "": request.getParameter("param");
		request.setAttribute("issuedSupplies", issuedSuppliesDAO.getIssuedSupplies(param));
	}

	@Override
	public void insertIssuedSupply(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		params.put("supplyId", Integer.parseInt(request.getParameter("supplyId")));
		String[] issueDate = request.getParameterValues("issueDate");
		try {
			params.put("issueDate", new SimpleDateFormat("MM/dd/yyyy").parse(issueDate[0]+"/"+issueDate[1]+"/"+issueDate[2]));
		} catch (ParseException e) {
			LOGGER.error(e.getMessage());
		}
		params.put("requestor", request.getParameter("requestor"));
		params.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		params.put("deptId", Integer.parseInt(request.getParameter("deptId")));
		params.put("lastUser", request.getParameter("lastUser"));
		params.put("lastUpdate", new java.util.Date());
		
		this.issuedSuppliesDAO.insertIssuedSupply(params);
	}

	@Override
	public void updateIssuedSupply(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		params.put("issueId", Integer.parseInt(request.getParameter("issueId")));
		params.put("supplyId", Integer.parseInt(request.getParameter("supplyId")));
		String[] issueDate = request.getParameterValues("issueDate");
		try {
			params.put("issueDate", new SimpleDateFormat("MM/dd/yyyy").parse(issueDate[0]+"/"+issueDate[1]+"/"+issueDate[2]));
		} catch (ParseException e) {
			LOGGER.error(e.getMessage());
		}
		params.put("requestor", request.getParameter("requestor"));
		params.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		params.put("deptId", Integer.parseInt(request.getParameter("deptId")));
		params.put("lastUser", request.getParameter("lastUser"));
		params.put("lastUpdate", new java.util.Date());
		
		this.issuedSuppliesDAO.updateIssuedSupply(params);
		
	}
	
}
