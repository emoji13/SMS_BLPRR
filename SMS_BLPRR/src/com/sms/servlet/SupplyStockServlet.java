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
import com.sms.service.SupplyStockService;



public class SupplyStockServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page = "";
		try{
			String loginStatus = (String) request.getSession().getAttribute("loginStatus") == null? "": (String) request.getSession().getAttribute("loginStatus");
			
			if(!"".equals(loginStatus)){
			ApplicationContext applicationContext = 
					new ClassPathXmlApplicationContext("/com/sms/resource/applicationContextSupplyStock.xml");
			
			SupplyStockService supplyStockService = 
					(SupplyStockService) applicationContext.getBean("supplyStockService");
			
			supplyStockService.getSupplyStock(request);
			supplyStockService.getSupplyNames(request);
			page = "pages/ReorderSupplies.jsp"; }
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ApplicationContext applicationContext = 
				new ClassPathXmlApplicationContext("/com/sms/resource/applicationContextSupplyStock.xml");
		
		SupplyStockService supplyStockService = 
				(SupplyStockService) applicationContext.getBean("supplyStockService");
		
		String page = "";
		String action = request.getParameter("action") == null ? "" : request.getParameter("action");
		try{
			if("insertSupplyStock".equals(action)){
				supplyStockService.insertSupplyStock(request);
				supplyStockService.updateAddedStock(request);
			}else if("searchSupplyStock".equals(action)){
				if(request.getParameter("search") == null){
					supplyStockService.getSupplyStock(request);
				}else{
					supplyStockService.searchSupplyStock(request);
				}
				
				page = "pages/ReorderSupplies.jsp";
			}else if("updateSupplyStock".equals(action)){
				supplyStockService.updateSupplyStock(request);
				supplyStockService.updateSupplyQuantity(request);
			}
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
}


