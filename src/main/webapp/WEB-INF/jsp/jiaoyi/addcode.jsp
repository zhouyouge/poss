
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
            <table>

                <tr >
                    <td>归属平台</td>
                    <td>
                        <select id="pid">
                            <option>平台名称</option>
                        </select>
                    </td>
                    <td></td>
                    <td>归属代理商姓名</td>
                    <td>
                        <select id="parentagentid">
                            <option value="">请选择</option>
                        </select>
                    </td>

                </tr>


                <tr>
                    <td>商户姓名</td>
                    <td>
                       <select id="mid" >
                           <option value="">请选择</option>
                       </select>
                    </td>

                    <td></td>
                    <td>交易日期</td>
                    <td>
                        <input type="date" id="tradedate" placeholder="交易日期" >
                    </td>
                </tr>




                <tr>
                    <td>交易卡号</td>
                    <td>  <input id="bankcard" placeholder="请输入交易卡号" ></td>
               <td></td>
                    <td>交易金额</td>
                    <td>   <input id="trademoney" placeholder="请输入交易金额" ></td>
                </tr>





                <tr>
                    <td>结算金额</td>
                    <td>  <input id="realamount" placeholder="请输入结算金额" ></td>
               <td></td>
                    <td>手续费</td>
                    <td>   <input id="poundage" placeholder="请输入手续费" ></td>

                </tr>




                <tr>
                    <td>费率</td>
                    <td>   <input id="rate" placeholder="请输入费率" ></td>
                    <td></td>
                    <td>机具SN</td>
                    <td>    <input id="posid" placeholder="请输入机具SN" ></td>
                </tr>
                <tr>
                    <td><button id="chaxun" class="layui-btn">保存</button></td>
                    <td> <button  id ="chaxun1" class="layui-btn layui-btn-primary">取消</button></td>
                </tr>
            </table>


</div>

</body>
<script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
<script>
    $(function () {
        //平台select下拉列表ajax
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
        /////////////////////////////////////////////////////////
        //代理商下拉列表ajax
        $.ajax({
            url:"traderecord/agentList",
            type:"get",
            dataType:"json",
            success:function (result) {
                $.each(result,function (i,n) {
                    $("#parentagentid").append(
                        "<option value='"+n.id+"'>"+n.name+"</option>"
                    )
                })
            },error:function (p) {
                alert("这是平台下拉列表框错误回调函数");

            }

        })//代理商下下拉列表框ajax结束



        /////////////////////////////////////////////////////////
        //商户姓名下拉列表ajax
        $.ajax({
            url:"traderecord/merchantsList",
            type:"get",
            dataType:"json",
            success:function (result) {
                $.each(result,function (i,n) {
                    $("#mid").append(
                        "<option value='"+n.id+"'>"+n.name+"</option>"
                    )
                })
            },error:function (p) {
                alert("这是平台下拉列表框错误回调函数");

            }

        })//商户姓名下拉列表框ajax结束





////////////////////////////////////////////////////////////////////////////
        //查询按钮点击完成加载事件
        $("#chaxun").click(function () {
            //获取input框参数
            var pid= $("#pid").val();
            var parentagentid=$("#parentagentid").val();
            var mid=$("#mid").val();
            var tradedate=$("#tradedate").val();
            var bankcard=$("#bankcard").val();
            var trademoney=$("#trademoney").val();
            var realamount=$("#realamount").val();
            var poundage=$("#poundage").val();
            var rate=$("#rate").val();
            var posid=$("#posid").val();
            if ($("#pid").val()==null||$("#pid").val()=='') {
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


            $.ajax({
                url:"traderecord/addCode",
                type:"POST",
                dataType:"json",
                data:{
                    "pid":pid,
                    "parentagentid":parentagentid,
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
                    if (result.result==true && result.flag==10) {
                        alert("添加成功")
                 /*       location.href="ttt"*/
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
                        alert("添加失败，请重试");
                        if(result.flag==12){
                            location.href="index.jsp";
                        }

                    }
                },error:function (p) {
                    alert("添加错误回调函数"+p);

                }

            })
            }

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