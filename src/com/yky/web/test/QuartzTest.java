package com.yky.web.test;

import java.util.Date;

import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;


public class QuartzTest implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		System.out.println(new Date());
	}
	public void work(){
		System.out.println("newMethod"+new Date());
	}
	 public static void main(String[] args) {
	        try {
	            // 创建一个Scheduler
	            SchedulerFactory schedFact =  new org.quartz.impl.StdSchedulerFactory();
	            Scheduler sched = schedFact.getScheduler();
	            sched.start();
	           
	            JobDetail jobDetail = new JobDetail("myJob", "myJobGroup",QuartzTest.class);
	          
	            
	            CronTrigger cronTrigger = new CronTrigger("myTrigger", "myGroup"); 
	            
	            cronTrigger.setCronExpression("* * * * * ? *"); 

	            sched.scheduleJob(jobDetail, cronTrigger);
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
