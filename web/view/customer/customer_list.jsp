<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<%--<%--%>
    <%--String info=(String)session.getAttribute("info");--%>
    <%--if("".equals(info)  && info==null){--%>

    <%--}--%>

    <%--else{%>--%>
<%--<script type="text/javascript">--%>
    <%--alert("<%=info%>");--%>
<%--</script>--%>

<%--session.setAttribute("info", "");--%>
<%--<% }%>--%>

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">客户管理</a></li>
        <li>查询客户</li>
    </ul>
</div>
<form class="form-inline">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="activename">公司名字：</label>
        <input type="email" class="form-control" id="activename" placeholder="请输入公司名字" >
      </div>

    <input type="button"   class="btn btn-danger"     value="查询"/>
    <a  class="btn btn-success"  href="<%=basePath%>/tocustomerview">添加客户</a>
    
</div>
<div class="row" style="padding:15px; padding-top:0px; ">
	<table class="table  table-condensed table-striped">
    	<tr>
        	<th>编号</th>
            <th>公司名</th>
            <th>联系人</th>
            <th>手机号码</th>
            <th>电子邮件</th>
            <th>所属业务员</th>
            <th>操作</th>
        </tr>
        <c:forEach var="customer" items="${sessionScope.custmers}" >
            <tr>
            <td>${customer.customerId}</td>
            <td>${customer.customerName}</td>
            <td>${customer.customerLinkman}</td>
            <td>${customer.customerLinktele}</td>
            <td>${customer.customerLinkemaile}</td>
            <td>${customer.customerSalesmanname}</td>
            <th>
                <a href="<%=basePath%>/updatecustomerView?customerId=${customer.customerId}">修改</a>
                <a href="<%=basePath%>/deletecustomer?customerId=${customer.customerId}">删除</a>
            </th>

        </tr>
        </c:forEach>


    </table>
</div>
</form>
</body>
</html>
