
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        window.onload=function()
        {
            var infoshow='${info}';
            if(infoshow===null||infoshow===""){

            }else{
                alert(infoshow);
                <%request.removeAttribute("info");%>
            }
            var checkboxs=document.getElementsByName("selectone");
            var selectone=document.getElementById("selectone");
            cklen=checkboxs.length;
            selectone.onclick=function()
            {
                if(this.checked==true)
                {
                    for(var i=0;i<cklen;i++)
                    {
                        checkboxs[i].checked=true;
                    }
                    document.getElementById("allSel").innerHTML="取消"
                }
                else
                {
                    for(var i=0;i<cklen;i++)
                    {
                        checkboxs[i].checked=false;
                    }
                    document.getElementById("allSel").innerHTML="全选"
                }
            }
        }
    </script>
</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">我的询价</a></li>
        <li>询价列表</li>
    </ul>
</div>
<form name="queryinquiry" action="<%=basePath%>/queryinquiry" method="post" class="form-inline">
    <div class="row alert alert-info" style="margin:0px; padding:3px;">
        <table style="border-collapse:separate; border-spacing:5px 5px;">
    <div class="form-group" >
        <tr>
            <th><label class="" for="activename1">询价单号：</label></th>
            <th><input name="inquiryId" type="text" class="form-control" id="activename1" placeholder="请输入询价单号"></th>
            <th><label class="" for="activename2">品牌：</label></th>
            <th><input  name="brandName" type="text" class="form-control" id="activename2" placeholder="请输入品牌"></th>
            <th><label class="" for="activename3">客户：</label></th>
            <th><input name="customerName" type="text" class="form-control" id="activename3" placeholder="请输入客户"></th>
            <th><label  class="" for="activename4">供应商：</label></th>
            <th><input name="supplierName" type="text" class="form-control" id="activename4" placeholder="请输入供应商"></th>
            <th><label class="" for="activename5">询价方式：</label></th>
            <th><select class="form-control" id="activename5" name="inquiryStyle">
                    <option value="">-请选择-</option>
                    <option value="0">邮件</option>
                    <option value="1">人工询价</option></select> </th>

            <th><a class="btn btn-success"  style="background:burlywood" href="<%=basePath%>addinquiryview">新建</a></th>

            <th><input type="button" onclick="sendmore()" style="background:goldenrod" class="btn btn-success"  value="发送"/></th>
            <script>
                 function sendmore() {

                     var obj = document.getElementsByName("selectone");
                      var check_val = [];
                      var  resultdata=[];
                     for(k in obj){
                         if(obj[k].checked)
                             check_val.push(obj[k].value);
                     }
                     $.ajax({
                         url: "<%=basePath%>sendmoremail",
                         type: "POST",
                         data: JSON.stringify(check_val),
                         cache: false,
                         dataType: 'JSON',
                         contentType: 'application/json;charset=UTF-8', //contentType很重要
                         success: function (result) {
                             resultdata= result;
                             for(var i=0;i<resultdata.length;i++){
                                 $("#"+resultdata[i]).find("option[value='1']").attr("selected",true);
                                 alert("发送询价成功");
                             }

                         }
                     });
                 }


            </script>

        </tr>
        <tr>
            <th><label  class="" for="activename6">询价日期：</label></th>
            <th><input name="inquiryCreatetime" type="date" value="" class="form-control" id="activename6" /></th>
            <th><label class="" for="activename7">至：</label></th>
            <th><input name="inquiryCreatetime1" type="date" value="" class="form-control" id="activename7" /></th>
            <th><label class="" for="activename8">回复日期：</label></th>
            <th><input type="date" value="" class="form-control" id="activename8" /></th>
            <th><label class="" for="activename9">至：</label></th>
            <th><input type="date" value="" class="form-control" id="activename9" /></th>
            <th><label class="" for="activename10">发送状态：</label></th>
            <th><select class="form-control" id="activename10" name="inquirySend">
                    <option value="">-请选择-</option>
                    <option value="0">未发送</option>
                    <option value="1">已发送</option>
                </select> </th>
            <th><input type="reset" class="btn btn-success" value="重置"/> </th>
            <th> <input type="submit" class="btn btn-danger" value="查询"/> </th>
        </tr>
    </div>
    </table>
    </div>
</form>
    <div class="row" style="padding:15px; padding-top:0px; ">
        <table class="table  table-condensed table-striped">
            <tr>
                <th><input type="checkbox" id="selectone" />
                    <span class="allSel" id="allSel">全选</span></th>
                <th>询价单号</th>
                <th>询价日期</th>
                <th>询价方式</th>
                <th>客户名字</th>
                <th>品牌名字</th>
                <th>供应商名字</th>
                <th>已发送</th>
                <th>业务员</th>
                <th>操作</th>
            </tr>
            <c:forEach var="inquiry" items="${sessionScope.inquirys}" >
                <tr>
                    <td><input type="checkbox" name="selectone" value="${inquiry.inquiryId}" /></td>
                    <td>${inquiry.inquiryId}</td>
                    <td>${inquiry.inquiryCreatetime}</td>
                    <td><select  disabled="disabled" >
                        <option value="0" <c:if test="${inquiry.inquiryStyle==0}">selected</c:if>>邮件</option>
                        <option value="1" <c:if test="${inquiry.inquiryStyle==1}">selected</c:if>>人工询价</option>
                    </select></td>
                    <td>${inquiry.customerName}</td>
                    <td>${inquiry.brandName}</td>
                    <td>${inquiry.supplierName}</td>
                    <td><select  disabled="disabled"  id="${inquiry.inquiryId}">
                        <option value="0" <c:if test="${inquiry.inquirySend==0}">selected</c:if>>未发送</option>
                        <option value="1" <c:if test="${inquiry.inquirySend==1}">selected</c:if>>已发送</option>
                    </select></td>

                    <td>${inquiry.inquiryMakingpartname}</td>

                    <th>
                        <a href="<%=basePath%>/sendinquery?inquiryId=${inquiry.inquiryId}">发送</a>
                        <a href="<%=basePath%>/updateinquiryView?inquiryId=${inquiry.inquiryId}">修改</a>
                        <a href="<%=basePath%>/deleteinquiry?inquiryId=${inquiry.inquiryId}">删除</a>
                    </th>

                </tr>
            </c:forEach>


        </table>
    </div>

</body>
</html>
