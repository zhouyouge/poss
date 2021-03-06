<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
    #source,#ag,#pId,#ag ,#start1,#end1{
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
                            <option value="">全部</option>
                            <%--<c:if test="${not empty plat}">
                                <c:forEach items="${plat}" var="p">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </c:if>--%>
                        </select>
                    </div>

                    <label>商户姓名</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="text" name="username" placeholder="商户姓名" autocomplete="off" class="layui-input" id="name">
                    </div>

                    <label>归属代理商</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="ag">
                            <option value="">全部</option>
                          <%--  <c:if test="${not empty ag}">
                                <c:forEach items="${ag}" var="p">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </c:if>--%>
                        </select>

                    </div>
                    <br>
                    <label>数据来源</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="contrller" id="source">
                            <option value="">来源</option>
                            <option value="0">导入</option>
                            <option value="1">批量导入</option>
                            <option value="2">对接</option>
                        </select>
                    </div>

                    <label >登记日期</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="开始日期" name="start" id="start1"></div>至
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="结束日期" name="end" id="end1"></div>
                    <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                        <button id="a" class="layui-btn layui-btn-primary" href="#">清除数据</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 5px">



                    <button class="layui-btn " id="btn1" onclick="xadmin.open('录入商户信息','/madd1')"><i class="layui-icon"></i>录入商户信息</button>
                    <button class="layui-btn" id="btn2"  onclick="xadmin.open('导入Excel','/importExcel3',600,200)"><i class="layui-icon"></i>批量导入</button>
                    <button class="layui-btn" id="btn3"  onclick="tiaozhuan()" ><i class="layui-icon-export"></i> 导出EXCEL</button>
                    <div class="layui-card-body layui-table-body layui-table-main ">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <th>平台名称</th>
                                <th>商户标号</th>
                                <th>商户简称</th>
                                <th>商户姓名</th>
                                <th>商户手机号</th>
                                <th>商户身份证号</th>
                                <th>到账卡号</th>
                                <th>归属代理商</th>
                                <th>数据来源</th>
                                <th>登记日期</th>
                                <th>导入日期</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody class="yi">


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

    //点击查询
    $(function () {
        //机构树
        $.ajax({
            url:"organ",
            type:"get",
            success:function (result) {
                $(result).each(function () {
                    $("#oId").append("<option value='"+this.id+"'>"+this.name+"</option> ")
                })
            }
        })
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
        //代理商
        $.ajax({
            url:"ag",
            type:"get",
            success:function (result) {
                $(result).each(function () {
                    $("#ag").append("<option value='"+this.id+"'>"+this.name+"</option> ")
                })
            }
        })
        //
        $.ajax({
            url:"mfenye",
            type:"get",
            dataType:"json",
            success:function (result) {
                queryList("");
            }
        })
//清除数据
        $("#a").click(function(){
            var name=$("#name").val("");
            var pId=$("#pId").val("");
            var parentAgentId=$("#ag").val("");
            var source=$("#source").val("");
            var oid=$("#oId").val("");
            var startTime=$("#start1").val("");
            var endTime=$("#end1").val("");
        })

        $("#chaxun").click(function () {
            var name=$("#name").val();
            var pId=$("#pId>option:selected").val();
            var parentAgentId=$("#ag option:selected").val();
            var source=$("#source>option:selected").val();
            var oid=$("#oId>option:selected").val();
            var startTime=$("#start1").val();
            var endTime=$("#end1").val();
            var param={};
            param.curPage=1;
            param.name=name;
            param.pid=pId;
            param.aid=parentAgentId;
            param.oid=oid;
            param.source=source;
            param.startTime=startTime;
            param.endTime=endTime;
            queryList(param);
        })
    })

    //
    function queryList(param) {
        if(param==""){
            param={};
            param.curPage=1;
        }else{
            param.pageSize=5;
        }

        $.ajax({
            url:"mfenye",
            type:"get",
            data:param,
            dataType:"json",
            success:function (result) {
                $(".yi").html("");
                $(result.merchantList).each(function () {
                    $(".yi").append(
                        "<tr>"+
                        "<td>"+this.pname+"</td>"+
                        "<td>"+this.merchantNo+"</td>"+
                        "<td>"+this.nickName+"</td>"+
                        "<td>"+this.name+"</td>"+
                        "<td> "+this.phone+"</td>"+
                        "<td>"+this.iDcard+"</td>"+
                        "<td>"+this.bankCard+"</td>"+
                        "<td>"+this.aname+"</td>"+
                        "<td>"+this.sname+"</td>"+
                        "<td>"+this.registerTime+"</td>"+
                        "<td>"+this.importDate+"</td>"+

                        /*" <td ><a onclick='updateInfo(\""+this.id+"\")'  >编辑|</a>"+*/
                        " <td ><button class='layui-btn layui-btn-warm layui-btn-radius' onclick='xadmin.open(\"编辑商户信息\",\"/mupdate1?id="+this.id+"\")'>编辑</button>"+
                        " <button class='layui-btn layui-btn-danger layui-btn-radius' onclick='del(\""+this.id+"\")' >删除</button></td>"+
                        "</tr>"
                    )
                    $("#curPage").html(result.curPage);
                    $("#totalPageCount").html(result.totalPageCount);
                })
            },error:function (result) {
                alert("错误回调函授"+result);

            }
        })
    }
    //首页
    function firstPage() {
        var name=$("#name").val();
        var pId=$("#pId>option:selected").val();
        var parentAgentId=$("#ag option:selected").val();
        var source=$("#source>option:selected").val();
        var oid=$("#oId>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var param={};
        param.name=name;
        param.pid=pId;
        param.aid=parentAgentId;
        param.oid=oid;
        param.source=source;
        param.startTime=startTime;
        param.endTime=endTime;
        param.curPage=1;
        queryList(param);
    }
    //第二页
    function secondPage() {
        var oid=$("#oId>option:selected").val();
        var name=$("#name").val();
        var pId=$("#pId>option:selected").val();
        var parentAgentId=$("#ag option:selected").val();
        var source=$("#source>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var totalPageCount=$("#totalPageCount").text();
        if(totalPageCount>=2){
            var param={};
            param.name=name;
            param.pid=pId;
            param.aid=parentAgentId;
            param.oid=oid;
            param.source=source;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=2;
            queryList(param);
        }else {
            alert("总页数为："+totalPageCount+"页");
        }
    }
    //第三页
    function thirdPage() {
        var oid=$("#oId>option:selected").val();
        var name=$("#name").val();
        var pId=$("#pId>option:selected").val();
        var parentAgentId=$("#ag option:selected").val();
        var source=$("#source>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var totalPageCount=$("#totalPageCount").text();
        if(totalPageCount>=3){
            var param={};
            param.name=name;
            param.pid=pId;
            param.aid=parentAgentId;
            param.oid=oid;
            param.source=source;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=3;
            queryList(param);
        }else{
            alert("总页数为："+totalPageCount+"页");
        }
    }
    //上一页
    function prePage() {
        var oid=$("#oId>option:selected").val();
        var name=$("#name").val();
        var pId=$("#pId>option:selected").val();
        var parentAgentId=$("#ag option:selected").val();
        var source=$("#source>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var curPage=$("#curPage").text();
        if(curPage>1){
            curPage--;
            var param={};
            param.name=name;
            param.pid=pId;
            param.aid=parentAgentId;
            param.oid=oid;
            param.source=source;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=curPage;
            queryList(param);
        }else {
            alert("已经是第一页了");
        }
    }
    //下一页
    function nextPage() {
        var oid=$("#oId>option:selected").val();
        var name=$("#name").val();
        var pId=$("#pId>option:selected").val();
        var parentAgentId=$("#ag option:selected").val();
        var source=$("#source>option:selected").val();
        var startTime=$("#start1").val();
        var endTime=$("#end1").val();
        var curPage=$("#curPage").text();
        var totalPageCount=$("#totalPageCount").text();
        if(parseInt(curPage)<parseInt(totalPageCount)){
            curPage++;
            var param={};
            param.name=name;
            param.pid=pId;
            param.aid=parentAgentId;
            param.oid=oid;
            param.source=source;
            param.startTime=startTime;
            param.endTime=endTime;
            param.curPage=curPage;
            queryList(param);
        }else{
            alert("已经是最后一页啦！");
        }
    }

    /**
     * 删除
     *
     */
    function del(id) {
        if(confirm("确定要删除吗？")){
            $.ajax({
                url:"/mdel",
                type:"GET",
                data:"id="+id,
                dataType:"json",
                success:function (result) {
                    if(result!=""){
                        if(result.result==true && result.flag==1){
                            alert("删除成功");
                            queryList("");
                        }
                    }

                }
            })
        }

    }

    //导出
    function tiaozhuan() {
        location.href="/exportExcel3";
    }

    //修改


    function updateInfo(id){
        alert(id);
        location.href="/upAgent?id="+id;

    }

    /*清除数据*/
    $(function () {


    $("#a").click(function () {
        var oid=$("#oId>option:selected").val("");
        var name=$("#name").val("");
        var pId=$("#pId>option:selected").val("");
        var parentAgentId=$("#ag option:selected").val("");
        var source=$("#source>option:selected").val("");
        var startTime=$("#start1").val("");
        var endTime=$("#end1").val("");
    })
    })
</script>

</html>