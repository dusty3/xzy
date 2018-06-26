<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="./js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="./js/bootstrap.min.js"></script>
</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; " >
        <li><a href="#">客户管理</a></li>
        <li>客户池</li>
        <li>修改客户信息</li>
    </ul>
</div>

<form action="updatecustomer" method="post" onsubmit="return check()">
   <%-- <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input  type="submit" class="btn btn-success" value="修改"/>
            <a class="btn btn-warning" href="customer_list.jsp">返回上一级</a>
        </div>
    </div>--%>

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">开票信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">公司编号</label>
                <div class="col-sm-9">
                    <input type="text" name="customerId" class="form-control input-sm" placeholder="请输入编号（不用输入，自动生成）" value="${customer.customerId}"  readonly="readonly"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">公司名称</label>
                <div class="col-sm-9">
                    <input type="text" name="customerName" class="form-control input-sm" placeholder="请输入公司名称（必填）"  value="${customer.customerName}"/>
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
                    <input type="text" name="customerInvoicename" class="form-control input-sm" placeholder="请输入开票抬头" value="${customer.customerInvoicename}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">税号</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入税号" value="${customer.customerInvoiceduty}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入开户行" value="${customer.customerInvoicebank}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">银行账户</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入银行账户" value="${customer.customerInvoiceaccount}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入开票电话" value="${customer.customerInvoicetele}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">开票地址</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入开票地址" value="${customer.customerInvoiceaddress}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入业务联系人" value="${customer.customerLinkman}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">业务联系电话</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入业务联系电话" value="${customer.customerLinktele}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入业务电子邮箱"  value="${customer.customerLinkemaile}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入收件地址" value="${customer.customerGoodsaddress}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收件联系人</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入收件联系人" value="${customer.customerGoodsman}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入收件人 联系电话" value="${customer.customerGoodstele}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收件人 联系邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入收件人 联系邮箱"  value="${customer.customerGoodsemaile}" />
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入收票地址" value="${customer.customerTicketaddress}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收票联系人</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入收票联系人"  value="${customer.customerTicketman}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="收票人 联系电话" value="${customer.customerTickettele}"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">收票人 联系邮箱</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="收票人 联系邮箱" value="${customer.customerTicketemaile}"/>
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
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入业务员名字（默认登录用户）" value="${customer.customerSalesmanid}" <%--readonly="readonly"--%>/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">制单员</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="默认登录用户，不可修改" value="${sessionScope.user.loginUsercode}"  readonly="readonly"/>
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
                    <textarea class="form-control"  value="${customer.logisticsSpecialRequirements}" ></textarea>
                </div>
            </div>

        </div>

    </div>

    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="customer_list.jsp">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
