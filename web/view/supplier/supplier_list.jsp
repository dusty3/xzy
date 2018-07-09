<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
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
    	<li><a href="#">供应商管理</a></li>
        <li>查询供应商</li>
    </ul>
</div>

<script>
    function SendForm () {

        document.querysupplier.submit();

    }
</script>
<form action="<%=basePath%>/querysupplier" method="post" class="form-inline" name="querysupplier">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="activename">供应商名字：</label>
        <input name="supplierName" type="email" class="form-control" id="activename" placeholder="请输入供应商名字">
      </div>

    <input type="button"   class="btn btn-danger"  onclick="SendForm()"   value="查询"/>
    <a  class="btn btn-success"  href="<%=basePath%>/addsupplierview">添加供应商</a>
    
</div>
</form>
<div class="row" style="padding:15px; padding-top:0px; ">
	<table class="table  table-condensed table-striped">
    	<tr>
        	<th>编号</th>
            <th>供应商名</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>电子邮件</th>
            <th>新增业务员</th>
            <th>操作</th>
        </tr>
        <c:forEach var="supplier" items="${sessionScope.suppliers}" >
            <tr>
                <td>${supplier.supplierId}</td>
                <td>${supplier.supplierName}</td>
                <td>${supplier.supplierInquiryman}</td>
                <td>${supplier.supplierInquirytele}</td>
                <td>${supplier.supplierInquiryphone}</td>
                <td>${supplier.supplierMakingpartname}</td>
                <th>
                    <a href="<%=basePath%>/updatesupplierView?supplierid=${supplier.supplierId}">修改</a>
                    <a href="<%=basePath%>/deletsupplier?supplierid=${supplier.supplierId}">删除</a>
                </th>

            </tr>
        </c:forEach>


    </table>
</div>

</body>
</html>
