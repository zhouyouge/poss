<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
   #pingtai,  #tradeMoney,#startTime,#endTime {
        height: 30px;
        width: 230.95px;
        padding: 0px 0px 0px 10px;
        background: #ffffff;
        border-color: #e6e6e6;

    }

    table tr:nth-child(odd) {
        background-color: lightcyan;
    }
    .layui-show-xs-block{
        margin: 10px;
        padding: 10px;
    }
    #chaxun,#a {
        height: 40px;
        width: 100px;
        border-radius: 15px;
        position: relative;
        right: -100px;

    }

    #btn1,#btn2,#btn3{
        height: 40px;
        width: 180px;
        border-radius: 10px;

        margin: 10px;

    }
    #a{
        color: #007DDB;
        margin: 10px;
        position: relative;
        right: -125px;
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
    <script type="text/javascript" src="statics/js/xadmin.js"></script>
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



                 <%--   <label>公司机构树</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="jigou">
                            <option value="">请选择</option>

                        </select>
                    </div>--%>


                    <label>机具品牌</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="pingtai">
                            <option value="">请选择</option>
                        </select>
                    </div>

                    <label >报表日期</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date"  class="layui-input" placeholder="开始日期" id="startTime"></div>至
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="结束日期"  id="endTime"></div>
<br>

                    <label>代理商姓名</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="aname" placeholder="请输入代理商姓名" autocomplete="off" class="layui-input">
                    </div>



                    <label>排序方式</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="tradeMoney">
                            <option value="desc">交易金额从高到低</option>
                            <option value="asc">交易金额从低到高</option>

                        </select>
                    </div>

                    <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                        <button id="a" class="layui-btn-primary" >清除数据</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 8px">




                    <button class="layui-btn " id="btn1" onclick="xadmin.open('录入代理商信息','/addAgent',1500,1000)"><i class="layui-icon"></i>录入代理商信息</button>
                    <button class="layui-btn" id="btn2"  onclick="xadmin.open('导入Excel','/importExcel1',600,400)"><i class="layui-icon"></i>批量导入</button>
                    <button class="layui-btn" id="btn3"  onclick="tiaozhuan()" ><i class="layui-icon-export"></i> 导出EXCEL</button>
                    <div class="layui-card-body layui-table-body layui-table-main ">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <th>平台名称</th>
                                <th>商户姓名</th>
                                <th>归属代理商姓名</th>
                                <th>交易日期</th>
                                <th>费率</th>
                                <th>交易手续费 元</th>
                                <th>交易金额 元</th>
                                <th>结算金额 元</th>

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
</body>
<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script>


        $(function () {
            /////////////////////////////////////////////////////
            //按条件查询
            $("#chaxun").click(function () {//查询按钮点击完成加载事件
    /*            var gname = $("#jigou").val();//公司机构树*/
                var aname = $("#aname").val();//归属代理商
                var tradeMoney=$('#tradeMoney').val();
                var pname = $("#pingtai").val();//平台名字
                var startTime = $("#startTime").val();//开始时间
                var endTime = $("#endTime").val();//结束时间

                $.ajax({
                    url: "traderecord/echarsBaobiao",
                    type: 'get',
                    dataType: 'json',
                    data: {
                  /*      "gname": gname,*/
                        "aname": aname,
                        "orderBy":tradeMoney,
                        "pname": pname,
                        "startTime": startTime,
                        "endTime": endTime,

                        "pageon": "1",
                    },

                    success: function (result) {
                        if (result.list.length == 0) {
                            alert("没有找到相关的记录即将为你返回主页")
                            location.reload();
                            fenye(p);
                        } else {
                            var num =0;
                            var sum=0;
                            $(".yi").empty();
                            $.each(result.list, function (i, n) {
                                num+=n.trademoney;
                                sum+=n.realamount;



                                $('.yi').append(
                                    "<tr>" +
                                    "<td>" + n.platformList.name + "</td>" +//平台名称
                                    "<td>" + n.merchantList.name + "</td>" +//商户姓名
                                    "<td>" + n.agentList.name + "</td>" +//归属代理商


                                    "<td> " + n.tradedate + "</td>" +//交易日期
                                    "<td>" + n.rate + '%' + "</td>" +//费率
                                    "<td>" + n.poundage + "</td>" +//手续费
                                    "<td>" + n.trademoney + "</td>" +//交易金额
                                    "<td>" + n.realamount + "</td>" +//结算金额

                                    "</tr>"
                                )

                            })

                            $('.pageon').html(result.pageon);
                            $('.pages').html(result.pages);
                            $('.count').html(result.count);
                            $(".yi").append(

                                "<tr>" +
                                "<td  colspan=\"4\" align=\"center\">合计</td><td></td><td ></td><td>"+num+"元</td><td>"+sum+"元</td></tr>"
                            )
                        }



                    }, error: function (p) {
                        alert("查询错误回调函数")
                    }
                })

            });//查询条件完成加载事件结束

            //完成加载事件  进入页面先全查显示不携带参数
            var tradeMoney=$('#tradeMoney').val();
            $.ajax({
                url: 'traderecord/echarsBaobiao',  //请求地址
                type: 'get',
                dataType: 'json',
                data: {
                    'pageon': '1',
                    "orderBy":tradeMoney,

                },
                success: function (p) {
                    fenye(p);//调用分页方法
                }
            });

            //首页  需要参数 当前页 1
            $('.first').click(function () {

                /*var gname = $("#jigou").val();//公司机构树*/
                var aname = $("#aname").val();//归属代理商
                var tradeMoney=$('#tradeMoney').val();

                var pname = $("#pingtai").val();
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();

                $.ajax({
                    url: 'traderecord/echarsBaobiao',
                    type: 'get',
                    dataType: 'json',
                    data: {
                 /*       "gname": gname,*/
                        "aname": aname,
                        "orderBy":tradeMoney,
                        "pname": pname,
                        "startTime": startTime,
                        "endTime": endTime,

                        "pageon": "1",
                    },
                    success: function (p) {
                        fenye(p);
                    }

                })


            });//首页完成加载事件结束
            //上一页  需要参数  当前页  当前页 减 1 需要先获取 当前页和总页数
            $('.up').click(function () {
                var pageon = parseInt($('.pageon').html());
                var pages = parseInt($('.pages').html());
           /*     var gname = $("#jigou").val();//公司机构树*/
                var aname = $("#aname").val();//归属代理商
                var tradeMoney=$('#tradeMoney').val();

                var pname = $("#pingtai").val();
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();


                if (pageon > 1) {
                    var m = pageon - 1;
                    $.ajax({
                        url: 'traderecord/echarsBaobiao',
                        type: 'get',
                        dataType: 'json',
                        data: {
                      /*      "gname": gname,*/
                            "aname": aname,
                            "orderBy":tradeMoney,
                            "pname": pname,
                            "startTime": startTime,
                            "endTime": endTime,

                            "pageon": m,
                        },
                        success: function (p) {
                            fenye(p);
                        }
                    })
                } else {
                    alert('已经是首页')
                }

            })//上一页完成加载事件结束
            //下一页  需要参数  当前页  当前页 加1 需要先获取 当前页和总页数
            $('.next').click(function () {
                var pageon = parseInt($('.pageon').html());
                var pages = parseInt($('.pages').html());
        /*        var gname = $("#jigou").val();//公司机构树*/
                var aname = $("#aname").val();//归属代理商
                var tradeMoney=$('#tradeMoney').val();
                var pname = $("#pingtai").val();
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();


                if (pageon < pages) {
                    var m = pageon + 1;
                    $.ajax({
                        url: 'traderecord/echarsBaobiao',
                        type: 'get',
                        dataType: 'json',
                        data: {
         /*                   "gname": gname,*/
                            "aname": aname,
                            "orderBy":tradeMoney,
                            "pname": pname,
                            "startTime": startTime,
                            "endTime": endTime,

                            "pageon": m
                        },
                        success: function (p) {
                            fenye(p);
                        }
                    })
                } else {
                    alert("已经是最后一页");
                }
            });//下一页完成加载事件结束
            //尾页 需要参数 总页数
            $('.last').click(function () {
                var pages = parseInt($('.pages').html());
               /* var gname = $("#jigou").val();//公司机构树*/
                var aname = $("#aname").val();//归属代理商

                var tradeMoney=$('#tradeMoney').val();
                var pname = $("#pingtai").val();
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();


                $.ajax({
                    url: 'traderecord/echarsBaobiao',
                    type: 'get',
                    dataType: 'json',
                    data: {
                       /* "gname": gname,*/
                        "aname": aname,
                        "orderBy":tradeMoney,

                        "pname": pname,
                        "startTime": startTime,
                        "endTime": endTime,

                        "pageon": pages
                    },
                    success: function (p) {
                        fenye(p);
                    }

                })

            })//尾页点击事件结束
            ///////////////////////////////////////////////////////////////////////////////////////////////
//公司机构树select下拉列表框ajax
            $.ajax({
                url: "org/listOrg",
                type: "POST",
                dataType: "json",
                success: function (result) {
                    $.each(result, function (i, n) {
                        $("#jigou").append(
                            "<option value='" + n.id + "'>" + n.name + "</option>"
                        )
                    })
                }, error: function (p) {
                    alert("这是机构下拉列表框错误回调函数");

                }

            })//公司机构树select下拉列表框ajax结束
//////////////////////////////////////////////////////////////////////////////////////
            //平台select下拉列表ajax
            $.ajax({
                url: "platform/listPlatform",
                type: "POST",
                dataType: "json",
                success: function (result) {
                    $.each(result, function (i, n) {
                        $("#pingtai").append(
                            "<option value='" + n.id + "'>" + n.name + "</option>"
                        )
                    })
                }, error: function (p) {
                    alert("这是平台下拉列表框错误回调函数");

                }

            })//平台下拉列表框ajax结束
////////////////////////////////////////////////////////////////////////////
            /*清除数据*/
            $("#a").click(function () {
              /*  var gname = $("#jigou").val("");//公司机构树*/

                var aname = $("#aname").val("");//归属代理商
                var tradeMoney=$('#tradeMoney').val("");
                var pname = $("#pingtai").val("");//平台名字
                var startTime = $("#startTime").val("");//开始时间
                var endTime = $("#endTime").val("");//结束时间


            })//清楚数据结束

        });//完成加载事件结束


        ////////分页方法
        function fenye(p) {
            $(".yi").empty();
            var num0 =0;
            var sum=0;
            $.each(p.list, function (i, n) {
                num0+=n.trademoney;
                sum+=n.realamount;
                $('.yi').append(
                    "<tr>" +
                    "<td>" + n.platformList.name + "</td>" +//平台名称
                    "<td>" + n.merchantList.name + "</td>" +//商户姓名
                    "<td>" + n.agentList.name + "</td>" +//归属代理商
                    "<td> " + n.tradedate + "</td>" +//交易日期
                    "<td>" + n.rate  + "%</td>" +//费率
                    "<td>" + n.poundage + "</td>" +//手续费
                    "<td>" + n.trademoney + "元</td>" +//交易金额
                    "<td>" + n.realamount + "元</td>" +//结算金额
                    "</tr>"
                )



                $('.pageon').html(p.pageon);
                $('.pages').html(p.pages);
                $('.count').html(p.count);


            })
            $(".yi").append(

                "<tr>" +
                "<td  colspan=\"4\" align=\"center\">合计</td><td></td><td ></td><td id='zj'>"+num0+"元</td><td id='js'>"+sum+"元</td></tr>"
            )

        }


        /*跳转到下载EXcel页面*/
        function tiaozhuan() {
            location.href = "traderecord/exportExcel";
        }







</script>

</html>