<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
    #level {
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

    #btn1,#btn2,#btn3{
        height: 40px;
        width: 180px;
        border-radius: 10px;

        margin: 10px;

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


                        <label>用户姓名</label>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="代理商姓名" autocomplete="off" class="layui-input" id="userName">
                        </div>

                        <label>归属代理商</label>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="归属代理商" autocomplete="off" class="layui-input" id="aname">
                        </div>

                        <label>代理级别</label>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="contrller" id="level">
                                <option value="">全部</option>
                                <option value="0">总部</option>
                                <option value="1">一级</option>
                                <option value="2">二级</option>
                            </select>
                        </div>
                        <br>
                        <label>联系电话</label>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="电话号码" autocomplete="off" class="layui-input" id="phone">
                        </div>


                        <div class="layui-input-inline layui-show-xs-block">
                            <button class="layui-btn" id="chaxun">查询</button>
                            <button id="a" class="layui-btn-primary">清除数据</button>
                        </div>




                    <hr class="layui-bg-gray" style="height: 5px">



                    <button class="layui-btn " id="btn1" onclick="xadmin.open('录入用户信息','/uadd1')"><i class="layui-icon"></i>新增用户</button>
                    <button class="layui-btn" id="btn2"  onclick="xadmin.open('导入Excel','/importExcel2',600,200)"><i class="layui-icon"></i>批量导入</button>
                    <button class="layui-btn" id="btn3"  onclick="tiaozhuan()" ><i class="layui-icon-export"></i> 导出EXCEL</button>
                    <div class="layui-card-body layui-table-body layui-table-main ">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>用户姓名</th>
                                <th>归属机构</th>
                                <th>角色名称</th>
                                <th>机构级别</th>
                                <th>创建时间</th>
                                <th>联系电话</th>
                                <th>操作</th>
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
        $.ajax({
            url:"ufenye",
            type:"get",
            dataType:"json",
            success:function (result) {
                queryList("");
            }
        })

//清除数据
        $("#a").click(function(){
            var username=$("#userName").val("");
            var aname=$("#aname").val("");
            var level=$("#level").val("");
            var phone=$("#phone").val("");
        })


        //
        $("#chaxun").click(function () {
            var username=$("#userName").val();
            var aname=$("#aname").val();
            var level=$("#level option:selected").val();
            var phone=$("#phone").val();
            var param={};
            param.curPage=1;
            param.aname=aname;
            param.level=level;
            param.phone=phone;
            param.username=username;
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
            url:"ufenye",
            type:"get",
            data:param,
            dataType:"json",
            success:function (result) {
                $(".yi").html("");
                $(result.userInfoList).each(function () {
                    $(".yi").append(
                        "<tr>"+
                        "<td>"+this.id+"</td>"+
                        "<td>"+this.username+"</td>"+
                        "<td>"+this.oname+"</td>"+
                        "<td>"+this.level+"</td>"+
                        "<td>"+this.rname+"</td>"+
                        "<td>"+this.registerTime+"</td>"+
                        "<td>"+this.phone+"</td>"+

                        /*" <td ><a onclick='updateInfo(\""+this.id+"\")'  >编辑|</a>"+*/
                        " <td ><button class='layui-btn layui-btn-warm layui-btn-radius' onclick='xadmin.open(\"编辑用户信息\",\"/uup1?id="+this.id+"\")'>编辑</button>"+
                        " <button class='layui-btn layui-btn-danger layui-btn-radius' onclick='xadmin.open(\"重置密码\",\"/mima?id="+this.id+"\")' >重置密码</button></td>"+
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
        var username=$("#userName").val();
        var aname=$("#aname").val();
        var level=$("#level option:selected").val();
        var phone=$("#phone").val();
        var param={};
        param.aname=aname;
        param.level=level;
        param.phone=phone;
        param.username=username;
        param.curPage=1;
        queryList(param);
    }
    //第二页
    function secondPage() {
        var username=$("#userName").val();
        var aname=$("#aname").val();
        var level=$("#level option:selected").val();
        var phone=$("#phone").val();
        var totalPageCount=$("#totalPageCount").text();
        if(totalPageCount>=2){
            var param={};
            param.aname=aname;
            param.level=level;
            param.phone=phone;
            param.username=username;
            param.curPage=2;
            queryList(param);
        }else {
            alert("总页数为："+totalPageCount+"页");
        }
    }
    //第三页
    function thirdPage() {
        var username=$("#userName").val();
        var aname=$("#aname").val();
        var level=$("#level option:selected").val();
        var phone=$("#phone").val();
        var totalPageCount=$("#totalPageCount").text();
        if(totalPageCount>=3){
            var param={};
            param.aname=aname;
            param.level=level;
            param.phone=phone;
            param.username=username;
            param.curPage=3;
            queryList(param);
        }else{
            alert("总页数为："+totalPageCount+"页");
        }
    }
    //上一页
    function prePage() {
        var username=$("#userName").val();
        var aname=$("#aname").val();
        var level=$("#level option:selected").val();
        var phone=$("#phone").val();
        var curPage=$("#curPage").text();
        if(curPage>1){
            curPage--;
            var param={};
            param.aname=aname;
            param.level=level;
            param.phone=phone;
            param.username=username;
            param.curPage=curPage;
            queryList(param);
        }else {
            alert("已经是第一页了");
        }
    }
    //下一页
    function nextPage() {
        var username=$("#userName").val();
        var aname=$("#aname").val();
        var level=$("#level option:selected").val();
        var phone=$("#phone").val();
        var curPage=$("#curPage").text();
        var totalPageCount=$("#totalPageCount").text();
        if(curPage<totalPageCount){
            curPage++;
            var param={};
            param.aname=aname;
            param.level=level;
            param.phone=phone;
            param.username=username;
            param.curPage=curPage;
            queryList(param);
        }else{
            alert("已经是最后一页啦！");
        }
    }


    //导出
    function tiaozhuan() {
        location.href="/exportExcel11";
    }

</script>

</html>