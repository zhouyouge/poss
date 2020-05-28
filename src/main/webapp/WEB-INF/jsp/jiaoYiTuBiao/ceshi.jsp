
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="main"  style="width: 1600px;height:800px;"></div>
<script src="statics\js\echarts.js"></script>
<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script>
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
            var riqiList=[];
            $(result).each(function () {
                if(riqiList.indexOf(this.tradedate.substring(0,7))<0){
                    riqiList.push(this.tradedate.substring(0,7));//交易日期
                }
        })
            var qianList=[];
            $(result).each(function () {
             qianList.push(this.realamount);   //交易金额
        })
            alert(JSON.stringify(nameList));
            alert(JSON.stringify(riqiList));
            alert(JSON.stringify(qianList));
var objList=[];
            var obj={
                name: nameList,
                type: 'bar',
                stack: '总量',
                label: {
                    show: true,
                    position: 'insideRight'
                },
                data: qianList
            }
            objList.push(obj);
          var  option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    data: nameList
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'value'
                },
                yAxis: {
                    type: 'category',
                    data: riqiList
                },
                series: objList




            };
            myChart.setOption(option);  //固定写法  开启  echars 图表

        }
    })

})

</script>
</body>
</html>
