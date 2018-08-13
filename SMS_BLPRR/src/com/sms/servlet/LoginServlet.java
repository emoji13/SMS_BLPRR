package com.sms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sms.dao.LoginDAO;
import com.sms.entity.Login;
import com.sms.service.LoginService;
import com.sun.java.swing.plaf.windows.resources.windows;

public class LoginServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6077917519533177725L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page = "";
		HttpSession session = request.getSession();
		String loginStatus = session.getAttribute("loginStatus") == null? "": (String) session.getAttribute("loginStatus");
		String action = request.getParameter("action") == null? "": request.getParameter("action") ;
		try {
			if(!"".equals(loginStatus) && "".equals(action)){
				page="home.jsp";
				response.setHeader("status", "success");
			} else{
				ApplicationContext applicationContext = 
						new ClassPathXmlApplicationContext("/com/sms/resource/applicationContext.xml");
			
				LoginService loginService = (LoginService) applicationContext.getBean("loginService");
			
				loginService.updateResetAllAttempts();
				if(!"".equals(loginStatus)){
					session.invalidate();
				}
				loginService.getLogin(request);
				page = "index.jsp";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally{
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String page = "";
		try {
			
			ApplicationContext applicationContext = 
					new ClassPathXmlApplicationContext("/com/sms/resource/applicationContext.xml");
		
			LoginService loginService = (LoginService) applicationContext.getBean("loginService");
			String message = loginService.getLogin(request);

			if(session.getAttribute("count_user").equals(1)){
				if(session.getAttribute("tag").equals("N") || session.getAttribute("tag").equals("n")){
					request.setAttribute("loginText", "Unfortunately, you are not allowed to access the system."
							+ " Please contact the Administrator");
					page = "pages/login.jsp";
					session.invalidate();
				}else{
					if(message.equals("SUCCESS")){
						page = "home.jsp";
						loginService.updateResetAttempts(request);
						response.setHeader("status", "success");
					}else{
						page = "pages/login.jsp";
						request.setAttribute("loginText", session.getAttribute("message_locked_invalid"));
						String action = request.getParameter("action") == null ? "" : request.getParameter("action");
						
						if(session.getAttribute("message2").equals("LOCKED")){
							if("updateRecord".equals(action)){
								loginService.updateLogin(request);
								loginService.updateResetAttempts(request);
								session.invalidate();
							}
						}else{
							loginService.updateAttempts(request);
						}
					}
				}
				
			}else{
			   page = "pages/login.jsp";
			   request.setAttribute("loginText", "No user found. Please register first.");
			   
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		finally{
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.include(request, response);
		}
	}
}
