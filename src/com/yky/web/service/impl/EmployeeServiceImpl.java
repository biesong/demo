package com.yky.web.service.impl;

import java.util.List;

import com.yky.web.dao.EmployeeDao;
import com.yky.web.dao.LogDao;
import com.yky.web.dao.impl.EmployeeDaoImpl;
import com.yky.web.dao.impl.LogDaoImpl;
import com.yky.web.entity.Echarts;
import com.yky.web.entity.Employee;
import com.yky.web.service.EmployeeService;
import com.yky.web.util.EchartsUtil;

public class EmployeeServiceImpl implements EmployeeService {
	/* (non-Javadoc)
	 * @see com.yky.web.service.impl.EmployeeService#getData()
	 */
	public Echarts getData(){
		Echarts echarts=new Echarts();
		EmployeeDao dao=new EmployeeDaoImpl();
		List<Employee> list=dao.getEmployeeByDate();
		 String[] categories = new String[list.size()];
		 double[] recharge =new double[list.size()] ;
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(1).getOperate());
				categories[i]=list.get(i).getHiredate().toString();
			
			recharge[i]=Double.parseDouble(list.get(i).getName());
			//categories[i]=list.get(1).getOperate();
			
		}
		
		echarts.setCategories(categories);
		echarts.setRecharge(recharge);
		return echarts;
		
	}

	@Override
	public Echarts getByDate() {
		EmployeeDao dao=new EmployeeDaoImpl();
		return EchartsUtil.getData(dao.getData());
	}
	
}
