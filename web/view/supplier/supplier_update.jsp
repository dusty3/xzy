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
        <li>供应商池</li>
        <li>修改供应商信息</li>
    </ul>
</div>

<form action="<%=basePath%>/updatesupplier"  method="post" class="form-horizontal">
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="修改"/>
            <a class="btn btn-warning" href="supplier_list.jsp">返回上一级</a>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">供应商基本信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">供应商编号</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierId" class="form-control input-sm" value="${supplier.supplierId}" placeholder="请输入编号（不用输入，自动生成）" readonly="readonly"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">供应商名称</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierName" value="${supplier.supplierName}" class="form-control input-sm" placeholder="请输入供应商名称（必填）"/>
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
                    <input type="text" name="supplierCountry"  value="${supplier.supplierCountry}" class="form-control input-sm" placeholder="请输入国家"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">网址</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierWebsite"  value="${supplier.supplierWebsite}" class="form-control input-sm" placeholder="请输入网址"/>
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
                    <input type="text" name="supplierInquiryman"  value="${supplier.supplierInquiryman}" class="form-control input-sm" placeholder="请输入询价联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">询价电话</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierInquirytele" value="${supplier.supplierInquirytele}" class="form-control input-sm" placeholder="请输入询价电话"/>
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
                    <input type="text" name="supplierInquiryphone"  value=" ${supplier.supplierInquiryphone}" class="form-control input-sm" placeholder="请输入询价手机"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">询价传真</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierInquiryfax"  value=" ${supplier.supplierInquiryfax}" class="form-control input-sm" placeholder="请输入询价传真"/>
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
                    <input type="text" name="supplierInquiryemail" value=" ${supplier.supplierInquiryemail}" class="form-control input-sm" placeholder="请输入询价邮箱"/>
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
                    <input type="text" name="supplierOrderman" value="${supplier.supplierOrderman}" class="form-control input-sm" placeholder="请输入订单联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">订单电话</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierOrdertele" value="${supplier.supplierOrdertele}" class="form-control input-sm" placeholder="请输入订单电话"/>
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
                    <input type="text" name="supplierOrderphone"  value="${supplier.supplierOrderphone}" class="form-control input-sm" placeholder="请输入订单手机"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">订单传真</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierOrderfax"  value="${supplier.supplierOrderfax} " class="form-control input-sm" placeholder="请输入订单传真"/>
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
                    <input type="text" name="supplierOrderemail"  value="${supplier.supplierOrderemail} " class="form-control input-sm" placeholder="请输入订单邮箱"/>
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
                    <input type="text" name="supplierGoodsman" value="${supplier.supplierGoodsman}" class="form-control input-sm" placeholder="请输入发货联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">发货电话</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierGoodstele" value="${supplier.supplierGoodstele}" class="form-control input-sm" placeholder="请输入发货电话"/>
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
                    <input type="text" name="supplierGoodsphone"  value="${supplier.supplierGoodsphone}" class="form-control input-sm" placeholder="请输入发货手机"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">发货传真</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierGoodsfax"   value="${supplier.supplierGoodsfax}" class="form-control input-sm" placeholder="请输入发货传真"/>
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
                    <input type="text" name="supplierGoodsemail"  value="${supplier.supplierGoodsemail}" class="form-control input-sm" placeholder="请输入发货邮箱"/>
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
                    <input type="text" name="supplierCustomernumber" value="${supplier.supplierCustomernumber}" class="form-control input-sm" placeholder="请输入厂家给的客户号"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">供应商创建人</label>
                <div class="col-sm-9">
                    <input type="text" name="supplierMakingpartname" value="${supplier.supplierMakingpartname}" class="form-control input-sm" placeholder="请输入供应商创建人"/>
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
                    <textarea  name="supplierDescription" value="${supplier.supplierDescription}"  class="form-control"></textarea>
                </div>
            </div>

        </div>

    </div>

    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input  type="submit" class="btn btn-success" value="修改"/>
            <a class="btn btn-warning" href="supplier_list.jsp">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
