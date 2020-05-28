
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    #pingtai, #startTime,#endTime {
        height: 37.99px;
        width: 230.95px;
        padding: 0px 0px 0px 10px;
        background: #ffffff;
        border-color: #e6e6e6;

    }

    #chaxun,#a {
        height: 40px;
        width: 100px;
        border-radius: 15px;
        position: relative;
        right: -100px;

    }
    #a{
        color: #007DDB;
        margin: 10px;
        position: relative;
        right: -125px;
    }
    a{
        align-content: center;
    }
    #title{
        align-content: center;
        position: relative;
        right: -500px;
        font-size: 25px;
        background: #ffffff;
    }
    .layui-card-body {
         position: relative;
        padding: 10px 15px;
         line-height: 1px;
    }
   #body{
        background: #ffffff;
    }
</style>
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

    <!-- 引入 echarts.js -->
    <script src="statics\js\echarts.js"></script>
</head>
<body id="body">

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body" >
                    <br class="layui-form layui-col-space5">
                <%--    <h2>交易查询</h2>
                    <label>公司机构</label>

                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="jigou">
                            <option value="">请选择</option>

                        </select>
                    </div>--%>


                    <label>机具平台</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="pingtai">
                            <option value="">全部</option>
                        </select>
                    </div>



                    <label>代理商姓名</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="aname" placeholder="请输入归属代理商姓名" autocomplete="off" class="layui-input">
                    </div>

                    <label >报表日期</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date"  class="layui-input" placeholder="开始日期" id="startTime"></div>至
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="结束日期"  id="endTime"></div>
                    <div class="layui-input-inline layui-show-xs-block">

                        <button class="layui-btn" id="chaxun">查询</button>
                        <button id="a" class="layui-btn layui-btn-primary" >清除数据</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<hr class="layui-bg-gray" style="height: 8px">


    <div id="title">所有平台交易量柱状图形展示
    </div>



<div class="layui-row" style="background: #ffffff">
    <div class="layui-col-md9">
        <div id="main"  style="width: 1300px;height:750px; background: #ffffff"></div>
    </div>
    <div class="layui-col-md3">
        <div id="yuan"  style="width: 600px;height:400px;background: #ffffff"></div>
    </div>
    </div>


<!-- 引入 echarts.js -->
<script src="statics\js\echarts.js"></script>
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
               /*  alert(JSON.stringify(result));*/
                var nameList=[];//平台名字
                var qtyList=[];//日期
                var mon=[];//金钱
                var objlist=[];//遍历出的数组



                var qian=[];//计算总交易额

                var arrayList=[];//饼图




                for ( i=0;i<result.length;i++){
                    qian.push(result[i].realamount);

                }
                if(qian.length>0){
                    var zj=sum(qian);
                }else{
                    zj=0;
                }

         $.each(result,function (i,n) {
                     //判断名字是否存在 小于0 就是不存在
                 if(nameList.indexOf(n.platformList.name)<0){
                     nameList.push(n.platformList.name);//平台名称
                 }

                    qtyList.push(n.realamount);//交易金额
                     //判断 日期是否重复 截取字符串按月份排序
                    if(mon.indexOf(n.tradedate.substring(0,7))<0){
                        mon.push(n.tradedate.substring(0,7));//交易日期
                    }


                });//遍历结束



                 //把名字一样的数字放到一个数组了
                var he=[];

                    $.each(nameList,function (i,n) {
                        var lst=result.filter(function (s) { //s为遍历出集合中的每一个元素
                        return   s.platformList.name==n;
                          });



                        arrayList.push({"value":he,"name":nameList[i]});

                    //把分过组的名字在根据日期 分组  把相同日期的放到一起
                    var  money=[];
                    $.each(mon,function (k,m) {
                        var  res= lst.filter(function (p,u) {
                            return p.tradedate.substring(0,7)==m;  //判断两个日期是否相等
                        }).map(function (a) {
                          return   a.realamount; //按名字和日期分组后的金额
                             });
                        //金额根据日期和名字进行合计
                        if(res.length>0){
                            var item=sum(res);
                         }else {
                            item=0;
                        }

                       he= item/zj;//总金额/单一金额
                        money.push(item);




                    });

                    var obj= {      //获得对象
                    name: n,
                    type: 'bar',
                    stack: '总量',
                    label: {
                        show: true,
                        position: 'insideRight'
                    },
                    data: money   //合计后的总金额
                }
            objlist.push(obj); //把对象 添加到数组里面

                    });




                var   option = {
             /*       title: {
                        text: '所有平台交易量柱状图形展示',
                        left:'center'

                    },*/
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    /*标题名称*/
                    legend: {

                        data: nameList  //标题平台名字
                    },
                /*固定写法不用改变*/
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    /*坐标  x 轴  固定写法 不需要改变*/
                    xAxis: {
                        type: 'value'
                    },

                    /*坐标  y 轴*/
                    yAxis: {
                        type: 'category',
                        name:'单位:万元',
                        position: 'left',
                        data: mon       //y轴坐标名称  动态获取数据
                    },
                    series: objlist  //循环遍历每一个对象   遍历每一个数组


                };

                myChart.setOption(option);  //固定写法  开启  echars 图表



















                //第二个图表
                myChart2 = echarts.init(document.getElementById('yuan'));
                var  option2 = {
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b}: {c} ({d}%)'
                    },
                    legend: {
                        orient: 'vertical',
                        left:  '3%',
                        data: nameList
                    },
                    series: [
                        {
                            name: '交易额比例',
                            type: 'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            },
                            labelLine: {
                                show: false
                            },


                            data: arrayList





                        }
                    ]
                };


                // 使用刚指定的配置项和数据显示图表。
                myChart2.setOption(option2);
            }

        })

        //////////////////////////////////////////
        //图表结束条件查询开始
//公司机构树select下拉列表框ajax
        $.ajax({
            url:"org/listOrg",
            type:"POST",
            dataType:"json",
            success:function (result) {
                $.each(result,function (i,n) {
                    $("#jigou").append(
                        "<option value='"+n.id+"'>"+n.name+"</option>"
                    )
                })
            },error:function (p) {
                alert("这是机构下拉列表框错误回调函数");

            }

        })//公司机构树select下拉列表框ajax结束
        //////////////////////////////////////////////////////////////////////////////////////
        //平台select下拉列表ajax
        $.ajax({
            url:"platform/listPlatform",
            type:"POST",
            dataType:"json",
            success:function (result) {
                $.each(result,function (i,n) {
                    $("#pingtai").append(
                        "<option value='"+n.id+"'>"+n.name+"</option>"
                    )
                })
            },error:function (p) {
                alert("这是平台下拉列表框错误回调函数");

            }

        })//平台下拉列表框ajax结束
////////////////////////////////////////////////////////////////////////////
        /*清除数据*/
        $("#a").click(function () {
            var  gname=$("#jigou").val("");//公司机构树
            var aname =$("#aname").val("");//归属代理商
            var  pname=$("#pingtai").val("");//平台名字
            var  startTime=$("#startTime").val("");//开始时间
            var  endTime=$("#endTime").val("");//结束时间


        })//清除数据结束
        //按条件查询开始
        $("#chaxun").click(function () {
            var  gname=$("#jigou").val();//公司机构树
            var aname =$("#aname").val();//归属代理商
            var  pname=$("#pingtai").val();//平台名字
            var  startTime=$("#startTime").val();//开始时间
            var  endTime=$("#endTime").val();//结束时间
            var param={};
            param.gname=gname;
            param.aname=aname;
            param.pname=pname;
            param.startTime=startTime;
            param.endTime=endTime;
            $.ajax({
                url:'traderecord/tubaio',
                type:"GET",
                dataType:"json",
                data:param,
                success:function (result) {
                    var nameList=[];//平台名字
                    var qtyList=[];//日期
                    var mon=[];//金钱
                    var objlist=[];//遍历出的数组



                    var qian=[];//计算总交易额

                    var arrayList=[];//饼图




                    for ( i=0;i<result.length;i++){
                        qian.push(result[i].realamount);

                    }
                    if(qian.length>0){
                        var zj=sum(qian);
                    }else{
                        zj=0;
                    }

                    $.each(result,function (i,n) {
                        //判断名字是否存在 小于0 就是不存在
                        if(nameList.indexOf(n.platformList.name)<0){
                            nameList.push(n.platformList.name);//平台名称
                        }

                        qtyList.push(n.realamount);//交易金额
                        //判断 日期是否重复 截取字符串按月份排序
                        if(mon.indexOf(n.tradedate.substring(0,7))<0){
                            mon.push(n.tradedate.substring(0,7));//交易日期
                        }


                    });//遍历结束



                    //把名字一样的数字放到一个数组了
                    var he=[];

                    $.each(nameList,function (i,n) {
                        var lst=result.filter(function (s) { //s为遍历出集合中的每一个元素
                            return   s.platformList.name==n;
                        });



                        arrayList.push({"value":he,"name":nameList[i]})

                        //把分过组的名字在根据日期 分组  把相同日期的放到一起
                        var  money=[];
                        $.each(mon,function (k,m) {
                            var  res= lst.filter(function (p,u) {
                                return p.tradedate.substring(0,7)==m;  //判断两个日期是否相等
                            }).map(function (a) {
                                return   a.realamount; //按名字和日期分组后的金额
                            });
                            //金额根据日期和名字进行合计
                            if(res.length>0){
                                var item=sum(res);
                            }else {
                                item=0;
                            }

                            he= item/zj;//总金额/单一金额
                            money.push(item);




                        });



                        /*    alert("bili"+bili);*/

                        var obj= {      //获得对象
                            name: n,
                            type: 'bar',
                            stack: '总量',
                            label: {
                                show: true,
                                position: 'insideRight'
                            },
                            data: money   //合计后的总金额
                        }
                        objlist.push(obj); //把对象 添加到数组里面

                    });




                    var   option = {
                        title: {
                            text: '所有平台交易量柱状图形展示'

                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        /*标题名称*/
                        legend: {
                            data: nameList  //标题平台名字
                        },
                        /*固定写法不用改变*/
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        /*坐标  x 轴  固定写法 不需要改变*/
                        xAxis: {
                            type: 'value'
                        },

                        /*坐标  y 轴*/
                        yAxis: {
                            type: 'category',
                            data: mon       //y轴坐标名称  动态获取数据
                        },
                        series: objlist  //循环遍历每一个对象   遍历每一个数组


                    };

                    myChart.setOption(option);  //固定写法  开启  echars 图表

                    //第二个图表
                    myChart2 = echarts.init(document.getElementById('yuan'));
                    var  option2 = {
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b}: {c} ({d}%)'
                        },
                        legend: {
                            orient: 'vertical',
                            left:  '3%',
                            data: nameList
                        },
                        series: [
                            {
                                name: '交易额比例',
                                type: 'pie',
                                radius: ['50%', '70%'],
                                avoidLabelOverlap: false,
                                label: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    label: {
                                        show: true,
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                },
                                labelLine: {
                                    show: false
                                },


                                data: arrayList





                            }
                        ]
                    };


                    // 使用刚指定的配置项和数据显示图表。
                    myChart2.setOption(option2);



                }
            })

        })

    });//完成加载事件结束







</script>

</body>
</html>
