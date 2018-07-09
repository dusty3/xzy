<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery-ui.js"></script>




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

<script>
    function SendForm () {

        document.querycustomer.submit();

    }
</script>
<style>
    #auto_div {
        position: absolute;
        z-index: 999;
        left: 80px;
        top: 75px;
        border: 1px solid #74c0f9;
        display: none;
        background: #FFF;
    }

</style>

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">客户管理</a></li>
        <li>查询客户</li>
    </ul>
</div>
<form  action="<%=basePath%>/querycustomer" class="form-inline" method="post" id="querycustomer" name="querycustomer">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="searchcorpname">公司名字：</label>
        <input id="searchcorpname" name="corpname" autocomplete="off"  type="text" class="form-control"  placeholder="请输入公司名字" >
         <div id="auto_div" name="auto_div" ></div>

     </div>


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
                                document.querySelector("#auto_div").style.width = $("#searchcorpname").outerWidth(true) + 'px'; //设置提示框与输入框宽度一致

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
                                    $("#querycustomer").submit();
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
            $(function () {
                //键盘操作
                $("#searchcorpname").keyup(function (event) {
                    //处理键盘操作
                    var myEvent = event || window.event;
                    var keyCode = myEvent.keyCode;
                    if (keyCode == 38 || keyCode == 40) {
                        if (keyCode == 38) { //向上
                            var autoNodes = $("#auto_div").children("div");
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
                            var autoNodes = $("#auto_div").children("div");
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
                            var comText = $("#auto_div").hide().children("div").eq(highlightindex).text();

                            highlightindex = -1;
                            $("#searchcorpname").val(comText);
                            if ($("#auto_div").is(":visible")) {
                                $("#auto_div").css("display", "none")
                            }
                            $("#querycustomer").submit();
                        }
                       /* checkInput();*/
                    } else {
                        if ($("#searchcorpname").val() == "") {
                            $("#auto_div").hide();
                        } else {   //有文字输入时获取提示词
                            AutoComplete("auto_div", "searchcorpname");
                        }
                    }
                });

                //点击页面隐藏自动补全提示框
                document.onclick = function (e) {
                    var e = e ? e : window.event;
                    var tar = e.srcElement || e.target;
                    if (tar.id != "searchcorpname") {
                        if ($("#auto_div").is(":visible")) {
                            $("#auto_div").css("display", "none")
                        }
                    }
                }
            })

    </script>


    <input type="button"   class="btn btn-danger"  onclick="SendForm()"    value="查询"/>
    <a  class="btn btn-success"  href="<%=basePath%>/tocustomerview">添加客户</a>
</div>
</form>
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
</body>
</html>
