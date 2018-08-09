package com.sms.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sms.dao.SupplyDAO;
import com.sms.service.SupplyService;

public class SupplyServiceImpl implements SupplyService{
	
	private SupplyDAO supplyDAO;

	public SupplyDAO getSupplyDAO() {
		return supplyDAO;
	}

	public void setSupplyDAO(SupplyDAO supplyDAO) {
		this.supplyDAO = supplyDAO;
	}

	@Override
	public void getSupplies(HttpServletRequest request) throws SQLException {
		request.setAttribute("supList",supplyDAO.getSupplies());
	}
	
	@Override
	public void getSupplyTypes(HttpServletRequest request) throws SQLException {
		request.setAttribute("supTypesList",supplyDAO.getSupplyTypes());
		
	}
	
	@Override
	public void searchSupply(HttpServletRequest request) throws SQLException {
		String searchKey="";
		try{
		if (request.getParameter("searchKey") == null || request.getParameter("searchKey") == "") {
			searchKey = "";
		}
		else {
			searchKey = request.getParameter("searchKey");
		}
		request.setAttribute("supSearchList",supplyDAO.searchSupply(searchKey));
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void insertSupply(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		params.put("supplyID", request.getParameter("supplyID"));
		params.put("supplyTypeID", request.getParameter("supplyTypeID"));
		params.put("itemName", request.getParameter("itemName"));
		params.put("itemUnit", request.getParameter("itemUnit"));
		params.put("obsoleteTag", request.getParameter("obsoleteTag"));
		params.put("location", request.getParameter("location"));
		params.put("reorderLevel", Integer.parseInt(request.getParameter("reorderLevel")));
		params.put("actualCount", Integer.parseInt(request.getParameter("actualCount")));
		params.put("remarks", request.getParameter("remarks"));
		params.put("dateAdded", request.getParameter("dateAdded"));
		params.put("lastUser", request.getParameter("lastUser"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.supplyDAO.insertSupply(params);
		
	}

	@Override
	public void updateSupply(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("supplyID", request.getParameter("supplyID"));
		params.put("itemName", request.getParameter("itemName"));
		params.put("itemUnit", request.getParameter("itemUnit"));
		params.put("obsoleteTag", request.getParameter("obsoleteTag"));
		params.put("location", request.getParameter("location"));
		params.put("reorderLevel", (request.getParameter("reorderLevel")));
		params.put("remarks", request.getParameter("remarks"));
		
		this.supplyDAO.updateSupply(params);
		
	}

	

	

}
