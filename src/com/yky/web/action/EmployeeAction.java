package com.yky.web.action;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.yky.web.dao.EmployeeDao;
import com.yky.web.dao.impl.EmployeeDaoImpl;
import com.yky.web.service.EmployeeService;
import com.yky.web.service.impl.EmployeeServiceImpl;

public class EmployeeAction extends ActionSupport {
	private String message;
	
	public String execute() throws Exception {
		EmployeeDao dao=new EmployeeDaoImpl();
 		message=JSONArray.fromObject(dao.getEmployeeList()).toString();
		return SUCCESS;
	}
    public String getData(){
    	EmployeeService service=new EmployeeServiceImpl();
    	message=JSONObject.fromObject(service.getData()).toString();
    	return SUCCESS;
    }
    
    public String getHour(){
    	EmployeeService service=new EmployeeServiceImpl();
    	message=JSONObject.fromObject(service.getByDate()).toString();
    	return SUCCESS;
    }
    
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
