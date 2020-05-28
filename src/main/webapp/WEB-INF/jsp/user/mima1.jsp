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



        <tr>
            <td>原密码</td>
            <td>
                <input type="text" id="m1" >
            </td>
        </tr>

        <tr>
            <td>新密码</td>
            <td>
                <input type="text" id="m2"  >
            </td>
        </tr>




        <tr>
            <td>再次输入新密码</td>
            <td>   <input id="m3"  ></td>
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
        function mm(m1,m2,m3) {
            if(m1!=${user.password}){
                alert("原密码输入错误");
                return false;
            }
            if(m2!=m3){
                alert("两次新密码输入的一致");
                return false;
            }
            return true;
        }

        $("#chaxun").click(function () {
            var m1=$("#m1").val();
            var m2=$("#m2").val();
            var m3=$("#m3").val();
            if(mm(m1,m2,m3)){
                var param={};
                param.password=m2;
                param.id=id;
                $.ajax({
                    url:"uupdate",
                    type:"post",
                    data:param,
                    dataType:"json",
                    success:function (result) {
                        if(result.result==true && result.flag==1){
                            alert("密码修改成功,请重新登录");
                            location.href="index.jsp";
                        }
                    }
                })
            }
        })
    })

    //点击取消按钮,关闭弹窗
    $("#chaxun1").click(function () {
        //先得到当前iframe层索引
        var index=parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);

    })

</script>
</html>
