<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">品牌管理</a></li>
        <li>查询品牌</li>
    </ul>
</div>
<script>
    function SendForm () {

        document.addbrand.submit();

    }
</script>
<form  action="<%=basePath%>/querybrand" method="post" name="addbrand" class="form-inline">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="activename">品牌名字：</label>
        <input type="email" name="brandname" class="form-control" id="activename" placeholder="请输入品牌名字">
      </div>

    <input type="button"   class="btn btn-danger"  onclick="SendForm()"   value="查询"/>
    <a  class="btn btn-success"  href="<%=basePath%>/addbrandview">添加品牌</a>
    
</div>
</form>
<div class="row" style="padding:15px; padding-top:0px; ">
	<table class="table  table-condensed table-striped">
    	<tr>
        	<th>编号</th>
            <th>品牌名称</th>
            <th>厂家名称</th>
            <th>官方网站</th>
            <th>联系方式</th>
            <th>电子邮件</th>
            <th>品牌特点</th>
            <th>制单员</th>
            <th>操作</th>
        </tr>
        <c:forEach var="brand" items="${sessionScope.brands}" >
            <tr>
                <td>${brand.brandId}</td>
                <td>${brand.brandName}</td>
                <td>${brand.brandManufacturers}</td>
                <td>${brand.brandWebsite}</td>
                <td>${brand.brandTele}</td>
                <td>${brand.brandEmail}</td>
                <td>${brand.brandDescription}</td>
                <td>${brand.brandMakingpartname}</td>
                <th>
                    <a href="<%=basePath%>/updatebrandView?brandId=${brand.brandId}">修改</a>
                    <a href="<%=basePath%>/deletebrand?brandId=${brand.brandId}">删除</a>
                </th>

            </tr>
        </c:forEach>



    </table>
</div>

</body>
</html>
