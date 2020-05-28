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


    table tr  {
        border-collapse:collapse;

        font-weight: bold;


    }
    table{

        font-weight: bold;
    }
    input{
        height: 50px;
        width: 500px;
    }
    select{
        height: 50px;
        width: 500px;
        margin: 15px;
    }


    #chaxun{
        height: 50px;
        width: 120px;
        border-radius: 10px;
    }
    #chaxun1{
        height: 50px;
        width: 120px;
        border-radius: 10px;
        margin: 15px;

    }

    input{
        margin: 15px;
    }
    .div{
        position: relative;
        top: 100px;
        right: -500px;
    }
    #body{
        background: #ffffff;
    }

</style>

<body id="body">

<div class="div">
    <table  >

        <tr >
            <td>归属机构</td>
            <td>
                <select id="oId">

                </select>
            </td>
        </tr>

        <tr>
            <td>用户姓名</td>
            <td>
                <input type="text" id="username" >
            </td>
        </tr>

        <tr>
            <td>用户密码</td>
            <td>
                <input type="text" id="password"  >
            </td>
        </tr>

        <tr>
            <td>机构级别</td>
            <td>
                <select id="level">
                    <option value="0">总部</option>
                    <option value="1">一级</option>
                    <option value="2">二级</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>角色名称</td>
            <td>    <select id="rId">
                <c:if test="${not empty role}">
                    <c:forEach items="${role}" var="p">
                        <option value="${p.id}">${p.name}</option>
                    </c:forEach>
                </c:if>
            </select></td>
        </tr>

        <tr>
            <td>联系电话</td>
            <td>   <input id="phone"  ></td>
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
        $.ajax({
            url:"organ",
            type:"get",
            success:function (result) {
                $(result).each(function () {
                    $("#oId").append("<option value='"+this.id+"'>"+this.name+"</option> ")
                })
            }
        })
        $("#chaxun").click(function () {
           var username=$("#username").val();
           var password=$("#password").val();
           var phone=$("#phone").val();
           var roleId=$("#rId option:selected").val();
           var orgId=$("#oId option:selected").val();
           var level=$("#level option:selected").val();
            var param={};
            param.username=username;
            param.password=password;
            param.phone=phone;
            param.roleId=roleId;
            param.orgId=orgId;
            param.level=level;
            param.id=id;
            $.ajax({
                url:"/uupdate",
                type:"post",
                data:param,
                dataType:"json",
                success:function (result) {
                    if(result.result==true && result.flag==1){
                        alert("修改成功");
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
