package com.yky.web.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import com.opensymphony.xwork2.ActionSupport;
import com.yky.web.test.Test;

public class RegiserAction extends ActionSupport {
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	private String pwd;
	private String mail;
	public String execute()throws IOException{
		name = URLEncoder.encode(name, "ISO-8859-1");
		Test.add(URLDecoder.decode(name, "UTF-8"), mail, pwd);
		return SUCCESS;
	}
}
