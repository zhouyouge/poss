
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="UTF-8">
        <title>数据管理系统</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../statics/css/font.css">
        <link rel="stylesheet" href="../statics/css/xadmin.css">
        <script src="../statics/lib/layui/layui.js" charset="utf-8"></script>
        <script src="../statics/lib/layui/css/layui.css" charset="utf-8"></script>
        <script src="../statics/lib/layui/layui.all.js" charset="utf-8"></script>
        <script type="text/javascript" src="../statics/js/xadmin.js"></script>
    </head>
    <!-- 引入 echarts.js -->
    <script src="..\statics\js\echarts.js"></script>
    <style>
        td,th {text-align:center}
         table tr:nth-child(odd) {
             background-color: lightcyan;
         }
       #pt,#active,#dls {
            height: 30px;
            width: 230.95px;
            padding: 0px 0px 0px 10px;
            background: #ffffff;
            border-color: #e6e6e6;

        }
        #chaxun,#a,#btn1 {
            height: 40px;
            width: 100px;
            border-radius: 15px;
            position: relative;
            right: -100px;

        }
    </style>
</head>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <br class="layui-form layui-col-space5">

                    <label>平台名称</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="pt">
                            <option value="">平台名称</option>
                        </select>
                    </div>
                    <label>归属代理商</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="contrller" id="dls">
                            <option value="">归属代理商名称</option>
                        </select>
                    </div>
                    <label>代理商级别</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="activeStatus" id="active">
                            <option value="">代理商级别</option>
                            <option value="1">一级代理商</option>
                            <option value="2">二级代理商</option>
                        </select>
                    </div>
                    <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                        <button id="a" class="layui-btn layui-btn-primary">清除数据</button>
                        <button class="layui-btn " id="btn1" onclick="xadmin.open('机具图标','/jiju/tubiao')"><i class="layui-icon"></i>机具图标</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 5px">

                    <div class="layui-card-body layui-table-body layui-table-main ">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr style="font-size: 30px; " >
                                <th>平台名称</th>
                                <th>代理商姓名</th>
                                <th>归属代理商</th>
                                <th>代理商级别</th>
                                <th>机具划拨数量（台）</th>
                                <th>机具激活数量（台）</th>
                                <th>激活比例</th>
                            </tr>
                            </thead>
                            <tbody class="yi">

                            </tbody>
                        </table>
                    </div>
                    <div class="layui-card-body ">

                        <div>
                            <a href="#" class="first">首页</a>&nbsp;
                            <a href="#" class="up">上一页</a>&nbsp;
                            <a href="#" class="next">下一页</a>&nbsp;
                            <a href="#" class="last">末页</a>&nbsp;<span>当前第：</span>
                            <span class="pageon" ></span>
                            <span>页&nbsp;&nbsp;&nbsp;共：</span>
                            <span class="pages" ></span>
                            <span>页</span><span></span>
                            <span class="count"></span>
                            <span>个记录</span>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<script type="text/javascript" src="../statics/js/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(function () {
    $.ajax({
        url:"jijubaobiao",
        type:"get",
        success:function (result) {
            var number=0;
            var number1=0;
            $(result).each(function () {
                number+=this.jijushuliang;
                number1+=this.jijujihuo;
            })
            $(result).each(function () {
                var num = (this.jijujihuo/this.jijushuliang)*100;
                num=num.toFixed(2)
                $(".yi").append(
                    "<tr>"+
                    "<td>"+this.platformName+"</td>"+
                    "<td>"+this.agentName+"</td>"+
                    "<td>"+this.name+"</td>"+
                    "<td>"+this.levelName+"</td>"+
                    "<td>"+this.jijushuliang+"</td>"+
                    "<td>"+this.jijujihuo+"</td>"+
                    "<td>"+num+"%</td>"+
                    "</tr>"
                )
            })
            var num1=(number1/number)*100;
            num1=num1.toFixed(2);
            $(".yi").append(
                "<tr><td colspan='4'>合计</td>" +
                "<td>"+number+"</td>" +
                "<td>"+number1+"</td>" +
                "<td>"+num1+"%</td>"+
                "<tr>"
            )
        }
    });
    $.ajax({
        url:"dls",
        type:"get",
        success:function (result) {
            $(result).each(function () {
                $("#dls").append(
                    "<option value="+this.id+">"+this.name+"</option>"
                )
            })

        }
    });
    $.ajax({
        url:"pt",
        type:"get",
        success:function (result) {
            $(result).each(function () {
                $("#pt").append(
                    "<option value="+this.id+">"+this.name+"</option>"
                )
            })

        }
    })
})

</script>
</body>
</html>
