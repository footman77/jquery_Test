<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获取服务器端时间</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
	</script>
  </head>
  
  <body>
  <div style="width:100%; text-align: center;">
    	当前时间为：<span>${currentTime}</span> <br><br>
    	<input type="button" value="同步获取当前时间">
    	《《《《《《》》》》》》
    	<input type="button" value="异步获取当前时间">
  </div>

  </body>


  <script>
	 var fitstBtn =  document.getElementsByTagName('input')[0];
	 fitstBtn.onclick = function () {
		 location.href="${pageContext.request.contextPath}/getTime";
     }

     var secondBtn = document.getElementsByTagName('input')[1];
	 secondBtn.onclick = function(){
	     <%--//1.创建XMLHTTPREQUEST对象--%>
         <%--var ajax = createAjax();--%>
         <%--//2.设置回调函数--%>
         <%--ajax.onreadystatechange = function () {--%>
			 <%--if(ajax.readyState  == 4 && ajax.status == 200){--%>
			     <%--document.getElementsByTagName('span')[0].innerHTML = ajax.responseText ;--%>

			 <%--}--%>
         <%--}--%>
         <%--//3.open--%>
         <%--ajax.open("get","${pageContext.request.contextPath}/getTime?sendType=async",true);--%>
         <%--//4.send--%>
	     <%--ajax.send(null);--%>

         //1.创建XMLHTTPREQUEST对象
         var ajax = createAjax();
         //2.设置回调函数
         ajax.onreadystatechange = function () {
             if(ajax.readyState  == 4 && ajax.status == 200){
                 document.getElementsByTagName('span')[0].innerHTML = ajax.responseText ;

             }
         }
         //3.open
         ajax.open("post","${pageContext.request.contextPath}/getTime?sendType=async",true);
         //post方式需要设置请求头
         ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         //4.send
         ajax.send("name=jacky&nick=老大");

     }

	 //创建ajax对象
	 function createAjax() {
         var ajax = null;
         if(window.XMLHttpRequest){
			ajax = new XMLHttpRequest();//ie7以上版本的浏览器
         }else {
         	ajax = new ActiveXObject("Microsoft.XMLHTTP");

         }
		 return ajax;
     }



  </script>

</html>
