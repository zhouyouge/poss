
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
  #startTime,#endTime {
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
        margin: 15px;
        padding: 10px;
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
        margin: 15px;
        position: relative;
        right: -125px;
    }
    a{
        align-content: center;
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
                <div class="layui-card-body" style="height: 100vh;">
                    <br class="layui-form layui-col-space5">


                    <label>功能名称</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="moduleName" placeholder="请输入你要查询的内容" autocomplete="off" class="layui-input">
                    </div>

                    <label>操作名称</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="operate" placeholder="请输入你要查询的内容" autocomplete="off" class="layui-input">
                    </div>




                    <label>操作人</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="username" placeholder="请输入名字" autocomplete="off" class="layui-input">
                    </div>
                    <br>
                    <label >登记日期</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date"  class="layui-input" placeholder="开始日期" id="startTime"></div>至
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="结束日期"  id="endTime"></div>


                    <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                        <button id="a" class="layui-btn layui-btn-primary" >清除数据</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 8px">

                    <div class="layui-card-body layui-table-body layui-table-main ">
                        <h1 id="h1"></h1>
                        <table class="layui-table layui-form">


                            <thead>
                            <tr style="font-size: 30px">
                                <%-- <th>
                                     <input type="checkbox" name="" lay-skin="primary">
                                 </th>--%>
                                    <th>功能名称</th>
                                    <th>操作名称</th>
                                    <th>操作人</th>
                                    <th>操作时间</th>
                                    <th>IP地址</th>

                            </thead>
                            <tbody class="yi">
                            <%--   <input type="checkbox" name="" lay-skin="primary"></td>--%>

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








</body>

<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script>

    $(function () {

        /////////////////////////////////////////////////////
        //按条件查询
        $("#chaxun").click(function () {//查询按钮点击完成加载事件
            var  moduleName=$("#moduleName").val();//公司机构树
            var operate =$("#operate").val();//归属代理商
            var  username=$("#username").val();//商户姓名
            var  startTime=$("#startTime").val();//开始时间
            var  endTime=$("#endTime").val();//结束时间

            $.ajax({
                url:"queryAllSysLogData",
                type:'POST',
                dataType:'json',
                data:{
                    "moduleName":moduleName,
                    "operate":operate,
                    "username":username,
                    "startTime":startTime,
                    "endTime":endTime,
                    "pageon":"1",
                },

                success:function (result) {
                    if(result.list.length ==0){
                        alert("没有找到相关的记录即将为你返回主页")
                        location.reload();
                        fenye(p);
                    }else{
                        $(".yi").empty();
                        $.each(result.list,function (i,n) {
                            $('.yi').append(
                                "<tr>"+
                                "<td>"+n.moduleName+"</td>"+//功能名称
                                "<td>"+n.operate+"</td>"+//操作人
                                "<td>"+n.username+"</td>"+//角色名称
                                "<td>"+n.time+"</td>"+//操作时间

                                "<td>"+n.ip+"</td>"+//ip地址

                                "</tr>"
                            )

                            $('.pageon').html(result.pageon);
                            $('.pages').html(result.pages);
                            $('.count').html(result.count);

                        })

                    }


                },error:function (p) {
                    alert("查询错误回调函数")
                }
            })

        });//查询条件完成加载事件结束


        //完成加载事件  进入页面先全查显示不携带参数
        $.ajax({
            url:'queryAllSysLogData',  //请求地址
            type:'POST',
            dataType:'json',
            data:{'pageon':'1'

            },
            success:function (p) {
                fenye(p);//调用分页方法
            }
        });

        //首页  需要参数 当前页 1
        $('.first').click(function () {
            var  moduleName=$("#moduleName").val();//公司机构树
            var operate =$("#operate").val();//归属代理商
            var  username=$("#username").val();//商户姓名
            var  startTime=$("#startTime").val();//开始时间
            var  endTime=$("#endTime").val();//结束时间
            $.ajax({
                url:'queryAllSysLogData',
                type:'POST',
                dataType:'json',
                data:{
                    "moduleName":moduleName,
                    "operate":operate,
                    "username":username,
                    "startTime":startTime,
                    "endTime":endTime,
                    "pageon":"1"
                },
                success:function (p) {
                    fenye(p);
                }

            })


        });//首页完成加载事件结束
        //上一页  需要参数  当前页  当前页 减 1 需要先获取 当前页
        $('.up').click(function () {
            var pageon = parseInt($('.pageon').html());
            var  moduleName=$("#moduleName").val();//公司机构树
            var operate =$("#operate").val();//归属代理商
            var  username=$("#username").val();//商户姓名
            var  startTime=$("#startTime").val();//开始时间
            var  endTime=$("#endTime").val();//结束时间

            if(pageon>1){
                var m = pageon -1;
                $.ajax({
                    url:'queryAllSysLogData',
                    type:'POST',
                    dataType:'json',
                    data:{
                        "moduleName":moduleName,
                        "operate":operate,
                        "username":username,
                        "startTime":startTime,
                        "endTime":endTime,
                        "pageon":m
                    },
                    success:function (p) {
                        fenye(p);
                    }
                })
            }else{
                alert('已经是首页')
            }

        })//上一页完成加载事件结束
        //下一页  需要参数  当前页  当前页 加1 需要先获取 当前页和总页数
        $('.next').click(function () {
            var pageon = parseInt($('.pageon').html());
            var pages = parseInt($('.pages').html());

            if(pageon<pages){
                var  moduleName=$("#moduleName").val();//公司机构树
                var operate =$("#operate").val();//归属代理商
                var  username=$("#username").val();//商户姓名
                var  startTime=$("#startTime").val();//开始时间
                var  endTime=$("#endTime").val();//结束时间
                var m = pageon+1;
                $.ajax({
                    url:'queryAllSysLogData',
                    type:'POST',
                    dataType:'json',
                    data:{
                        "moduleName":moduleName,
                        "operate":operate,
                        "username":username,
                        "startTime":startTime,
                        "endTime":endTime,
                        "pageon":m
                    },
                    success:function (p) {
                        fenye(p);
                    }
                })
            }else{
                alert("已经是最后一页");
            }
        });//下一页完成加载事件结束
        //尾页 需要参数 总页数
        $('.last').click(function () {
            var pages = parseInt($('.pages').html());
            var  moduleName=$("#moduleName").val();//公司机构树
            var operate =$("#operate").val();//归属代理商
            var  username=$("#username").val();//商户姓名
            var  startTime=$("#startTime").val();//开始时间
            var  endTime=$("#endTime").val();//结束时间
            $.ajax({
                url:'queryAllSysLogData',
                type:'POST',
                dataType:'json',
                data:{
                    "moduleName":moduleName,
                    "operate":operate,
                    "username":username,
                    "startTime":startTime,
                    "endTime":endTime,
                    "pageon":pages
                },
                success:function (p) {
                    alert(p+'这是我的尾页');
                    fenye(p);
                }

            })

        })//尾页点击事件结束
        ///////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////
        /*清除数据*/
        $("#a").click(function () {
            var  moduleName=$("#moduleName").val("");//公司机构树
            var operate =$("#operate").val("");//归属代理商
            var  username=$("#username").val("");//商户姓名
            var  startTime=$("#startTime").val("");//开始时间
            var  endTime=$("#endTime").val("");//结束时间

        })//清楚数据结束

    });//完成加载事件结束


    ////////分页方法
    function fenye(p) {
        $(".yi").empty();
        $.each(p.list,function (i,n) {
            $('.yi').append(
                "<tr>"+
                "<td>"+n.moduleName+"</td>"+//功能名称
                "<td>"+n.operate+"</td>"+//操作人
                "<td>"+n.username+"</td>"+//角色名称
                "<td>"+n.time+"</td>"+//操作时间

                "<td>"+n.ip+"</td>"+//ip地址

                "</tr>"
            )

            $('.pageon').html(p.pageon);
            $('.pages').html(p.pages);
            $('.count').html(p.count);

        })
    }







</script>


</html>