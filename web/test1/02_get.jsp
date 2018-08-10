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
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#country").change(function () {
                var countryName = $(this).val();
                var dt = "xml";
                if(countryName != "" && countryName != undefined){
                    $.get(
                        "${pageContext.request.contextPath}/getCity?sendType=get&dt="+dt,
                        {"countryName":countryName},
                        function (data) {
                            if("json" == dt){
                                if(data != undefined && data != null){
                                    var cities = data.cities;
                                    $("#city").empty();
                                    $.each(cities,function (i,obj) {
                                        $("#city").append("<option>" + obj.city + "</option>");
                                    })
                                }else{
                                    alert("error....");
                                }
                            }else{
                                var $xmlDocument = $(data);
                                var $cities = $xmlDocument.find("city");
                                $("#city").empty();
                                $.each($cities,function (i,obj) {
                                    $("#city").append("<option>" + $(obj).text() + "</option>");

                                })
                            }
                        },
                        dt
                    );

                }else{
                    alert("请选择国家");
                }
            })
        });
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
</html>
