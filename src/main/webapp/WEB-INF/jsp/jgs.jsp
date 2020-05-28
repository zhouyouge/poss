
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
        <link rel="stylesheet" href="../statics/css/bootstrap.min.css">
        <link rel="stylesheet" href="../statics/css/custom.css">
        <link rel="stylesheet" href="../statics/css/jquery.jOrgChart.css">
        <link rel="stylesheet" href="../statics/css/prettify.css">
    </head>
    <!-- 引入 echarts.js -->
    <script src="..\statics\js\echarts.js"></script>
    <style>
        /**a {
            text-decoration: none;
            color: #fff;
            font-size: 12px;
        }

        .jOrgChart .node {
            width: 120px;
            height: 50px;
            line-height: 50px;
            border-radius: 4px;
            margin: 0 8px;
        }*/
        #jOrgChart{
            width: 300px;
            float: left;
        }
        #list{
            background: white;
            width: 800px;
            height: 600px;
            float: left;
            left: 500px;
            color: black;
            font-size: 30px;
        }
        #list>table{
            color: black;
        }
        #jOrgChart>ul>li{
            color: black;
        }
    </style>
</head>
<body>
<div id='jOrgChart'></div>
<div id="list">
    <img src="../../statics/images/shuju.png" style="margin: 250px 350px">
</div>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<script type="text/javascript" src="../statics/js/jquery-1.12.4.min.js"></script>
<script src="../statics/js/jquery.jOrgChart.js" type="text/javascript"></script>
<script src="../statics/js/prettify.js" type="text/javascript"></script>
<script type="text/javascript">

        $(function () {
            $.ajax({
                url: "jigoushu",
                type: 'GET',
                success: function (result) {
                    console.log(result)
                    var showlist = $("<ul id='org'></ul>");
                    showall(result.children, showlist);
                    console.log(showlist)
                    $("#jOrgChart").html(showlist);
                    /**$("#org").jOrgChart({
                        chartElement: '#jOrgChart', //指定在某个dom生成jorgchart
                        dragAndDrop: true //设置是否可拖动
                    });*/

                    function showall(result, parent) {

                        $.each(result, function (index, children) {
                            if (children.children.length > 0) {
                                var li = $("<li></li>");
                                if (children.level==0) {
                                    li.append("<a href='@'>" + children.name +
                                        "</a>").append(
                                        "<ul></ul>").appendTo(parent);
                                }else {
                                    li.append("<a href='javascript:void(0)' onclick='getOrgId(\""+this.id+"\")';>" + children.name +
                                        "</a>").append(
                                        "<ul></ul>").appendTo(parent);
                                }

                                //递归显示
                                showall(children.children, $(li).children().eq(1));
                            } else {
                                $("<li></li>").append("<a href='javascript:void(0)' onclick='getOrgId(\""+this.id+"\")';>" +
                                    children.name +
                                    "</a>").appendTo(parent);
                            }
                        });
                    }


                }
            });
        });
        function getOrgId(id) {
            $.ajax({
                url:"../byId",
                type:"get",
                data:"id="+id,
                success:function (result) {
                    alert(JSON.stringify(result))
                    $("#list").html();
                    $("#list").html("<h3>代理商信息</h3>" +
                        "<table><tr><td>代理商姓名</td><td>"+result.name+"</td></tr>" +
                        "<tr><td>归属平台</td><td>"+result.pname+"</td></tr>" +
                        "<tr><td>代理商级别</td><td>"+result.levelName+"</td></tr>" +
                        "<tr><td>代理商手机号</td><td>"+result.phone+"</td></tr>" +
                        "<tr><td>代理商身份证号</td><td>"+result.idcard+"</td></tr>" +
                        "<tr><td>代理商银行卡号</td><td>"+result.bankCard+"</td></tr>" +
                        "<tr><td>登记日期</td><td>"+result.registerTime+"</td></tr></table>")
                }
            })
        }
</script>
</body>
</html>
