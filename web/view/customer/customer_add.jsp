<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<!doctype html>--%>
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
</head>

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">客户管理</a></li>

        <li>添加客户</li>
    </ul>
</div>

<form action="addcustomer" method="post" >
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="<%=basePath%>customerview">返回上一级</a>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">开票信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">公司编号</label>
                <div class="col-sm-9">
                	<input type="text" name="customerId" class="form-control input-sm" placeholder="请输入编号（不用输入，自动生成）" readonly="readonly" value="${newcustomerid}" />
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">公司名称</label>
                <div class="col-sm-9">
                	<input type="text" name="customerName"  required="required" class="form-control input-sm" placeholder="请输入公司名称（必填）"/>
                </div>
            </div>
        </div>
    </div>
    	<!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">开票抬头</label>
                <div class="col-sm-9">
                        <input type="text" name="customerInvoicename" class="form-control input-sm" placeholder="请输入开票抬头"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">税号</label>
                <div class="col-sm-9">
                	<input type="text" name="customerInvoiceduty" class="form-control input-sm" placeholder="请输入税号"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">开户行</label>
                <div class="col-sm-9">
                	<input type="text" name="customerInvoicebank" class="form-control input-sm" placeholder="请输入开户行"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">银行账户</label>
                <div class="col-sm-9">
                	<input type="text" name="customerInvoiceaccount" class="form-control input-sm" placeholder="请输入银行账户"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">开票电话</label>
                <div class="col-sm-9">
                	<input type="text" name="customerInvoicetele" class="form-control input-sm" placeholder="请输入开票电话"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">开票地址</label>
                <div class="col-sm-9">
                	<input type="text" name="customerInvoiceaddress" class="form-control input-sm" placeholder="请输入开票地址"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">业务联系信息</h5>
   <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">业务联系人</label>
                <div class="col-sm-9">
                	<input type="text" name="customerLinkman" class="form-control input-sm" placeholder="请输入业务联系人"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">业务联系电话</label>
                <div class="col-sm-9">
                	<input type="text" name="customerLinktele" class="form-control input-sm" placeholder="请输入业务联系电话"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
      <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">业务电子邮箱</label>
                <div class="col-sm-9">
                	<input type="text" name="customerLinkemaile" class="form-control input-sm" placeholder="请输入业务电子邮箱"/>
                </div>
            </div>
        </div>

    </div>
   <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">收货联系信息</h5>
         <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">收件地址</label>
                <div class="col-sm-9">
                	<input type="text" name="customerGoodsaddress" class="form-control input-sm" placeholder="请输入收件地址"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">收件联系人</label>
                <div class="col-sm-9">
                	<input type="text" name="customerGoodsman" class="form-control input-sm" placeholder="请输入收件联系人"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收件人 联系电话</label>
                <div class="col-sm-9">
                    <input type="text" name="customerGoodstele" class="form-control input-sm" placeholder="请输入收件人 联系电话"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收件人 联系邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="customerGoodsemaile" class="form-control input-sm" placeholder="请输入收件人 联系邮箱"/>
                </div>
            </div>
        </div>
    </div>
    <!--结束 -->

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">收票联系信息</h5>
            <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">收票地址</label>
                <div class="col-sm-9">
                	<input type="text" name="customerTicketaddress" class="form-control input-sm" placeholder="请输入收票地址"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">收票联系人</label>
                <div class="col-sm-9">
                    <input type="text" name="customerTicketman" class="form-control input-sm" placeholder="请输入收票联系人"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收票人 联系电话</label>
                <div class="col-sm-9">
                    <input type="text" name="customerTickettele" class="form-control input-sm" placeholder="收票人 联系电话"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收票人 联系邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="customerTicketemaile" class="form-control input-sm" placeholder="收票人 联系邮箱"/>
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
                <label class="col-sm-3 control-label">所属业务员</label>
                <div class="col-sm-9">
                    <input type="text" name="customerSalesmanname" class="form-control input-sm" placeholder="请输入业务员名字（默认登录用户）"  readonly="readonly" value="${sessionScope.user.loginUsercode}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">制单员</label>
                <div class="col-sm-9">
                    <input type="text" name="customerMakingpartname" class="form-control input-sm" placeholder="默认登录用户，不可修改" value="${sessionScope.user.loginUsercode}"/>
                </div>
            </div>
        </div>
    </div>
    <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">物流特殊要求</h5>
    	<div class="row">
    	<div class="col-sm-10">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">物流特殊要求</label>
                <div class="col-sm-9">
                	<textarea  name="logisticsSpecialRequirements"  class="form-control"></textarea>
                </div>
            </div>
        
        </div>

    </div>
 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="<%=basePath%>customerview">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
