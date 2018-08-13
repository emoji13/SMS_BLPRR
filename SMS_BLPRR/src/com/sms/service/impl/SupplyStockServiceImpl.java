package com.sms.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sms.dao.SupplyStockDAO;
import com.sms.entity.Supply;
import com.sms.entity.SupplyStock;
import com.sms.service.SupplyStockService;

public class SupplyStockServiceImpl implements SupplyStockService {
	
	private SupplyStockDAO supplyStockDAO;

	public SupplyStockDAO getSupplyStockDAO() {
		return supplyStockDAO;
	}

	public void setSupplyStockDAO(SupplyStockDAO supplyStockDAO) {
		this.supplyStockDAO = supplyStockDAO;
	}
	
	@Override
	public void getSupplyStock(HttpServletRequest request) throws SQLException {
		List<SupplyStock> stockIDGetter = supplyStockDAO.getSupplyStock();
		long stockID = 0;
		for (SupplyStock supplystock : stockIDGetter) {
			stockID = supplystock.getStockID();
		}
		request.setAttribute("lastSupplyStockID", stockID);
		request.setAttribute("supplyStockList",supplyStockDAO.getSupplyStock());
		
	}
	
	@Override
	public void getSupplyNames(HttpServletRequest request) throws SQLException {
		request.setAttribute("supplyNamesList",supplyStockDAO.getSupplyNames());
		request.setAttribute("supplyAllNamesList",supplyStockDAO.getAllSupplyNames());
	}
	
	@Override
	public void searchSupplyStock(HttpServletRequest request) throws SQLException {
		Map<String, Object> search = new HashMap<>();
		search.put("search", request.getParameter("search").trim());
		request.removeAttribute("supplyStockList");
		long stockID = 0;
		List<SupplyStock> stockIDGetter = supplyStockDAO.getSupplyStock();
		
		for (SupplyStock supplystock : stockIDGetter) {
			stockID = supplystock.getStockID();
		}
		
		request.setAttribute("lastSupplyStockID", stockID);
		request.setAttribute("supplyNamesList",supplyStockDAO.getSupplyNames());
		request.setAttribute("supplyStockList",supplyStockDAO.searchSupplyStock(search));
	}
	
	@Override
	public void insertSupplyStock(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
				
		params.put("supplyID", Integer.parseInt(request.getParameter("supplyID")));
		params.put("dateAdded", request.getParameter("dateAdded"));
		params.put("purchaseDate", request.getParameter("purchaseDate"));
		params.put("referenceNumber", request.getParameter("referenceNumber"));
		params.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		params.put("lastUpdateBy", (String) request.getSession().getAttribute("user"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		
		
		
		this.supplyStockDAO.insertSupplyStock(params);
	}
	
	@Override
	public void updateAddedStock(HttpServletRequest request) throws SQLException {
		Map<String, Object> params2 = new HashMap<>();
		
		params2.put("supplyID", Integer.parseInt(request.getParameter("supplyID")));
		params2.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		
		this.supplyStockDAO.updateAddedStock(params2);
	}
	
	@Override
	public void updateSupplyQuantity(HttpServletRequest request) throws SQLException {
		Map<String, Object> params2 = new HashMap<>();
		
		params2.put("supplyID", Integer.parseInt(request.getParameter("supplyID")));
		params2.put("newQuantity", Integer.parseInt(request.getParameter("updateQuantity")));
		
		this.supplyStockDAO.updateSupplyQuantity(params2);
	}
	
	@Override
	public void updateSupplyStock(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		params.put("stockID", Integer.parseInt(request.getParameter("stockID")));
		params.put("supplyID", Integer.parseInt(request.getParameter("supplyID")));
		params.put("purchaseDate", request.getParameter("purchaseDate"));
		params.put("referenceNumber", request.getParameter("referenceNumber"));
		params.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		params.put("lastUpdateBy", (String) request.getSession().getAttribute("user"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.supplyStockDAO.updateSupplyStock(params);;
	}
}
