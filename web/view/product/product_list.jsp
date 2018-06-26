<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../../js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../js/bootstrap.min.js"></script>
</head>

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">产品管理</a></li>
        <li>查询产品</li>
    </ul>
</div>
<form class="form-inline">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="activename">产品型号：</label>
        <input type="email" class="form-control" id="activename" placeholder="请输入产品型号">
      </div>

    <input type="button"   class="btn btn-danger"     value="查询"/>
    <a  class="btn btn-success"  href="product_add.html">添加产品</a>
    
</div>
<div class="row" style="padding:15px; padding-top:0px; ">
	<table class="table  table-condensed table-striped">
    	<tr>
        	<th>编号</th>
            <th>品牌</th>
            <th>型号</th>
            <th>中文品名</th>
            <th>外文品名</th>
            <th>清关品名</th>
            <th>关税</th>
            <th>是否正式产品</th>
            <th>新增业务员</th>
            <th>操作</th>
        </tr>
       	<tr>
        	<td>1001</td>
            <td>nike</td>
            <td>空军一号</td>
            <td>篮球鞋</td>
            <td>xiezi</td>
            <td>鞋子</td>
            <th>0.1</th>
            <th>是</th>
            <th>徐张悦</th>
            <th>
            <a href="product_update.html">修改</a>
            <a href="">删除</a>
            </th>
        </tr>
        <tr>
            <td>1002</td>
            <td>nike</td>
            <td>空军二号</td>
            <td>篮球鞋</td>
            <td>xiezi</td>
            <td>鞋子</td>
            <th>0.15</th>
            <th>是</th>
            <th>徐张悦</th>
            <th>
                <a href="product_update.html">修改</a>
                <a href="">删除</a>
            </th>
        </tr>


    </table>
</div>
</form>
</body>
</html>