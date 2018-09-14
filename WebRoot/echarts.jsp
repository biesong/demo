<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'echarts.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.css">
	<script src="js/jquery.js"></script>
<script src="js/jquery.mobile-1.4.5.js"></script>
<script type="text/javascript" src="js/echarts.min.js"> </script>
  </head>
  
  <body>
  <div data-role="page" >

	<div data-role="header">
		<h1>Single page</h1>
	</div><!-- /header -->

	<div role="main" class="ui-content" >
  
   <div id="main" style="width: 600px;height:400px;"></div>
  	</div><!-- /content -->

	

</div><!-- /page -->
 
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'light');

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            toolbox:{
              feature:{saveAsImage:{}}
            },
            tooltip: {},
            legend: {
                data:['充值','消费']
            },
            xAxis: {
                axisLabel:{ interval:0,rotate:40},
                data: []
            },
            yAxis: {},
            series: [{
                name: '充值',
                type: 'line',
                data: []
            },
            {
                name: '消费',
                type: 'line',
                data: []
            }
            ]
        };
        // 异步加载数据
$.get('LogAction').done(function (data) {
    // 填入数据
    data= eval('(' + data + ')'); 
    
    myChart.setOption({
        xAxis: {
            data: data.categories
        },
        series: [{
            // 根据名字对应到相应的系列
            name: '充值',
            data: data.recharge
        },
        
        {
        name:"消费",
        data:data.pay
        }]
    });
});
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
      
    </script>
  </body>
</html>
