package com.yky.web.dao;

import java.util.List;

import com.yky.web.entity.Data;

public interface EmployeeDao {
      List getEmployeeList();
      public List getEmployeeByDate();
      public List<Data> getData();
}
