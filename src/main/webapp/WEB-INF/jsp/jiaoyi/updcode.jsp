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
        padding: 0px 0px 0px 10px;
        background: #ffffff;
        border-color: #e6e6e6;

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
    <table>
        <tr >
            <td>归属平台</td>
            <td>
                <select id="pid">
                </select>
            </td>

            <td>归属代理商</td>
            <td><input id="aname"></td>
        </tr>
        <tr>
            <td>商户姓名</td>
            <td><input id="sname"></td>
            <td>商户编号</td>
            <td><input id="sno"></td>
        </tr>

        <tr>
            <td>交易日期</td>
            <td>
                <input  id="tradedate" placeholder="交易日期" >
            </td>
            <td>交易卡号</td>
            <td>  <input id="bankcard" placeholder="请输入交易卡号" ></td>
        </tr>

        <tr>
            <td>交易金额</td>
            <td>   <input id="trademoney" placeholder="请输入交易金额" ></td>
            <td>结算金额</td>
            <td>  <input id="realamount" placeholder="请输入结算金额" ></td>
        </tr>

        <tr>
            <td>手续费</td>
            <td>   <input id="poundage" placeholder="请输入手续费" ></td>
            <td>费率</td>
            <td>   <input id="rate" placeholder="请输入费率" ></td>
        </tr>

        <tr>
            <td>机具SN</td>
            <td>    <input id="posid" placeholder="请输入机具SN" ></td>
        </tr>

        <tr>
            <td><button id="chaxun" class="layui-btn">保存</button></td>
            <td> <button id="chaxun1"  	class="layui-btn layui-btn-primary">取消</button></td>
        </tr>
    </table>


</div>

<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script>
    $(function () {
        /**
         * 下拉列表框渲染数据平台select下拉列表ajax
         */
        $.ajax({
            url:"platform/listPlatform",
            type:"POST",
            dataType:"json",
            success:function (result) {
                $.each(result,function (i,n) {
                    $("#pid").append(
                        "<option value='"+n.id+"'>"+n.name+"</option>"
                    )
                })
            },error:function (p) {
                alert("这是平台下拉列表框错误回调函数");

            }

        })//平台下拉列表框ajax结束

        /*获取到id 信心  根据id查询全部信息*/
        var id= window.location.search.split("id=")[1];
        $.ajax({
            url:"http://localhost:8080/traderecord/byId",
            type:"POST",
            datatype:"json",
            data:{"id":id},
            success:function(data){
                alert(JSON.stringify(data));
                shuju(data);
            }
        });

        $("#chaxun").click(function () {
            if ($("#pid  option:selected").val()==null||$("#pid option:selected").val()=='') {
                alert("请输入归属平台")
                return false;
            }if ($("#tradedate").val()==null||$("#tradedate").val()=='') {
                alert("请输入交易日期")
                return false;
            }if ($("#bankcard").val()==null||$("#bankcard").val()=='') {
                alert("请输入银行卡号")
                return false;
            }if ($("#trademoney").val()==null||$("#trademoney").val()=='') {
                alert("请输入交易金额")
                return false;
            }if ($("#realamount").val()==null||$("#realamount").val()=='') {
                alert("请输入结算金额")
                return false;
            }if ($("#poundage").val()==null||$("#poundage").val()=='') {
                alert("请输入手续费")
                return false;
            }if ($("#rate").val()==null||$("#rate").val()=='') {
                alert("请输入费率")
                return false;
            }if ($("#posid").val()==null||$("#posid").val()=='') {
                alert("请输入机具SN")
                return false;
            }else{

                var mid=$("#mid").val();
                var tradedate=$("#tradedate").val();
                var bankcard=$("#bankcard").val();
                var trademoney=$("#trademoney").val();
                var realamount=$("#realamount").val();
                var poundage=$("#poundage").val();
                var rate=$("#rate").val();
                var posid=$("#posid").val();
                var pid=$("#pid option:selected").val();



                $.ajax({
                    url:"http://localhost:8080/traderecord/updRecord",
                    type:"POST",
                    datatype:"json",
                    data:{
                        "id":id,
                        "pid":pid,
                        "mid":mid,
                        "tradedate":tradedate,
                        "bankcard":bankcard,
                        "trademoney":trademoney,
                        "realamount":realamount,
                        "rate":rate,
                        "posid":posid,
                        "poundage":poundage

                    },
                    success:function (result) {
                        alert(JSON.stringify(result.result))
                        if (result.result==true && result.flag==10 ) {
                            alert("修改成功");
                        } else{
                            if(result.flag==1){
                                alert(result.data);
                            }
                            if(result.flag==2){
                                alert(result.data);
                            }
                            if(result.flag==3){
                                alert(result.data);
                            }
                            if(result.flag==4){
                                alert(result.data);
                            }
                            if(result.flag==5){
                                alert(result.data);
                            }
                            if(result.flag==6){
                                alert(result.data);
                            }
                            if(result.flag==7){
                                alert(result.data);
                            }
                            if(result.flag==8){
                                alert(result.data);
                            }
                            if(result.flag==9){
                                alert(result.data);
                            }
                            alert("修改失败，请重试");
                            if(result.flag==12){
                                location.href="index.jsp";
                            }

                        }
                    },error:function (p) {
                        alert("修改错误回调函数"+p);

                    }
                })
            }
        });

        /**
         * 取消按钮
         */
       $("#chaxun1").click(function () {
            //先得到当前iframe层的索引
           var index = parent.layer.getFrameIndex(window.name);
           parent.layer.close(index)

       })


    })//完成加载事件结束
    function shuju(data) {
        $("#pid").val(data.platformList.id);//归属平台
        $("#aname").val(data.agentList.name);//归属代理商
        $("#sname").val(data.agentList.name);//商户姓名
        $("#sno").val(data.merchantList.merchantNo);//商户编号
       $("#tradedate").val(data.tradedate);//交易日期
       $("#bankcard").val(data.bankcard);//交易卡 号

       $("#trademoney").val(data.trademoney);//交易金额
       $("#realamount").val(data.realamount);//结算金额
       $("#poundage").val(data.poundage);//手续费
       $("#rate").val(data.rate);//费率
       $("#posid").val(data.posid);//机具SN


    }







</script>



</body>

</html>