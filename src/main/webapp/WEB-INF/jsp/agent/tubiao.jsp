

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="statics/js/echarts.js" type="text/javascript"></script>
</head>
<style>
    #body{
        background: #ffffff;
    }
</style>
<body id="body">
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 1500px;height:900px;">

</div>


<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
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
    url: "agenttb1",
    type: "get",
    success: function (result) {
        var namelist = [];
        var jijulist = [];
        var moneylist = [];
      $.each(result.jijuList,function (i,n) {
          jijulist.push(n.jiju);
      })
       $.each(result.moneyList,function (i,n) {

           namelist.push(n.aname);
           moneylist.push(n.tmoney);
       })

        var option = {
            title: {
                text: '前十名代理商业绩展示',
                left: 'center'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    crossStyle: {
                        color: '#999'
                    }
                }
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                left: 'left',
                data: ['交易额', '激活量']
            },
            xAxis: [
                {
                    type: 'category',
                    data: namelist,
                    axisPointer: {
                        type: 'shadow'
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '交易额',
                    min: 0,
                    max: 100000,
                    interval: 10000,
                    axisLabel: {
                        formatter: '{value} 元'
                    }
                },
                {
                    type: 'value',
                    name: '激活量',
                    min: 0,
                    max: 25,
                    interval: 1,
                    axisLabel: {
                        formatter: '{value} 个'
                    }
                }
            ],
            series: [
                {
                    name: '交易额',
                    type: 'bar',
                    data: moneylist,
                },

                {
                    name: '激活量',
                    type: 'line',
                    yAxisIndex: 1,
                    data: jijulist,
                }

            ]

        };
        myChart.setOption(option);
    }
})
})
//让图形自适应屏幕
/*window.onresize=function () {
    myChart.resize();

}*/

</script>
</body>
</html>

