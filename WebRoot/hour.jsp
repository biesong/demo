<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
		<meta name="viewport" content="width=device-width, initial-scale=1">



<script type="text/javascript" src="js/echarts.min.js"> </script>
<script type="text/javascript" src="js/jquery.min.js"> </script>
<script type="text/javascript" src="js/jquery.table2excel.min.js"> </script>
  </head>
  <body>
  
   <div id="main" style="width: 800px;height:600px;"></div>
  
    <script type="text/javascript">
   
  var myChart = echarts.init(document.getElementById('main'));

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
              dataView : {show: true, lang: ['数据视图', '关闭', '导出Excel'],
              contentToOption: function (opts) {
                $("#tableExcel_Day").table2excel({
                    exclude: ".noExl", //过滤位置的 css 类名
                    filename:  '每日价格走势图' + ".xls", //文件名称
                    name: "Excel Document Name.xls",
                    exclude_img: true,
                    exclude_links: true,
                    exclude_inputs: true
                });
            },
            optionToContent: function (opt) {
               // console.log(opt);
 
                var axisData = opt.xAxis[0].data; //坐标数据
                var series = opt.series; //折线图数据
                var tdHeads = '<td  style="padding: 0 10px;background-color:#A9A9A9;">时间</td>'; //表头第一列
                var tdBodys = ''; //表数据
                //组装表头
                var nameData = new Array('数量');
                for (var i = 0; i < nameData.length; i++) {
                    tdHeads += '<td style="padding: 0 10px;background-color:#A9A9A9;">' + nameData[i] + '</td>';
                }
                var table = '<table id="tableExcel_Day" border="1" class="table-bordered table-striped" style="width:100%;text-align:center" ><tbody><tr>' + tdHeads + ' </tr>';
                //组装表数据
                for (var i = 0, l = axisData.length; i <l; i++) {
                    for (var j = 0; j < series.length ; j++) {                          
                        var temp = series[j].data[i];
                        if (temp != null && temp != undefined) {                                     
                            tdBodys += '<td>' + temp.toFixed(2) + '</td>';      
                        } else {
                            tdBodys += '<td></td>';
                        }
                    }
                    table += '<tr><td style="padding: 0 10px">' + axisData[i] + '</td>' + tdBodys + '</tr>';
                    tdBodys = '';
                }
                table += '</tbody></table>';                                  
               // console.log(table);
                return table;
                
            }
              
              },
              magicType: {show: true, type: ['line', 'bar']},
              saveAsImage:{}
              }
            },
            tooltip: {},
            legend: {
                data:['注册']
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
$.get('EmployeeAction!getHour.action').done(function (data) {
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

                    
myChart.setOption(option);

 

    </script>
  </body>
</html>
