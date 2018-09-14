package com.yky.web.service;

import com.yky.web.entity.Echarts;

public interface EmployeeService {

	public abstract Echarts getData();
    public Echarts getByDate();
}