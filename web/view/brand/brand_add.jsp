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
    	<li><a href="#">品牌管理</a></li>

        <li>添加品牌</li>
    </ul>
</div>

<form action="<%=basePath%>/addbrand" method="post" class="form-horizontal">
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="<%=basePath%>brandview">返回上一级</a>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">品牌信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">品牌编号</label>
                <div class="col-sm-9">
                	<input type="text" name="brandId" value="${newbrandid}" class="form-control input-sm" placeholder="请输入品牌编号（不用输入，自动生成）"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">品牌名称</label>
                <div class="col-sm-9">
                	<input type="text" name="brandName"  required="required" class="form-control input-sm" placeholder="请输入品牌名称（必填）"/>
                </div>
            </div>
        </div>
    </div>
    	<!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">厂家名称</label>
                <div class="col-sm-9">
                        <input type="text" name="brandManufacturers" class="form-control input-sm" placeholder="请输入厂家名称"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">官方网站</label>
                <div class="col-sm-9">
                	<input type="text" name="brandWebsite" class="form-control input-sm" placeholder="请输入官方网站"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">联系方式</label>
                <div class="col-sm-9">
                	<input type="text" name="brandTele" class="form-control input-sm" placeholder="请输入联系方式"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">电子邮箱</label>
                <div class="col-sm-9">
                	<input type="text" name="brandEmail" class="form-control input-sm" placeholder="请输入电子邮箱"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">品牌特点</label>
                <div class="col-sm-9">
                    <input type="text" name="brandDescription" class="form-control input-sm" placeholder="请输入品牌特点"/>
                </div>
            </div>
        </div>

    </div>
    <!--结束 -->

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">其他信息</h5>
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">制单员</label>
                <div class="col-sm-9">
                    <input type="text" name="brandMakingpartname" value="${sessionScope.user.loginUsercode}" readonly="readonly" class="form-control input-sm" placeholder="请输入业务员名字（默认登录用户）"/>
                </div>
            </div>
        </div>
    </div>
    <!--结束 -->


 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="<%=basePath%>brandview">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
