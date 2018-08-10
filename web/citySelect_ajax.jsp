<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ajax异步选择城市</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
    <div style="width:100%;text-align: center;margin-top: 30px;">
    	国家：<select id="country" style="width:160px;">
    		<option>请选择</option>
    		<option value="中国">中国</option>
    		<option value="美国">美国</option>
    	</select>
    	&nbsp;&nbsp;---&nbsp;&nbsp;
    	城市：<select id="city"></select>
    </div>
  </body>



  <script>

      var country = document.getElementById('country');
      var city = document.getElementById('city');

      country.onchange = function(){
          // 获得到国家
          var countryName = country.value;

          if(countryName != null){
              // 根据国家获得城市列表
               var ajax = createAjax();
               ajax.onreadystatechange = function(){
                   if(ajax.readyState == 4 && ajax.status == 200){
                       // // 将城市列表设置到city中
                       // var xmlDocument = ajax.responseXML;
                       // var cities = xmlDocument.getElementsByTagName('city');
                       // //清楚原来的内容
                       // city.length = 0;
                       //
                       // for(var i = 0; i < cities.length; i++){
                       //     var opt = document.createElement("option");
                       //     opt.innerHTML = cities[i].innerHTML;
                       //     city.appendChild(opt);
                       // }

                       //-------------------  json的方式



                   }

               }

               ajax.open("post","${pageContext.request.contextPath}/getCity?sendType=post",true);

               ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");

               ajax.send("countryName=" + countryName);

          }else{
              alert("请选择国家")
          }



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
