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

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">供应商管理</a></li>

        <li>添加供应商</li>
    </ul>
</div>

<form action="<%=basePath%>/addsupplier" class="form-horizontal" method="post">
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="supplier_list.jsp">返回上一级</a>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">供应商基本信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">供应商编号</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierId"  value="${newsupplierid}" class="form-control input-sm" placeholder="请输入编号（不用输入，自动生成）"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">供应商名称</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierName" class="form-control input-sm" placeholder="请输入供应商名称（必填）"/>
                </div>
            </div>
        </div>
    </div>

    <!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">国家</label>
                <div class="col-sm-9">
                        <input type="text" name="supplierCountry" class="form-control input-sm" placeholder="请输入国家"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">网址</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierWebsite" class="form-control input-sm" placeholder="请输入网址"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">询价联系方式</h5>
    <!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">询价联系人</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierInquiryman" class="form-control input-sm" placeholder="请输入询价联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">询价电话</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierInquirytele" class="form-control input-sm" placeholder="请输入询价电话"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">询价手机</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierInquiryphone" class="form-control input-sm" placeholder="请输入询价手机"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">询价传真</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierInquiryfax" class="form-control input-sm" placeholder="请输入询价传真"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">询价邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierInquiryemail" class="form-control input-sm" placeholder="请输入询价邮箱"/>
                </div>
            </div>
        </div>

    </div>
    <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">订单联系方式</h5>
   <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">订单联系人</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierOrderman" class="form-control input-sm" placeholder="请输入订单联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">订单电话</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierOrdertele" class="form-control input-sm" placeholder="请输入订单电话"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">订单手机</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierOrderphone" class="form-control input-sm" placeholder="请输入订单手机"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">订单传真</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierOrderfax" class="form-control input-sm" placeholder="请输入订单传真"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">订单邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierOrderemail" class="form-control input-sm" placeholder="请输入订单邮箱"/>
                </div>
            </div>
        </div>

    </div>
    <!--结束 -->



    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">发货联系信息</h5>
         <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">发货联系人</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierGoodsman" class="form-control input-sm" placeholder="请输入发货联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">发货电话</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierGoodstele" class="form-control input-sm" placeholder="请输入发货电话"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">发货手机</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierGoodsphone" class="form-control input-sm" placeholder="请输入发货手机"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">发货传真</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierGoodsfax" class="form-control input-sm" placeholder="请输入发货传真"/>
                </div>
            </div>
        </div>
    </div>
    <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">发货邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierGoodsemail" class="form-control input-sm" placeholder="请输入发货邮箱"/>
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
            	<label class="col-sm-3 control-label">厂家给的客户号</label>
                <div class="col-sm-9">
                	<input type="text" name="supplierCustomernumber" class="form-control input-sm" placeholder="请输入厂家给的客户号"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">供应商创建人</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierMakingpartname" class="form-control input-sm" placeholder="请输入供应商创建人"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->



    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">供应商特殊说明</h5>
    	<div class="row">
    	<div class="col-sm-10">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">供应商特殊说明</label>
                <div class="col-sm-9">
                	<textarea name="supplierDescription" class="form-control"></textarea>
                </div>
            </div>
        
        </div>

    </div>
 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="supplier_list.jsp">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
