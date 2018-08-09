package com.sms.service.impl;


import javax.servlet.http.HttpServletRequest;

import com.sms.dao.DepartmentsDAO;
import com.sms.service.DepartmentService;

public class DepartmentServiceImpl implements DepartmentService{
	private DepartmentsDAO departmentsDAO;
	
	public DepartmentsDAO getDepartmentsDAO() {
		return departmentsDAO;
	}
	
	public void setDepartmentsDAO(DepartmentsDAO departmentsDAO) {
		this.departmentsDAO = departmentsDAO;
	}
	
	@Override
	public void getDepartments(HttpServletRequest request) {
		String deptId = request.getParameter("deptId")==null? "":request.getParameter("deptId");
		request.setAttribute("departments", departmentsDAO.getDepartments(deptId));
	}
}
