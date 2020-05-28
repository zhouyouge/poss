
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
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md9">
            <div id="main" class="layui-input-inline" style="width: 1500px;height:1000px;"></div>
        </div>
        <div class="layui-col-md3">
            <div id="yuan" class="layui-input-inline" style="width: 500px;height:300px;"></div>
        </div>
    </div>
</div>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<script type="text/javascript" src="../statics/js/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    function sum(arr) {
        return arr.reduce(function(prev, curr, idx, arr){
            return prev + curr;
        });
    }
    $(function () {
        $.ajax({
            url: "../jiju/jijubao",
            type: "get",
            success: function (result) {
                var type1=[];
                var type2=[];
                var name=[];
                $(result.list1).each(function () {
                    var param={};
                    param.name=this.name;
                    param.value=this.num;
                    type1.push(param);
                });
                $(result.list2).each(function () {
                    var param={};
                    param.name=this.name;
                    param.value=this.num;
                    type2.push(param);
                });
                $(result.list1).each(function () {
                    var param={};
                    param.name=this.name;
                    name.push(param);
                });
                var option = {
                    title: [{
                        text: '平台划拨'
                    }, {
                        subtext: '平台拥有数量',
                        left: '10%',
                        top: '50%',
                        textAlign: 'center'
                    }, {
                        subtext: '平台激活数量',
                        left: '50%',
                        top: '50%',
                        textAlign: 'center'
                    }],
                    legend: {
                        data: name
                    },
                    series: [{
                        type: 'pie',
                        radius: '25%',
                        center: ['15%', '25%'],
                        data: type1,
                        animation: true,
                        label: {
                            position: 'outer',
                            alignTo: 'none',
                            bleedMargin: 5
                        },
                        left: 0,
                        right: '66.6667%',
                        top: 0,
                        bottom: 0
                    },{
                        type: 'pie',
                        radius: '25%',
                        center: ['50%', '25%'],
                        data: type2,
                        animation: true,
                        label: {
                            position: 'outer',
                            alignTo: 'labelLine',
                            bleedMargin: 5
                        },
                        left: '33.3333%',
                        right: '33.3333%',
                        top: 0,
                        bottom: 0
                    }]
                };
                myChart.setOption(option);
            }
        })
    })

    //让图形自适应 屏幕
    window.onresize=function () {
        myChart.resize();//第一个图表自适应屏幕
    }



</script>
</body>
</html>
