
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
<style>
    #body{
        background: #ffffff;
    }
    div{
        margin: 20px;
        padding: 10px;
    }
    span{
        color: #ffffff;
        text-align: center;
        display: inline-block;
    }
    h1{
        padding: 10px;
    }




</style>
<body id="body">
<h1>公司最新数据</h1>
<hr class="layui-bg-gray" style="height: 8px">

<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-sm1" >
            <div class="grid-demo grid-demo-bg1">

            </div>
        </div>

        <div class="layui-col-sm2" style="height: 150px; background: #009f95">
            <div class="grid-demo grid-demo-bg1">
                <span>交易额-元</span>
            </div>
        </div>
        <div class="layui-col-sm2" style="height: 150px;background: #3d773d">
            <div class="grid-demo">     <span>库存数-个</span></div>
        </div>
        <div class="layui-col-sm2" style="height: 150px;background: #c7eefe">
            <div class="grid-demo grid-demo-bg1">  <span>机具激活数-个</span></div>
        </div>
        <div class="layui-col-sm2" style="height: 150px;background: #a9dba9">
            <div class="grid-demo">  <span>新增代理-个</span></div>
        </div>

    </div>
</div>
<!-- 引入 echarts.js -->
<script src="statics/js/echarts.js" type="text/javascript"></script>
<div id="main" style="width: 1500px;height:500px;"></div>
<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
    //计算总金额
    function sum(arr) {
        return arr.reduce(function(prev, curr, idx, arr){
            return prev + curr;
        });
    }
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    $(function () {
        $.ajax({
            url:'traderecord/tubaio',
            type:"GET",
            dataType:"json",
            success:function (result) {
                var nameList=[];
                $(result).each(function () {
                    //判断名字是否存在 小于0 就是不存在
                    if(nameList.indexOf(this.platformList.name)<0){
                        nameList.push(this.platformList.name);//平台名称
                    }
                })

                var qianList=[];
                $(result).each(function () {
                    qianList.push(this.realamount);   //交易金额
                })
                option = {
                    xAxis: {
                        type: 'category',
                        data:nameList
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data:qianList,
                        type: 'bar'
                    }]
                };
                myChart.setOption(option);  //固定写法  开启  echars 图表

            }


        })
    })


</script>
</body>
</html>
