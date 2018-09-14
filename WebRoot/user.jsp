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
<script type="text/javascript" src="js/china.js"> </script>
  </head>
  
  <body>
  <div data-role="page" >

	<div data-role="header">
		<h1>Single page</h1>
	</div><!-- /header -->

	<div role="main" class="ui-content" >
  
   
  	</div><!-- /content -->

	<div class="ui-grid-a">
      <div class="ui-block-a">
       <div id="main" style="width: 600px;height:400px;"></div>
      </div>

      <div class="ui-block-b">
         <div id="map" style="width: 600px;height:400px;"></div>
      </div>

</div><!-- /page -->
 
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'dark');

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            toolbox:{
             x: 'right',
        y: 'center',
        orient : 'vertical',
              feature:{
              dataView : {show: true, readOnly: false},
              magicType: {show: true, type: ['line', 'bar']},
              saveAsImage:{}
              }
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
                name: '注册',
                type: 'line',
                data: []
            }
            ]
        };
        // 异步加载数据
$.get('EmployeeAction!getData.action').done(function (data) {
    // 填入数据
    data= eval('(' + data + ')'); 
    
    myChart.setOption({
        xAxis: {
            data: data.categories
        },
        series: [{
            // 根据名字对应到相应的系列
            name: '注册',
            data: data.recharge
        }]
    });
});
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
      var mapChart = echarts.init(document.getElementById('map'),'dark');


mapOption = {
    title : {
        text: '订单量',
        subtext: '纯属虚构',
        x:'center'
    },
    tooltip : {
        trigger: 'item'
    },
    legend: {
        orient: 'vertical',
        x:'left',
        data:['订单量']
    },
    dataRange: {
        x: 'left',
        y: 'bottom',
        splitList: [
            {start: 1500},
            {start: 900, end: 1500},
            {start: 310, end: 1000},
            {start: 200, end: 300},
            {start: 10, end: 200, label: '10 到 200（自定义label）'},
            {start: 5, end: 5, label: '5（自定义特殊颜色）', color: 'black'},
            {end: 10}
        ],
        color: ['#E0022B', '#E09107', '#A3E00B']
    },
    toolbox: {
        show: true,
        orient : 'vertical',
        x: 'right',
        y: 'center',
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    roamController: {
        show: true,
        x: 'right',
        mapTypeControl: {
            'china': true
        }
    },
    series : [
        {
            name: '订单量',
            type: 'map',
            mapType: 'china',
            roam: false,
            itemStyle:{
                normal:{
                    label:{
                        show:true,
                        textStyle: {
                           color: "rgb(249, 249, 249)"
                        }
                    }
                },
                emphasis:{label:{show:true}}
            },
            data:[
                {name: '北京',value: Math.round(Math.random()*2000)},
                {name: '天津',value: Math.round(Math.random()*2000)},
                {name: '上海',value: Math.round(Math.random()*2000)},
                {name: '重庆',value: Math.round(Math.random()*2000)},
                {name: '河北',value: 0},
                {name: '河南',value: Math.round(Math.random()*2000)},
                {name: '云南',value: 5},
                {name: '辽宁',value: 305},
                {name: '黑龙江',value: Math.round(Math.random()*2000)},
                {name: '湖南',value: 200},
                {name: '安徽',value: Math.round(Math.random()*2000)},
                {name: '山东',value: Math.round(Math.random()*2000)},
                {name: '新疆',value: Math.round(Math.random()*2000)},
                {name: '江苏',value: Math.round(Math.random()*2000)},
                {name: '浙江',value: Math.round(Math.random()*2000)},
                {name: '江西',value: Math.round(Math.random()*2000)},
                {name: '湖北',value: Math.round(Math.random()*2000)},
                {name: '广西',value: Math.round(Math.random()*2000)},
                {name: '甘肃',value: Math.round(Math.random()*2000)},
                {name: '山西',value: Math.round(Math.random()*2000)},
                {name: '内蒙古',value: Math.round(Math.random()*2000)},
                {name: '陕西',value: Math.round(Math.random()*2000)},
                {name: '吉林',value: Math.round(Math.random()*2000)},
                {name: '福建',value: Math.round(Math.random()*2000)},
                {name: '贵州',value: Math.round(Math.random()*2000)},
                {name: '广东',value: Math.round(Math.random()*2000)},
                {name: '青海',value: Math.round(Math.random()*2000)},
                {name: '西藏',value: Math.round(Math.random()*2000)},
                {name: '四川',value: Math.round(Math.random()*2000)},
                {name: '宁夏',value: Math.round(Math.random()*2000)},
                {name: '海南',value: Math.round(Math.random()*2000)},
                {name: '台湾',value: Math.round(Math.random()*2000)},
                {name: '香港',value: Math.round(Math.random()*2000)},
                {name: '澳门',value: Math.round(Math.random()*2000)}
            ]
        }
    ]
};
                    
mapChart.setOption(mapOption);
    </script>
  </body>
</html>
