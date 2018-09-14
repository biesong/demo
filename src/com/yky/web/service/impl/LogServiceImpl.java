package com.yky.web.service.impl;

import java.util.List;

import com.yky.web.dao.LogDao;
import com.yky.web.dao.impl.LogDaoImpl;
import com.yky.web.entity.Echarts;
import com.yky.web.entity.Log;
import com.yky.web.service.LogService;

public class LogServiceImpl implements LogService {
	/* (non-Javadoc)
	 * @see com.yky.web.action.service.LogService#getData()
	 */
	public Echarts getData(){
		Echarts echarts=new Echarts();
		LogDao dao=new LogDaoImpl();
		List<Log> list=dao.getLogByType(1);
		List<Log> payList=dao.getLogByType(2);
		 String[] categories = new String[list.size()];
		 double[] recharge =new double[list.size()] ;
		 double[] pay =new double[payList.size()];
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(1).getOperate());
				categories[i]=list.get(i).getOperate();
			
			recharge[i]=list.get(i).getAmount();
			//categories[i]=list.get(1).getOperate();
			
		}
		for (int i = 0; i < payList.size(); i++) {
			
			pay[i]=payList.get(i).getAmount();
			
		}
		echarts.setCategories(categories);
		echarts.setRecharge(recharge);
		echarts.setPay(pay);
		return echarts;
	}
}
