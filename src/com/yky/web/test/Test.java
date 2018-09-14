package com.yky.web.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.yky.web.entity.Employee;
import com.yky.web.util.DBConnection;

public class Test {
	public static void main(String[] args) {
		
//		for (int k = 1; k <=9; k++) {
//			for (int i =1; i <=k; i++) {
//				System.out.print(i+"*"+""+k+"="+i*k+'\t');
//			}
//				System.out.println();
//			
//		}
		
		//System.out.println(add("张三","zhangsan@126.com","123456"));
		//show();
	}
		public static int add(String uname,String uemail,String upwd) {
	        int i=0;
	        String sql="insert into employee (name,email,pwd) values (?,?,?)";
	        DBConnection db = new DBConnection();
	        try {        
	            PreparedStatement preStmt = (PreparedStatement) db.conn.prepareStatement(sql);
	            preStmt.setString(1, uname);
	            preStmt.setString(2, uemail);
	            preStmt.setString(3, upwd);
	            i= preStmt.executeUpdate();
	            //Statement statement = (Statement) db.conn.createStatement();
	            //statement.executeUpdate(sql);
	            
	            preStmt.close();
	            db.close();//关闭连接 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return i;//返回影响的行数，1为执行成功
	    }
	    //查找操作
	    public static List show(){
	         String sql ="select * from employee order by id desc";
	         DBConnection db = new DBConnection();
	         List list=new ArrayList();
	       
	         try {
	            Statement stmt = (Statement) db.conn.createStatement();
	            ResultSet rs = (ResultSet) stmt.executeQuery(sql);
	            while(rs.next()){
	                String uname = rs.getString("name");
	                String uemail = rs.getString("email");
	                String uhiredate = rs.getString("hiredate");
	                Employee employee=new Employee();
	                employee.setName(uname);
	                employee.setEmail(uemail);
	               // employee.setHiredate(uhiredate);
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
	    //更新操作
	    public static int update(String uname,String uemail,String upwd) {
	        int i =0;
	        String sql="update employee set email=?,pwd=? where name=?";
	        DBConnection db = new DBConnection();
	        
	        try {
	            PreparedStatement preStmt = (PreparedStatement) db.conn.prepareStatement(sql);
	            preStmt.setString(1, uemail);
	            preStmt.setString(2, upwd);
	            preStmt.setString(3, uname);
	            preStmt.executeUpdate();
	            
	            preStmt.close();
	            db.close();//关闭连接 
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return i;//返回影响的行数，1为执行成功
	    }
	    //删除操作
	    public static int del(String uname) {
	        int i=0;
	        String sql="delete from employee where name=?";
	        DBConnection db = new DBConnection();
	        try {    
	            PreparedStatement preStmt = (PreparedStatement) db.conn.prepareStatement(sql);
	            preStmt.setString(1, uname);
	            preStmt.executeUpdate();
	            
	            preStmt.close();
	            db.close();//关闭连接 
	        } catch (SQLException e){
	            e.printStackTrace();
	        }
	        return i;//返回影响的行数，1为执行成功
	    }
	
}
