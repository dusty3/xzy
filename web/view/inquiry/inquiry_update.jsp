
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        //        按添加按钮，增加一行
        var row_count;

        window.onload =function()
        {
            var infoshow='${info}';
            if(infoshow===null||infoshow===""){

            }else{
                alert(infoshow);
                <%request.removeAttribute("info");%>
            }
            row_count=$("tr[name='counttr']").length;
        }
        function addNew()
        {

            var table1 = $('#table1');
            var row = $("<tbody></tbody>");
            var tr = $("<tr>"+row_count+"</tr>");
            tr.append($("<td><input type='checkbox' name='selectone["+row_count+"]"+"' id='selectone"+row_count+"' value='New'></td>"));
            tr.append("<td><input type='text' id= 'inquiryproducts["+row_count+"].productDescription"+"'  name='inquiryproducts["+row_count+"].productDescription"+"'  placeholder='请输入外文品名'  size='50'/></td>");
            tr.append("<td><input type='text' id= 'inquiryproducts["+row_count+"].productType"+"'  name='inquiryproducts["+row_count+"].productType"+"' placeholder='请输入型号'  size='50'/></td>");
            tr.append("<td><input type='text' id=  'inquiryproducts["+row_count+"].inquiryNumber"+"' name='inquiryproducts["+row_count+"].inquiryNumber"+"' placeholder='请输入数量'  size='20'/></td>");
            tr.append("<td hidden='hidden'><input type='text' id=  'inquiryproducts["+row_count+"].ipDr"+"' name='inquiryproducts["+row_count+"].ipDr"+"' value='0'  /></td>");
            tr.append("<td><input type='button' value='删除' onclick='delRow(this)'></td>");
            row.append(tr);
            table1.append(row);
        }
        //        删除
        function delRow(obj)
        {
            $(obj).parent().parent().remove();
        }



    </script>

    <style>
        #search_cutomer{
            position: absolute;
            z-index: 999;
            left: 100px;
            top: 198px;
            border: 1px solid #74c0f9;
            display: none;
            background: #FFF;
        }

        #search_supplier{
            position: absolute;
            z-index: 999;
            left: 100px;
            top: 282px;
            border: 1px solid #74c0f9;
            display: none;
            background: #FFF;
        }

        #search_brand{
            position: absolute;
            z-index: 999;
            left: 100px;
            top: 240px;
            border: 1px solid #74c0f9;
            display: none;
            background: #FFF;
        }

    </style>


    <script>
        var highlightindex = -1; //高亮设置（-1为不高亮）
        //自动完成
        function AutoComplete(auto, search) {
            if ($("#" + search).val() != "") {
                var autoNode = $("#" + auto); //缓存对象（弹出框）
                var carlist = new Array();
                var n = 0;
                var mylist = [];
                var maxTipsCounts = 8 // 最大显示条数
                var corpname = $("#" + search).val();
                $.ajax({
                    url: '<%=basePath%>Searchcustomer',
                    data: JSON.stringify({"corpname": corpname}),
                    type: "POST",
                    cache: false,
                    dataType: 'JSON',
                    contentType: 'application/json;charset=UTF-8', //contentType很重要
                    success: function (data) {
                        mylist = data;
                        if (mylist == null) {
                            autoNode.hide();
                            return;
                        }
                        autoNode.empty(); //清空上次的记录
                        for (i in mylist) {
                            if (i < maxTipsCounts) {
                                var wordNode = mylist[i]; //弹出框里的每一条内容
                                var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值
                                document.querySelector("#search_cutomer").style.width = $("#customerName").outerWidth(true) + 'px'; //设置提示框与输入框宽度一致

                                newDivNode.attr("style", "font:14px/25px arial;height:25px;padding:0 8px;cursor: pointer;");
                                newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
                                //鼠标移入高亮，移开不高亮
                                newDivNode.mouseover(function () {
                                    if (highlightindex != -1) { //原来高亮的节点要取消高亮（是-1就不需要了）
                                        autoNode.children("div").eq(highlightindex).css("background-color", "white");
                                    }
                                    //记录新的高亮节点索引
                                    highlightindex = $(this).attr("id");
                                    $(this).css("background-color", "#ebebeb");
                                });
                                newDivNode.mouseout(function () {
                                    $(this).css("background-color", "white");
                                });
                                //鼠标点击文字上屏
                                newDivNode.click(function () {
                                    //取出高亮节点的文本内容
                                    var comText = autoNode.hide().children("div").eq(highlightindex).text();
                                    highlightindex = -1;
                                    //文本框中的内容变成高亮节点的内容
                                    $("#" + search).val(comText);
                                    fillcustomer(comText);
                                })
                                if (mylist.length > 0) { //如果返回值有内容就显示出来
                                    autoNode.show();
                                } else { //服务器端无内容返回 那么隐藏弹出框

                                    autoNode.hide();
                                    //弹出框隐藏的同时，高亮节点索引值也变成-1
                                    highlightindex = -1;
                                }
                            }
                        }
                    }
                });
            }
        }
        function  fillcustomer(comText) {
            $.ajax({
                    url: '<%=basePath%>fillcustomer',
                    data: JSON.stringify({"customername": comText}),
                    type: "POST",
                    cache: false,
                    dataType: 'JSON',
                    contentType: 'application/json;charset=UTF-8', //contentType很重要
                    success: function (data) {
                        if(data==null){
                            alert("没有该客户信息")
                        }else{
                            $("#customerLinkman").val(data.customerLinkman);
                        }

                    }
                }
            );
        }
        $(function () {
            //键盘操作
            $("#customerName").keyup(function (event) {
                //处理键盘操作
                var myEvent = event || window.event;
                var keyCode = myEvent.keyCode;
                if (keyCode == 38 || keyCode == 40) {
                    if (keyCode == 38) { //向上
                        var autoNodes = $("#search_cutomer").children("div");
                        if (highlightindex != -1) {
                            autoNodes.eq(highlightindex).css("background-color", "white");
                            highlightindex--;
                        } else {
                            highlightindex = autoNodes.length - 1;
                        }
                        if (highlightindex == -1) {
                            highlightindex = autoNodes.length - 1;
                        }
                        autoNodes.eq(highlightindex).css("background-color", "#ebebeb");
                    }
                    if (keyCode == 40) { //向下
                        var autoNodes = $("#search_cutomer").children("div");
                        if (highlightindex != -1) {
                            autoNodes.eq(highlightindex).css("background-color", "white");
                        }
                        highlightindex++;
                        if (highlightindex == autoNodes.length) {
                            highlightindex = 0;
                        }
                        autoNodes.eq(highlightindex).css("background-color", "#ebebeb");
                    }
                } else if (keyCode == 13) { //回车键
                    if (highlightindex != -1) {
                        var comText = $("#search_cutomer").hide().children("div").eq(highlightindex).text();

                        highlightindex = -1;
                        $("#customerName").val(comText);
                        if ($("#search_cutomer").is(":visible")) {
                            $("#search_cutomer").css("display", "none")
                        }
                        fillcustomer(comText);
                    }
                    /* checkInput();*/
                } else {
                    if ($("#searchcorpname").val() == "") {
                        $("#search_cutomer").hide();
                    } else {   //有文字输入时获取提示词
                        AutoComplete("search_cutomer", "customerName");
                    }
                }
            });

            //点击页面隐藏自动补全提示框
            document.onclick = function (e) {
                var e = e ? e : window.event;
                var tar = e.srcElement || e.target;
                if (tar.id != "customerName") {
                    if ($("#search_cutomer").is(":visible")) {
                        $("#search_cutomer").css("display", "none")
                    }
                }
            }
        })

    </script>


    <script>
        /*        var highlightindex = -1; //高亮设置（-1为不高亮）*/
        //自动完成
        function AutoComplete2(auto, search) {
            if ($("#" + search).val() != "") {
                var autoNode = $("#" + auto); //缓存对象（弹出框）
                var carlist = new Array();
                var n = 0;
                var mylist = [];
                var maxTipsCounts = 8 // 最大显示条数
                var suppliername = $("#" + search).val();
                $.ajax({
                    url: '<%=basePath%>SearchSupplier',
                    data: JSON.stringify({"suppliername": suppliername}),
                    type: "POST",
                    cache: false,
                    dataType: 'JSON',
                    contentType: 'application/json;charset=UTF-8', //contentType很重要
                    success: function (data) {
                        mylist = data;
                        if (mylist == null) {
                            autoNode.hide();
                            return;
                        }
                        autoNode.empty(); //清空上次的记录
                        for (i in mylist) {
                            if (i < maxTipsCounts) {
                                var wordNode = mylist[i]; //弹出框里的每一条内容
                                var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值
                                document.querySelector("#search_supplier").style.width = $("#supplierName").outerWidth(true) + 'px'; //设置提示框与输入框宽度一致

                                newDivNode.attr("style", "font:14px/25px arial;height:25px;padding:0 8px;cursor: pointer;");
                                newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
                                //鼠标移入高亮，移开不高亮
                                newDivNode.mouseover(function () {
                                    if (highlightindex != -1) { //原来高亮的节点要取消高亮（是-1就不需要了）
                                        autoNode.children("div").eq(highlightindex).css("background-color", "white");
                                    }
                                    //记录新的高亮节点索引
                                    highlightindex = $(this).attr("id");
                                    $(this).css("background-color", "#ebebeb");
                                });
                                newDivNode.mouseout(function () {
                                    $(this).css("background-color", "white");
                                });
                                //鼠标点击文字上屏
                                newDivNode.click(function () {
                                    //取出高亮节点的文本内容
                                    var comText = autoNode.hide().children("div").eq(highlightindex).text();
                                    highlightindex = -1;
                                    //文本框中的内容变成高亮节点的内容
                                    $("#" + search).val(comText);
                                    fillsupplier(comText);
                                })
                                if (mylist.length > 0) { //如果返回值有内容就显示出来
                                    autoNode.show();
                                } else { //服务器端无内容返回 那么隐藏弹出框

                                    autoNode.hide();
                                    //弹出框隐藏的同时，高亮节点索引值也变成-1
                                    highlightindex = -1;
                                }
                            }
                        }
                    }
                });
            }
        }



        function  fillsupplier(comText) {
            $.ajax({
                    url: '<%=basePath%>fillsupplier',
                    data: JSON.stringify({"suppliername": comText}),
                    type: "POST",
                    cache: false,
                    dataType: 'JSON',
                    contentType: 'application/json;charset=UTF-8', //contentType很重要
                    success: function (data) {
                        if(data==null){
                            alert("没有该供应商信息")
                        }else{
                            $("#supplierId").val(data.supplierId);
                            $("#supplierInquiryman").val(data.supplierInquiryman);
                            $("#supplierInquiryemail").val(data.supplierInquiryemail);
                            $("#supplierDescription").val(data.supplierInquiryemail);
                        }

                    }
                }
            );
        }
        $(function () {
            //键盘操作
            $("#supplierName").keyup(function (event) {
                //处理键盘操作
                var myEvent = event || window.event;
                var keyCode = myEvent.keyCode;
                if (keyCode == 38 || keyCode == 40) {
                    if (keyCode == 38) { //向上
                        var autoNodes = $("#search_supplier").children("div");
                        if (highlightindex != -1) {
                            autoNodes.eq(highlightindex).css("background-color", "white");
                            highlightindex--;
                        } else {
                            highlightindex = autoNodes.length - 1;
                        }
                        if (highlightindex == -1) {
                            highlightindex = autoNodes.length - 1;
                        }
                        autoNodes.eq(highlightindex).css("background-color", "#ebebeb");
                    }
                    if (keyCode == 40) { //向下
                        var autoNodes = $("#search_supplier").children("div");
                        if (highlightindex != -1) {
                            autoNodes.eq(highlightindex).css("background-color", "white");
                        }
                        highlightindex++;
                        if (highlightindex == autoNodes.length) {
                            highlightindex = 0;
                        }
                        autoNodes.eq(highlightindex).css("background-color", "#ebebeb");
                    }
                } else if (keyCode == 13) { //回车键
                    if (highlightindex != -1) {
                        var comText = $("#search_supplier").hide().children("div").eq(highlightindex).text();

                        highlightindex = -1;
                        $("#supplierName").val(comText);
                        if ($("#search_supplier").is(":visible")) {
                            $("#search_supplier").css("display", "none")
                        }
                        fillsupplier(comText);
                    }
                    /* checkInput();*/
                } else {
                    if ($("#supplierName").val() == "") {
                        $("#search_supplier").hide();
                    } else {   //有文字输入时获取提示词
                        AutoComplete2("search_supplier", "supplierName");
                    }
                }
            });

            //点击页面隐藏自动补全提示框
            document.onclick = function (e) {
                var e = e ? e : window.event;
                var tar = e.srcElement || e.target;
                if (tar.id != "supplierName") {
                    if ($("#search_cutomer").is(":visible")) {
                        $("#search_cutomer").css("display", "none")
                    }
                }
            }
        })

    </script>


    <script>
        /*        var highlightindex = -1; //高亮设置（-1为不高亮）*/
        //自动完成
        function AutoComplete3(auto, search) {
            if ($("#" + search).val() != "") {
                var autoNode = $("#" + auto); //缓存对象（弹出框）
                var carlist = new Array();
                var n = 0;
                var mylist = [];
                var maxTipsCounts = 8 // 最大显示条数
                var brname = $("#" + search).val();
                $.ajax({
                    url: '<%=basePath%>SearchBrand',
                    data: JSON.stringify({"brandname": brname}),
                    type: "POST",
                    cache: false,
                    dataType: 'JSON',
                    contentType: 'application/json;charset=UTF-8', //contentType很重要
                    success: function (data) {
                        mylist = data;
                        if (mylist == null) {
                            autoNode.hide();
                            return;
                        }
                        autoNode.empty(); //清空上次的记录
                        for (i in mylist) {
                            if (i < maxTipsCounts) {
                                var wordNode = mylist[i]; //弹出框里的每一条内容
                                var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值
                                document.querySelector("#search_brand").style.width = $("#brandName").outerWidth(true) + 'px'; //设置提示框与输入框宽度一致

                                newDivNode.attr("style", "font:14px/25px arial;height:25px;padding:0 8px;cursor: pointer;");
                                newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
                                //鼠标移入高亮，移开不高亮
                                newDivNode.mouseover(function () {
                                    if (highlightindex != -1) { //原来高亮的节点要取消高亮（是-1就不需要了）
                                        autoNode.children("div").eq(highlightindex).css("background-color", "white");
                                    }
                                    //记录新的高亮节点索引
                                    highlightindex = $(this).attr("id");
                                    $(this).css("background-color", "#ebebeb");
                                });
                                newDivNode.mouseout(function () {
                                    $(this).css("background-color", "white");
                                });
                                //鼠标点击文字上屏
                                newDivNode.click(function () {
                                    //取出高亮节点的文本内容
                                    var comText = autoNode.hide().children("div").eq(highlightindex).text();
                                    highlightindex = -1;
                                    //文本框中的内容变成高亮节点的内容
                                    $("#" + search).val(comText);
                                    fillbrand(comText);
                                })
                                if (mylist.length > 0) { //如果返回值有内容就显示出来
                                    autoNode.show();
                                } else { //服务器端无内容返回 那么隐藏弹出框

                                    autoNode.hide();
                                    //弹出框隐藏的同时，高亮节点索引值也变成-1
                                    highlightindex = -1;
                                }
                            }
                        }
                    }
                });
            }
        }


        function  fillbrand(comText) {
            $.ajax({
                    url: '<%=basePath%>fillbrand',
                    data: JSON.stringify({"brandname": comText}),
                    type: "POST",
                    cache: false,
                    dataType: 'JSON',
                    contentType: 'application/json;charset=UTF-8', //contentType很重要
                    success: function (data) {
                        /*      if(data==null){
                         alert("没有该品牌信息信息")
                         }else{
                         }*/

                    }
                }
            );
        }
        $(function () {
            //键盘操作
            $("#brandName").keyup(function (event) {
                //处理键盘操作
                var myEvent = event || window.event;
                var keyCode = myEvent.keyCode;
                if (keyCode == 38 || keyCode == 40) {
                    if (keyCode == 38) { //向上
                        var autoNodes = $("#search_brand").children("div");
                        if (highlightindex != -1) {
                            autoNodes.eq(highlightindex).css("background-color", "white");
                            highlightindex--;
                        } else {
                            highlightindex = autoNodes.length - 1;
                        }
                        if (highlightindex == -1) {
                            highlightindex = autoNodes.length - 1;
                        }
                        autoNodes.eq(highlightindex).css("background-color", "#ebebeb");
                    }
                    if (keyCode == 40) { //向下
                        var autoNodes = $("#search_brand").children("div");
                        if (highlightindex != -1) {
                            autoNodes.eq(highlightindex).css("background-color", "white");
                        }
                        highlightindex++;
                        if (highlightindex == autoNodes.length) {
                            highlightindex = 0;
                        }
                        autoNodes.eq(highlightindex).css("background-color", "#ebebeb");
                    }
                } else if (keyCode == 13) { //回车键
                    if (highlightindex != -1) {
                        var comText = $("#search_brand").hide().children("div").eq(highlightindex).text();

                        highlightindex = -1;
                        $("#brandName").val(comText);
                        if ($("#search_brand").is(":visible")) {
                            $("#search_brand").css("display", "none")
                        }
                        fillbrand(comText);
                    }
                    /* checkInput();*/
                } else {
                    if ($("#brandName").val() == "") {
                        $("#search_brand").hide();
                    } else {   //有文字输入时获取提示词
                        AutoComplete3("search_brand", "brandName");
                    }
                }
            });

            //点击页面隐藏自动补全提示框
            document.onclick = function (e) {
                var e = e ? e : window.event;
                var tar = e.srcElement || e.target;
                if (tar.id != "brandName") {
                    if ($("#search_brand").is(":visible")) {
                        $("#search_brand").css("display", "none")
                    }
                }
            }
        })

    </script>
</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; " >
        <li><a href="#">询价管理</a></li>
        <li>修改询价信息</li>
    </ul>
</div>

<form name="updateinquiry" action="<%=basePath%>updateinquiry" method="post" class="form-horizontal">
    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input  type="submit" class="btn btn-success" value="修改"/>
            <a class="btn btn-warning" href="<%=basePath%>inquiryview">返回上一级</a>
        </div>
    </div>

    <!--询价信息;客户 品牌 供应商-->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>

    <table style="border-collapse:separate; border-spacing:10px 10px;">
        <tr>
            <td><label >询价单号</label></td>
            <td><input type="text" name="inquiryId"  value="${inquiry.inquiryId}" readonly="readonly"/></td>
            <td><label >询价日期</label></td>
            <td><input type="date" name="inquiryCreatetime"   value="${inquiry.inquiryCreatetime}"  readonly="readonly"/></td>
            <td><label >询价方式</label></td>
            <td><select id="activename1" name="inquiryStyle">
                <option value="0" <c:if test="${inquiry.inquiryStyle==0}">selected</c:if>>邮件</option>
                <option value="1" <c:if test="${inquiry.inquiryStyle==1}">selected</c:if>>人工询价</option>
                </select></td>
            <td><label >发送状态</label></td>
            <td><select id="activename2" readonly="readonly" name="inquirySend">
                <option value="0" <c:if test="${inquiry.inquirySend==0}">selected</c:if>>未发送</option>
                <option value="1" <c:if test="${inquiry.inquirySend==1}">selected</c:if>>已发送</option>
            </select></td>
        </tr>
        <tr>
            <td><label >客户名称</label></td>
            <td><input type="text"  required="required" id="customerName" name="customerName" value="${inquiry.customerName}" placeholder="请输入客户名称"  autocomplete="off" /></td>
            <div id="search_cutomer" name="search_cutomer" ></div>
            <td><label >客户联系人</label></td>
            <td><input type="text" id="customerLinkman" name="customerLinkman" value="${customer.customerLinkman}"placeholder="客户联系人" readonly="readonly"/></td>
            <td><label >供应商编号</label></td>
            <td><input type="text"  id="supplierId" name="supplierId" value="${supplier.supplierId}" placeholder="供应商编号" readonly="readonly"/></td>
            <td><label >业务员</label></td>
            <td><input type="text" name="inquiryMakingpartname"  value="${inquiry.inquiryMakingpartname}" readonly="readonly"/></td>
        </tr>
        <tr>
            <td><label >品牌名称</label></td>
            <td><input type="text"  required="required" id="brandName" name="brandName"  value="${inquiry.brandName}" placeholder="请输入品牌名称" autocomplete="off" /></td>
            <div id="search_brand" name="search_brand" ></div>
            <td><label >回复日期</label></td>
            <td><input type="date" name="inquiryReplytime"  value="${inquiry.inquiryReplytime}" placeholder="请输入回复日期" /></td>


            <td><label >询价语言</label></td>
            <td><select id="activename3" name="inquiryLanguage" >
                <option value="0" <c:if test="${inquiry.inquiryLanguage==0}">selected</c:if>>DE</option>
                <option value="1" <c:if test="${inquiry.inquiryLanguage==1}">selected</c:if>>EN</option>
            </select></td>
            <td><label >询价备注</label></td>
            <td><input type="text" name="inquiryMark"  value="${inquiry.inquiryMark}" placeholder="请输入业务员备注" /></td>
        </tr>
        <tr>
            <td><label >供应商名称</label></td>
            <td><input type="text" required="required" id="supplierName" name="supplierName"  value="${inquiry.supplierName}" placeholder="请输入供应商名称"  autocomplete="off" /></td>
            <div id="search_supplier" name="search_supplier" ></div>

            <td><label >供应商联系人</label></td>
            <td><input type="text" id="supplierInquiryman" name="supplierInquiryman" value="${supplier.supplierInquiryman}"  placeholder="" readonly="readonly"/></td>
            <td><label >供应商邮箱</label></td>
            <td><input type="text" id="supplierInquiryemail" name="supplierInquiryemail"  value="${supplier.supplierInquiryemail}" placeholder="" readonly="readonly"/></td>
            <td><label >供应商特点</label></td>
            <td><input type="text" id="supplierDescription" name="supplierDescription"  value="${supplier.supplierDescription}" placeholder="" readonly="readonly"/></td>

        </tr>
    </table>

    <!--产品信息-->
    <div class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">
        <span class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">产品信息</span>
        <input type="button" value="添加" onclick="addNew();" />
    </div>


<!--添加型号栏-->

        <div class="row" style="padding:15px; padding-top:0px; ">
            <table id="table1" border="1" class="table  table-condensed table-striped">
                <tbody border="1">
                <tr>
                    <th><input type="checkbox" id="allSel"  class="allSel"/></th>
                    <th>外文品名</th>
                    <th>型号</th>
                    <th>数量</th>
                    <th>操作</th>
                </tr>
                </tbody>
                <tbody>
                <c:forEach var="inquiryproduct" items="${inquiryproducts}" varStatus="status" >
                <tr name="counttr">
                    <td><input type="checkbox" name="selectone" id="${inquiryproduct.cpId}" /></td>
                    <td hidden="hidden"><input type='text' id= 'inquiryproducts[${ status.index}].cpId' name="inquiryproducts[${ status.index}].cpId"  value="${inquiryproduct.cpId}"  size='50'/></td>
                    <td> <input type='text' id= 'inquiryproducts[${ status.index}].productDescription' name="inquiryproducts[${ status.index}].productDescription"  value="${inquiryproduct.productDescription}"  size='50'/></td>
                    <td> <input type='text' id= 'inquiryproducts[${ status.index}].productType' name= 'inquiryproducts[${ status.index}].productType'  value="${inquiryproduct.productType}"  size='50'/></td>
                    <td> <input type='text' id= 'inquiryproducts[${ status.index}].inquiryNumber' name= 'inquiryproducts[${ status.index}].inquiryNumber' value="${inquiryproduct.inquiryNumber}"  size='50'/></td>
                    <td><input type='button' value='删除' onclick='delRow(this);' /></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>



</form>

</body>
</html>
