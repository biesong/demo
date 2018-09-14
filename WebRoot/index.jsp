<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
<script type="text/javascript">
     $(function(){  
      
       $.ajax({
        url:"/web/EmployeeAction",
        type:"get",
        dataType:"json",
        success:function(d){
         var data=d;
        var viewObj=$("#allProductUl");  
                    for(var i=0; i<data.length; i++){  
                        var liTplObj=$("#allProductLi").clone(); 
                         
                        for(var key in data[i]){  
                            $("[dbField='"+key+"']",liTplObj).html(data[i][key]);  
                        }         
                        viewObj.append(liTplObj);  
                    }  
                          viewObj.find("li:first").hide();
                    viewObj.listview("refresh");  
                    //viewObj.selectmenu("refresh",true);  
        }
       });

          
                  
            });                                

</script>
  </head>
  
  <body>
  <div data-role="page" >

	<div data-role="header">
		<h1>Single page</h1>
	</div><!-- /header -->

	<div role="main" class="ui-content">
<ul data-role="listview" data-inset="true" id="allProductUl" >
			
					 <li  id="allProductLi" >
            <h4  style="margin-top:0px;" dbField='name'></h4>
            
            <p  style="margin-top:10px;margin-bottom:5px;">
            <span  style="font-size:12px;">邮箱：</span><span dbField='email' style="font-size:12px;"></span>
            <span        style="margin-left:10px;font-size:12px;" >注册日期:</span><span style="color:#f00;font-size:12px;" dbField='hiredate'></span>
            </p>
    </li>
					
				</ul>
	</div><!-- /content -->

	<div data-role="footer" data-position="fixed">
		<h4>Footer content</h4>
	</div><!-- /footer -->

</div><!-- /page -->

  </body>
</html>
