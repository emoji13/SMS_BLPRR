package com.sms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sms.service.SupplyService;

public class SupplyServlet extends HttpServlet{
	
	private static final long serialVersionUID = -1543774412315214249L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page = "";
		try{
			String loginStatus = (String) request.getSession().getAttribute("loginStatus") == null? "": (String) request.getSession().getAttribute("loginStatus");
			if(!"".equals(loginStatus)){
			@SuppressWarnings("resource")
			ApplicationContext applicationContext = 
					new ClassPathXmlApplicationContext("/com/sms/resource/applicationContext.xml");
			
			SupplyService employeeService = 
					(SupplyService) applicationContext.getBean("supplyService");
			
			employeeService.getSupplies(request);
			employeeService.getSupplyTypes(request);
			if ("pages/SupplyMaintenance.jsp".equals(request.getParameter("page"))) {
				page = "pages/SupplyMaintenance.jsp";
				request.setAttribute("itemName",request.getParameter("itemName"));
				request.setAttribute("itemUnit",request.getParameter("itemUnit"));
				request.setAttribute("location",request.getParameter("location"));
				request.setAttribute("reorderLevel",request.getParameter("reorderLevel"));
				request.setAttribute("actualCount",request.getParameter("actualCount"));
				request.setAttribute("remarks",request.getParameter("remarks"));
				request.setAttribute("obsolete",request.getParameter("obsolete"));
				request.setAttribute("supplyTypeName",request.getParameter("supplyTypeName"));
				request.setAttribute("supplyTypeID",request.getParameter("supplyTypeID"));
				request.setAttribute("supplyID",request.getParameter("supplyID"));
				request.setAttribute("buttonVal",request.getParameter("buttonVal"));
			}
			else {
				page = "pages/SuppliesListing.jsp";
			}
		}
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ApplicationContext applicationContext = 
				new ClassPathXmlApplicationContext("/com/sms/resource/applicationContext.xml");
		
		SupplyService supplyService = 
				(SupplyService) applicationContext.getBean("supplyService");
		String page = "";
		String action = request.getParameter("action") == null ? "" : request.getParameter("action");
		try{
			if("insertRecord".equals(action)){
				supplyService.insertSupply(request);
				page = "pages/SuppliesListing.jsp";
			}else if("updateRecord".equals(action)){
				supplyService.updateSupply(request);
				page = "pages/SuppliesListing.jsp";
			}else if("searchRecord".equals(action)){
				supplyService.searchSupply(request);
				page = "pages/SupplyTable.jsp";
			}
			else{
				page = "pages/SuppliesListing.jsp";
			}
		} catch(SQLException e){
			System.out.println(e.getMessage());
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
