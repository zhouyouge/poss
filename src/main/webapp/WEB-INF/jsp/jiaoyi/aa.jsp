
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>数据管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="statics/css/font.css">
    <link rel="stylesheet" href="statics/css/xadmin.css">
    <script src="statics/lib/layui/layui.js" charset="utf-8"></script>
    <script src="statics/lib/layui/css/layui.css" charset="utf-8"></script>
    <script src="statics/lib/layui/layui.all.js" charset="utf-8"></script>
    <script type="text/javascript" src="statics/js/xadmin.js"></script>
</head>
<body>

<table id="demo" lay-filter="test" class="layui-table layui-form"></table>
<%--<script src="statics/lib/layui/css/layui.css"></script>
<script src="statics/lib/layui/layui.js"></script>--%>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 800
            ,url: 'traderecord/tubaio'//数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:250, sort: true, fixed: 'left'}
                ,{field: 'pid', title: '用户名', width:150}
                ,{field: 'parentagentid', title: '性别', width:150, sort: true}
                ,{field: 'mid', title: '城市', width:150}
                ,{field: 'tradedate', title: '签名', width: 177}
                ,{field: 'bankcard', title: '积分', width: 150, sort: true}
                ,{field: 'trademoney', title: '评分', width: 150, sort: true}
                ,{field: 'realamount', title: '职业', width: 150}
                ,{field: 'poundage', title: '财富', width: 150, sort: true}
                ,{field: 'rate', title: '财富', width: 150, sort: true}

            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
            return {
                "code": '', //解析接口状态
                "msg": '', //解析提示文本

                "count": res, //解析数据长度
                "data": res //解析数据列表
            };
        }
        //,…… //其他参数
        });

    });


</script>
</body>
</html>
