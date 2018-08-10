package com.sms.service.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.sms.dao.IssuedSuppliesDAO;
import com.sms.dao.SupplyDAO;
import com.sms.entity.IssuedSupply;
import com.sms.entity.Supply;
import com.sms.service.IssuedSupplyService;

public class IssuedSupplyServiceImpl implements IssuedSupplyService {

	private static final Logger LOGGER = LogManager.getLogger(IssuedSupplyServiceImpl.class.getName());

	private IssuedSuppliesDAO issuedSuppliesDAO;

	public void setIssuedSuppliesDAO(IssuedSuppliesDAO issuedSuppliesDAO) {
		this.issuedSuppliesDAO = issuedSuppliesDAO;
	}

	public IssuedSuppliesDAO getIssuedSuppliesDAO() {
		return issuedSuppliesDAO;
	}

	private SupplyDAO supplyDAO;

	public void setSupplyDAO(SupplyDAO supplyDAO) {
		this.supplyDAO = supplyDAO;
	}

	public SupplyDAO getSupplyDAO() {
		return supplyDAO;
	}

	@Override
	public void getIssuedSupplies(HttpServletRequest request) {
		String param = request.getParameter("param") == null ? "" : request.getParameter("param");
		request.setAttribute("issuedSupplies", issuedSuppliesDAO.getIssuedSupplies(param));
	}

	@Override
	public void insertIssuedSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		try{

			Map<String, Object> params = new HashMap<>();

			params.put("supplyId", Long.parseLong(request.getParameter("supplyId")));
			try {
				params.put("issueDate",
						new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("issueDate")));
			} catch (ParseException e) {
				LOGGER.error(e.getMessage());
			}
			params.put("requestor", request.getParameter("requestor"));
			params.put("quantity", Integer.parseInt(request.getParameter("quantity")));
			params.put("deptId", Integer.parseInt(request.getParameter("deptId")));
			params.put("lastUser", (String) request.getSession().getAttribute("user"));
			params.put("lastUpdate", new Date());

			boolean isValid = checkCount(params, response, "insert");
			if (isValid) {
				this.getIssuedSuppliesDAO().insertIssuedSupply(params);
				checkReorderLevel((Long) params.get("supplyId"), response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void updateIssuedSupply(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		Map<String, Object> params = new HashMap<>();

		params.put("issueId", Long.parseLong(request.getParameter("issueId")));
		params.put("supplyId", Long.parseLong(request.getParameter("supplyId")));
		try {
			params.put("issueDate",
					new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("issueDate")));
		} catch (ParseException e) {
			LOGGER.error(e.getMessage());
		}
		params.put("requestor", request.getParameter("requestor"));
		params.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		params.put("deptId", Integer.parseInt(request.getParameter("deptId")));
		params.put("lastUser", (String) request.getSession().getAttribute("user"));
		params.put("lastUpdate", new java.util.Date());
		boolean isValid = checkCount(params, response, "update");
		if (isValid) {
			this.issuedSuppliesDAO.updateIssuedSupply(params);
			checkReorderLevel((Long) params.get("supplyId"), response);
		}

	}

	private Boolean checkCount(Map<String, Object> params, HttpServletResponse response, String source) throws SQLException {
		Boolean isValid = true;
		Integer orig = 0;
		
		if("update".equals(source)){
			List<IssuedSupply> issuedSupplies = this.getIssuedSuppliesDAO().getIssuedSupplies(String.valueOf(params.get("issueId")));
			for (IssuedSupply issuedSupply : issuedSupplies) {
				if(issuedSupply.getIssueId().equals((Long)params.get("issueId"))){
					orig = issuedSupply.getQuantity();
					break;
				}
			}
		}
		
		List<Supply> supplies = this.getSupplyDAO().searchSupply(String.valueOf(params.get("supplyId")));
		for (Supply supply : supplies) {
			if (supply.getSupplyID().equals((Long)params.get("supplyId"))) {
				Integer value = Integer.sum(supply.getActualCount(), orig);
				if (value.compareTo( (Integer) params.get("quantity")) < 0) {
					isValid = false;
					response.setHeader("issueError", supply.getItemName() + " only has " + supply.getActualCount()
							+ ", which is below the requested number.");
				} else{
					Map<String, Object> supplyParams = new HashMap<>();
					supplyParams.put("supplyId", params.get("supplyId"));
					supplyParams.put("quantity", ((Integer)params.get("quantity")) - orig);
					this.getIssuedSuppliesDAO().updateSupplyActualCount(supplyParams);
				}
				break;
			}
		}
		return isValid;
	}

	private void checkReorderLevel(Long supplyId, HttpServletResponse response) throws SQLException {

		List<Supply> supplies = this.getSupplyDAO().searchSupply(String.valueOf(supplyId));
		for (Supply supply : supplies) {
			if (supply.getSupplyID().equals(supplyId)) {
				if (supply.getActualCount().compareTo(supply.getReorderLevel()) == 0) {
					response.setHeader("issueWarning",
							"The actual count of the item " + supply.getItemName() + " is equal to the reorder level.");
					break;
				} else if (supply.getActualCount().compareTo(supply.getReorderLevel()) < 0){
					response.setHeader("issueWarning",
							"The actual count of the item " + supply.getItemName() + " is less than the reorder level.");
				}
			}
		}
	}

}
