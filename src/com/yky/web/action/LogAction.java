
package com.yky.web.action;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.yky.web.service.LogService;
import com.yky.web.service.impl.LogServiceImpl;

public class LogAction extends ActionSupport {
	private String message;
	private String image;
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String execute() throws Exception {
		LogService service=new LogServiceImpl();
		message=JSONObject.fromObject(service.getData()).toString();
		return SUCCESS;
	}
	public String saveImage(){
		System.out.println(image);
		return null;
	}
	public String getMessage() {
		return message;
	}

}
