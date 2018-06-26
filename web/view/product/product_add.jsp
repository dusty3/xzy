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

        <li>添加产品</li>
    </ul>
</div>

<form action="" class="form-horizontal">
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="product_list.html">返回上一级</a>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">产品信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">产品编号</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入产品编号（不用输入，自动生成）"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">品牌编号</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入品牌编号（不用输入，自动生成）"/>
                </div>
            </div>
        </div>
    </div>
    	<!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">品牌名字</label>
                <div class="col-sm-9">
                        <input type="text" name="" class="form-control input-sm" placeholder="请输入品牌名字"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">产品型号</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入产品型号"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">产品描述</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入产品描述"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">中文品名</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入中文品名"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">外文品名</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入外文品名"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">清关品名</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入清关品名"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">报关信息</h5>
   <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">中国关税</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入中国关税"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">中国HS号</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入业务联系电话"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
      <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">德国HS号</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入业务电子邮箱"/>
                </div>
            </div>
        </div>

    </div>
   <!--结束 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">报关参数</h5>
         <!--开始 -->
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">申报要素</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入申报要素"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">申报参数</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入申报参数"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->
    <!--开始 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">原产地</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入原产地"/>
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
            	<label class="col-sm-3 control-label">是否正式产品</label>
                <div class="col-sm-9">
                	<input type="text" name="" class="form-control input-sm" placeholder="请输入是否正式产品"/>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">制单员</label>
                <div class="col-sm-9">
                    <input type="text" name="" class="form-control input-sm" placeholder="请输入制单员（默认是登录业务员）"/>
                </div>
            </div>
        </div>
    </div>
   <!--结束 -->



 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a class="btn btn-warning" href="product_list.html">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
