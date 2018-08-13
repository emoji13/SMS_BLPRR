package com.sms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sms.service.DepartmentService;
import com.sms.service.IssuedSupplyService;
import com.sms.service.SupplyService;

public class IssuedSupplyController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5435609378102992390L;
	private static final Logger LOGGER = LogManager.getLogger(IssuedSupplyController.class.getName());

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "";
		
		try {
			String loginStatus = (String) request.getSession().getAttribute("loginStatus") == null? "": (String) request.getSession().getAttribute("loginStatus");
			if(!"".equals(loginStatus)){
				@SuppressWarnings("resource")
				ApplicationContext appContext = 
							new ClassPathXmlApplicationContext("/com/sms/resource/applicationContext.xml");
				
				IssuedSupplyService issSuppService = (IssuedSupplyService) appContext.getBean("issuedSupplyService");
				DepartmentService departmentService = (DepartmentService) appContext.getBean("departmentService");
				SupplyService supplyService = (SupplyService) appContext.getBean("supplyService");
				String action = request.getParameter("actionGet");
				issSuppService.getIssuedSupplies(request);
				departmentService.getDepartments(request);
				supplyService.getSupplies(request);
				if ("issueList".equals(action)){
					page = "pages/issueList.jsp";
				} else{
					page = "pages/issueSupplies.jsp";
				}
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("resource")
		ApplicationContext appContext = 
					new ClassPathXmlApplicationContext("/com/sms/resource/applicationContext.xml");
		IssuedSupplyService issSuppService = (IssuedSupplyService) appContext.getBean("issuedSupplyService");
		String action= request.getParameter("actionPost")== null ? "": request.getParameter("actionPost");
		try {
			if("insert".equals(action)){
				issSuppService.insertIssuedSupply(request, response);
			} else if ("update".equals(action)){
				issSuppService.updateIssuedSupply(request, response);
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		} 
	}
}
