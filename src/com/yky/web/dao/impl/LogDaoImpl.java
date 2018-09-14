package com.yky.web.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.yky.web.dao.LogDao;
import com.yky.web.entity.Log;
import com.yky.web.util.DBConnection;

public class LogDaoImpl implements LogDao {
	/* (non-Javadoc)
	 * @see com.yky.web.dao.impl.LogDao#getLogByType(int)
	 */
	public List<Log> getLogByType(int type){
		 String sql ="select DATE_FORMAT(operate,'%Y-%m-%d') as operate,SUM(amount) as  amount from log where type=? GROUP BY DATE_FORMAT(operate,'%Y-%m-%d')";
         DBConnection db = new DBConnection();
         List<Log> list=new ArrayList();
       
         try {
            PreparedStatement stmt = (PreparedStatement) db.conn.prepareStatement(sql);
           stmt.setInt(1, type);
            ResultSet rs = (ResultSet) stmt.executeQuery();
            while(rs.next()){
                double amount = rs.getInt("amount");
                String operate = rs.getString("operate");
                Log log=new Log();
                log.setOperate(operate);
                log.setAmount(amount);
               // employee.setHiredate(uhiredate);
                //可以将查找到的值写入类，然后返回相应的对象 
                //这里 先用输出的端口显示一下
                list.add(log);
            }
            rs.close();
            db.close();//关闭连接 
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return list;
	}
}
