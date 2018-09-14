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
        url:"http://api.tianapi.com/it/?key=364878abb34efc6191d467780bbe64f9&num=10",
        type:"get",
        dataType:"json",
        success:function(d){
         var data=d.newslist;
        var viewObj=$("#allNewsUl");  
                    for(var i=0; i<data.length; i++){  
                        var liTplObj=$("#allNewsLi").clone(); 
                         
                        for(var key in data[i]){  
                         if($("[dbField='"+key+"']",liTplObj).prop("tagName")=='A'){
                            $("[dbField='"+key+"']",liTplObj).attr("href",data[i][key])
                            }else if($("[dbField='"+key+"']",liTplObj).prop("tagName")=='IMG'){
                            $("[dbField='"+key+"']",liTplObj).attr("src",data[i][key])
                            }else{
                             $("[dbField='"+key+"']",liTplObj).html(data[i][key]); 
                            }
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
<ul data-role="listview" data-split-icon="gear" data-split-theme="a" data-inset="true" id="allNewsUl">
					<li id="allNewsLi"><a href="#" dbField="url">
						<img src="" dbField='picUrl'>
					<h2 dbField='title'></h2>
					<p dbField='description'></p></a>
					</li>
					
					
				</ul>
	</div><!-- /content -->

	<div data-role="footer" data-position="fixed">
		<h4>Footer content</h4>
	</div><!-- /footer -->

</div><!-- /page -->

  </body>
</html>
