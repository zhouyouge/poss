<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        right: -100px;
    }
    #chaxun{

     background: #009688;
    }
    .div{
        position: relative;
        top: 100px;
        right: -500px;

    }

    body{
        background: #ffffff;
    }
</style>

<body>

<div class="div">
    <table  >
        <tr>
            <td>机具编号</td>
            <td>
                <input  id="posId" placeholder="请输入机具编号" value="${posInfo.posId}">
            </td>
        </tr>
        <tr>
            <td>机具SN</td>
            <td>
                <input  id="posSN" placeholder="请输入机具SN" value="${posInfo.posSN}">
            </td>
        </tr>
        <tr>
            <td>总公司入库时间</td>
            <td>
                <input type="date" id="storeDate" placeholder="总公司机具入库时间" value="${posInfo.storeDate}">
            </td>
        </tr>
        <tr>
            <td>归属代理商</td>
            <td>
                <select id="agentId" >
                    <option>请选择代理商</option>
                    <c:forEach items="${agentList}" var="agent">
                        <c:if test="${agent.name==posInfo.agentName}">
                            <option value="${agent.id}" selected>${agent.name}</option>
                        </c:if>
                        <c:if test="${agent.name!=posInfo.agentName}">
                            <option value="${agent.id}">${agent.name}</option>
                        </c:if>
                    </c:forEach>

                </select>
            </td>
        </tr>
        <tr>
            <td>划拨代理商日期</td>
            <td>
                <input type="date" id="transferDate" placeholder="划拨代理商日期" value="${posInfo.transferDate}">
            </td>
        </tr>
        <c:if test="${posInfo.activeStatus}==0">
            <tr>
                <td>激活状态</td>
                <td>
                    <select id="contrller">
                        <option>请选择激活状态</option>
                        <option value="0" selected>未激活</option>
                        <option value="1">已激活</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>激活日期</td>
                <td>
                    <input type="date" id="activeDate" placeholder="激活日期" >
                </td>
            </tr>
        </c:if>
        <c:if test="${posInfo.isStandard==0}">
            <tr>
                <td>达标状态</td>
                <td>
                    <select id="isStandard">
                        <option>请选择达标状态</option>
                        <option value="0" selected>未达标</option>
                        <option value="1">已达标</option>
                    </select>
                </td>
            </tr>
        </c:if>
        <input type="hidden" value="${posInfo.transferAgentId}" id="yuanlai">
        <input type="hidden" value="${posInfo.source}" id="source"/>
        <input type="hidden" value="${posInfo.id}" id="id"/>
        <tr>
            <td><button id="chaxun" class="layui-btn">保存</button></td>
            <td> <button id="chaxun1" 	class="layui-btn layui-btn-primary">取消</button></td>
        </tr>
    </table>

</div>

</body>
<script type="text/javascript" src="../statics/js/jquery-1.12.4.min.js"></script>
<script>
    $(function () {
        $("#chaxun").click(function () {//查询按钮点击完成加载事件
        //获取input框参数
        var posId= $("#posId").val();
        alert(posId+"posId")
        var posSN=$("#posSN").val();
        var storeDate=$("#storeDate").val();
        var agentId=$("#agentId").val();
        alert(agentId);
        var transferDate=$("#transferDate").val();
        var yuanlai=$("#yuanlai").val();
        if (yuanlai==agentId){
            transferDate==null;
        }
        var contrller=$("#contrller").val();
        var activeDate=$("#activeDate").val();
        var isStandard=$("#isStandard").val();
        alert(isStandard);
        var id= $("#id").val();
        var source=$("#source").val();
        $.ajax({
            url:"updatePosInfo",
            type:"POST",
            dataType:"json",
            data:{
                "posId":posId,
                "posSN":posSN,
                "storeDate":storeDate,
                "transferAgentId":agentId,
                "transferDate":transferDate,
                "activeStatus":contrller,
                "activeDate":activeDate,
                "isStandard":isStandard,
                "id":id,
                "source":source,
            },
            success:function (result) {
                if(result.result==true){
                    alert("修改成功")
                }else{
                    alert("修改失败")
                }

            },error:function (p) {
                alert("添加错误回调函数"+p);

            }
        })


    })

        /**
         * 取消按钮
         */
        $("#chaxun1").click(function () {
            //先得到当前iframe层的索引
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index)

        })

})
</script>

</html>