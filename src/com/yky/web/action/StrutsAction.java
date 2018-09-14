package com.yky.web.action;

import com.opensymphony.xwork2.ActionSupport;

public class StrutsAction extends ActionSupport{
	public String execute(){
		return SUCCESS;
		
	}
	public String add(){
		System.out.println("执行add");
		return SUCCESS; 
	}
}
