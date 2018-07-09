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
<script type="text/javascript">
    window.onload=function () {
        var infoshow='${info}';
        if(infoshow===null||infoshow===""){

        }else{
            alert(infoshow);
            <%request.removeAttribute("info");%>
        }
    }

</script>
<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">产品管理</a></li>
        <li>查询产品</li>
    </ul>
</div>

<script>
    function SendForm () {

        document.queryproduct.submit();

    }
</script>

<form  name="queryproduct" action="<%=basePath%>/queryproduct" method="post" class="form-inline">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="activename">产品型号：</label>
        <input name="productType" type="email" class="form-control" id="activename" placeholder="请输入产品型号">
      </div>

    <input type="button"   class="btn btn-danger" onclick="SendForm()"     value="查询"/>
    <a  class="btn btn-success"  href="<%=basePath%>/addproductview">添加产品</a>
    
</div>
</form>
<div class="row" style="padding:15px; padding-top:0px; ">
	<table class="table  table-condensed table-striped">
    	<tr>
        	<th>编号</th>
            <th>品牌</th>
            <th>型号</th>
            <th>中文品名</th>
            <th>外文品名</th>
            <th>清关品名</th>
            <th>关税</th>
            <th>是否正式产品</th>
            <th>制单员</th>
            <th>操作</th>
        </tr>
        <c:forEach var="product" items="${sessionScope.products}" >
            <tr>
                <td>${product.productId}</td>
                <td>${product.brandName}</td>
                <td>${product.productType}</td>
                <td>${product.productChinesename}</td>
                <td>${product.productForeignname}</td>
                <td>${product.productCustomsname}</td>
                <td>${product.productCustomsduty}</td>
                <td>${product.isofficial}</td>
                <td>${product.productMakingpartname}</td>
                <th>
                    <a href="<%=basePath%>/updateproductView?productId=${product.productId}">修改</a>
                    <a href="<%=basePath%>/deleteproduct?productId=${product.productId}">删除</a>
                </th>

            </tr>
        </c:forEach>

    </table>
</div>

</body>
</html>
