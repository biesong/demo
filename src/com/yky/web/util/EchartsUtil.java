package com.yky.web.util;


import java.util.List;

import com.yky.web.entity.Data;
import com.yky.web.entity.Echarts;

public class EchartsUtil {
	public static Echarts getData(List<Data> list){
		Echarts echarts=new Echarts();
		
		 String[] categories = new String[list.size()];
		 double[] recharge =new double[list.size()] ;
		for (int i = 0; i < list.size(); i++) {
			//System.out.println(list.get(1).getOperate());
				categories[i]=list.get(i).getX().toString();
			
			recharge[i]=Double.parseDouble(list.get(i).getY());
			//categories[i]=list.get(1).getOperate();
			
		}
		
		echarts.setCategories(categories);
		echarts.setRecharge(recharge);
		return echarts;
	}
}
