package com.yky.web.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
import com.yky.web.dao.EmployeeDao;
import com.yky.web.entity.Data;
import com.yky.web.entity.Employee;
import com.yky.web.test.Test;
import com.yky.web.util.DBConnection;

public class EmployeeDaoImpl implements EmployeeDao{

	public List getEmployeeList() {
		List list =new ArrayList();
		
		return Test.show();
	}
     public List getEmployeeByDate(){
    	 String sql ="select DATE_FORMAT(hiredate,'%Y-%m-%d') as hiredate,count(name) as  name from employee  GROUP BY DATE_FORMAT(hiredate,'%Y-%m-%d')";
         DBConnection db = new DBConnection();
         List list=new ArrayList();
       
         try {
            Statement stmt = (Statement) db.conn.createStatement();
            ResultSet rs = (ResultSet) stmt.executeQuery(sql);
            while(rs.next()){
                String uname = rs.getString("name");
                String uhiredate = rs.getString("hiredate");
                Employee employee=new Employee();
                employee.setName(uname);
                employee.setHiredate(uhiredate);
                //可以将查找到的值写入类，然后返回相应的对象 
                //这里 先用输出的端口显示一下
                list.add(employee);
            }
            rs.close();
            db.close();//关闭连接 
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return list;
     }
	
	public List<Data> getData() {
		 String sql ="SELECT count(distinct id) id , DATE_FORMAT(hiredate,'%H') hours FROM employee where DATE_FORMAT(hiredate,'%Y%m%d') = '20180911' group BY hours";
         DBConnection db = new DBConnection();
         List list=new ArrayList();
       
         try {
            Statement stmt = (Statement) db.conn.createStatement();
            ResultSet rs = (ResultSet) stmt.executeQuery(sql);
            while(rs.next()){
                String y = rs.getString("id");
                String x = rs.getString("hours");
                Data data=new Data();
                data.setX(x);
                data.setY(y);
                //可以将查找到的值写入类，然后返回相应的对象 
                //这里 先用输出的端口显示一下
                list.add(data);
            }
            rs.close();
            db.close();//关闭连接 
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return list;
	}
}
