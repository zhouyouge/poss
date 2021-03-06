<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">


<head>
    <meta charset="UTF-8">
    <title>数据管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="statics/css/font.css">
    <link rel="stylesheet" href="statics/css/xadmin.css">
    <script type="text/javascript" src="statics/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="statics/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<style>
    input ,select  {
        height: 50px;
        width: 500px;
        margin: 15px;
        border-color: #e6e6e6;
        padding: 0px 0px 0px 10px;
        background: #ffffff;

    }
    #chaxun  , #chaxun1{
        height: 50px;
        width: 120px;
        border-radius: 10px;
        margin: 10px;
        position: relative;
        right: -500px;
    }
    .div{
        position: relative;
        top: 100px;
        right: -100px;

    }

    body{
        background: #ffffff;
    }

</style>

<body>

<div class="div">
    <table  >



        <tr>
            <td>商户编号</td>
            <td>  <input id="merchantNo" placeholder="商户编号" ></td>
            <td>归属代理商</td>
            <td>
                <select id="ag">
                    <%--<c:if test="${not empty ag}">
                        <c:forEach items="${ag}" var="p">
                            <option value="${p.id}">${p.name}</option>
                        </c:forEach>
                    </c:if>--%>
                </select>
            </td>
        </tr>

        <tr>
            <td>商户简称</td>
            <td>   <input id="nickName" placeholder="商户简称" ></td>
            <td>商户姓名</td>
            <td>  <input id="name" placeholder="商户姓名" ></td>
        </tr>

        <tr>
            <td>银行卡号</td>
            <td>   <input id="bankCard" placeholder="银行卡号" ></td>
            <td>手机号</td>
            <td>   <input id="phone" placeholder="手机号" ></td>
        </tr>

        <tr>
            <td>身份证号</td>
            <td>    <input id="IDcard" placeholder="身份证号" ></td>
            <td>数据来源</td>
            <td>
                <select id="source">
                    <option>来源</option>
                    <option value="0">导入</option>
                    <option value="1">批量导入</option>
                    <option value="2">对接</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>注册日期</td>
            <td>
                <input type="date" id="importDate" placeholder="注册日期" >
            </td>
            <td>登记日期</td>
            <td>
                <input type="date" id="registTime" placeholder="代理商登记日期" >
            </td>
        </tr>
        <tr>
            <td><button id="chaxun" class="layui-btn">保存</button></td>
            <td> <button id="chaxun1" 	class="layui-btn layui-btn-primary">取消</button></td>
        </tr>
    </table>


</div>

</body>
<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script>
    $(function () {
        var id=window.location.search.split("id=")[1];
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
        $("#chaxun").click(function () {

            var merchantNo=$("#merchantNo").val();
            var nickName=$("#nickName").val();
            var name=$("#name").val();
            var phone=$("#phone").val();
            var source=$("#source>option:selected").val();
            var parentAgentId=$("#ag option:selected").val();
            var registerTime=$("#registTime").val();
            var IDcard=$("#IDcard").val();
            var bankCard=$("#bankCard").val();
            var importDate=$("#importDate").val();
            var param={};
            param.merchantNo=merchantNo;
            param.nickName=nickName;
            param.name=name;
            param.phone=phone;
            param.source=source;
            param.parentAgentId=parentAgentId;
            param.registerTime=registerTime;
            param.IDcard=IDcard;
            param.bankCard=bankCard;
            param.importDate=importDate;
            param.id=id;
            alert(id);
            $.ajax({
                url:"/madd",
                type:"post",
                data:param,
                dataType:"json",
                success:function (result) {
                    if(result.result==true && result.flag==1){
                        alert("添加成功");
                    }
                },error:function (result) {
                    alert("错误回调函授"+result);

                }
            })
        })

        //点击取消按钮,关闭弹窗
        $("#chaxun1").click(function () {
            //先得到当前iframe层索引
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);

        })
    })
</script>
</html>

