
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
    #pId,  #start1,#end1,#orderType {
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


                    <label>平台名称</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="contrller" id="pId">
                            <option value="">平台名称</option>

                        </select>
                    </div>

                    <label>代理商姓名</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="text" name="username" placeholder="代理商姓名" autocomplete="off" class="layui-input" id="userName">
                    </div>

                    <label>排序方式</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="contrller" id="orderType">
                            <option value="DESC">交易额从高到低</option>
                            <option value="ASC">交易额从低到高</option>
                        </select>
                    </div>
                    <br>
                    <label >报表日期</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="开始日期" name="start" id="start1"></div>至
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="结束日期" name="end" id="end1"></div>
                    <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                        <button id="a" class="layui-btn-primary">清除数据</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 5px">



                    <button class="layui-btn " id="btn1" onclick="xadmin.open('录入代理商信息','/addAgent',1500,1000)"><i class="layui-icon"></i>录入代理商信息</button>
                    <button class="layui-btn" id="btn2"  onclick="xadmin.open('导入Excel','/importExcel1',600,400)"><i class="layui-icon"></i>批量导入</button>
                    <button class="layui-btn" id="btn3"  onclick="tiaozhuan()" ><i class="layui-icon-export"></i> 导出EXCEL</button>
                    <div class="layui-card-body layui-table-body layui-table-main ">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>平台名称</th>
                                <th>代理商姓名</th>
                                <th>归属代理商</th>
                                <th>交易金额(元)</th>
                                <th>机具激活数量(个)</th>
                            </tr>
                            </thead>
                            <tbody class="yi">
                            <%-- <c:if test="${not empty a.data}">
                                 <c:forEach items="${a.data.agentList}" var="a" varStatus="i">
                                     <tr>
                                         <td>${a.id}</td>
                                         <td>${a.pname}</td>
                                         <td>${a.name}</td>
                                         <td>${a.jigou}</td>
                                         <td>${a.level}</td>
                                         <td>${a.userName}</td>
                                         <td>${a.registerTime} </td>
                                         <td>${a.phone}</td>
                                         <td>${a.IDcard}</td>
                                         <td>${a.bankCard}</td>
                                         <td>${a.source}</td>
                                         <td>${a.importDate}</td>
                                         <td><a href="javascript:updateSale()">修改</a>|<a href="javascript:del(${a.id})">删除</a></td>
                                     </tr>
                                 </c:forEach>
                             </c:if>--%>

                            </tbody>
                        </table>
                    </div>
                    <div class="layui-card-body ">
                        <div class="page">
                            <div>
                                <a class="prev" href="javascript:prePage()">&lt;&lt;</a>
                                <a class="num" href="javascript:firstPage()">1</a>
                                <a class="current" href="javascript:secondPage()">2</a>
                                <a class="num" href="javascript:thirdPage()">3</a>
                                <a class="next" href="javascript:nextPage()">&gt;&gt;</a>
                            </div>
                            <span>
                               总交易金额：<span id="money"></span>
                             总激活数量：<span id="jiju"></span>个
                             </span>
                            <br>
                            <span>
                                当前页：<span id="curPage"></span>
                             /共<span id="totalPageCount"></span>页
                             </span>
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

        //平台
        $.ajax({
            url:"platform/listPlatform",
            type:"get",
            success:function (result) {
                $(result).each(function () {
                    $("#pId").append("<option value='"+this.id+"'>"+this.name+"</option> ")
                })
            }
        })
        //
        var orderType=$("#orderType").val();
        var param={};
        param.orderType=orderType;
        param.curPage=1;
        param.pageSize=10;
        $.ajax({
            url: "Agenttb",
            type: "get",
            data:param,
            dataType:"json",
            success: function (result) {
                queryList(param);
            }
        })
        //清除数据
        $("#a").click(function () {
            var name=$("#userName").val("");
            var pId=$("#pId").val("");
            var startTime=$("#start1").val("");
            var endTime=$("#end1").val("");
        })

        //点击查询
        $("#chaxun").click(function () {
            var name=$("#userName").val();
            var pId=$("#pId>option:selected").val();
            var orderType=$("#orderType").val();
            var startTime=$("#start1").val();
            var endTime=$("#end1").val();
            var param={};
            param.orderType=orderType;
            param.name=name;
            param.pId=pId;
            param.curPage=1;
            param.pageSize=10;
            param.startTime=startTime;
            param.endTime=endTime;
            queryList(param);
        })
    })

    //方法
    function queryList(param) {

        $.ajax({
            url:"Agenttb",
            type:"get",
            data:param,
            dataType:"json",
            success:function (result) {
                alert(JSON.stringify(result));
                $(".yi").html("");
                $(result.baobiaoList).each(function () {

                    $(".yi").append(
                        "<tr>" +
                        "<td>" + this.xuhao + "</td>" +
                        "<td>" + this.pname + "</td>" +
                        "<td>" + this.aname + "</td>" +
                        "<td>" + this.juishu + "</td>" +
                        "<td> " + this.tmoney + "</td>" +
                        "<td>" + this.jihuo + "</td>" +
                        "</tr>"
                    )
                })
                    $("#money").html(result.money);
                    $("#jiju").html(result.jiju2);
                $("#curPage").html(result.curPage);
                $("#totalPageCount").html(result.totalPageCount);
            },error:function (result) {
                alert("error"+result);
            }

            })

    }


    //首页
    function firstPage() {
        var name=$("#userName").val();
        var pId=$("#pId>option:selected").val();
        var orderType=$("#orderType").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var param={};
        param.name=name;
        param.pId=pId;
        param.orderType=orderType;
        param.startTime=startTime;
        param.endTime=endTime;
        param.curPage=1;
        param.pageSize=10;
        queryList(param);
    }
    //第二页
    function secondPage() {
        var name=$("#userName").val();
        var pId=$("#pId>option:selected").val();
        var orderType=$("#orderType").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var totalPageCount=$("#totalPageCount").text();
        if(totalPageCount>=2){
            var param={};
            param.name=name;
            param.pId=pId;
            param.orderType=orderType;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=2;
            param.pageSize=10;
            queryList(param);
        }else {
            alert("总页数为："+totalPageCount+"页");
        }
    }
    //第三页
    function thirdPage() {
        var name=$("#userName").val();
        var pId=$("#pId>option:selected").val();
        var orderType=$("#orderType").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var totalPageCount=$("#totalPageCount").text();
        if(totalPageCount>=3){
            var param={};
            param.name=name;
            param.pId=pId;
            param.orderType=orderType;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=3;
            param.pageSize=10;
            queryList(param);
        }else{
            alert("总页数为："+totalPageCount+"页");
        }
    }
    //上一页
    function prePage() {
        var orderType=$("#orderType").val();
        var name=$("#userName").val();
        var pId=$("#pId>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var curPage=$("#curPage").text();
        if(curPage>1){
            curPage--;
            var param={};
            param.name=name;
            param.pId=pId;
            param.orderType=orderType;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=curPage;
            param.pageSize=10;
            queryList(param);
        }else {
            alert("已经是第一页了");
        }
    }
    //下一页
    function nextPage() {
        var orderType=$("#orderType").val();
        var name=$("#userName").val();
        var pId=$("#pId>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var curPage=$("#curPage").text();
        var totalPageCount=$("#totalPageCount").text();
        if(parseInt(curPage)<parseInt(totalPageCount)){
            curPage++;
            var param={};
            param.name=name;
            param.pId=pId;
            param.orderType=orderType;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=curPage;
            param.pageSize=10;
            queryList(param);
        }else{
            alert("已经是最后一页啦！");
        }
    }



</script>

</html>