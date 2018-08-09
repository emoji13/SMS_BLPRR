package com.sms.dao;

import java.util.List;

import com.sms.entity.Department;

public interface DepartmentsDAO {
	List<Department> getDepartments(String param);
}
