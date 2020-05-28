
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
    #source,#pingtai,  #startTime,#endTime {
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
                    <%--<h2>交易查询</h2>--%>
                    <%--    <label>公司机构树</label>
                <div class="layui-input-inline layui-show-xs-block">
                        <select id="jigou">
                            <option value="">请选择</option>

                        </select>
                    </div>--%>


                    <label>平台名称</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="pingtai">
                            <option value="">请选择</option>
                        </select>
                    </div>

                    <label>商户姓名</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="sname" placeholder="请输入商户姓名" autocomplete="off" class="layui-input">
                    </div>

                    <label>归属代理商</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="aname" placeholder="请输入归属代理商姓名" autocomplete="off" class="layui-input">
                    </div>

                    <label>数据来源</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select id="source">
                            <option value="">请选择</option>

                            <option value="0">导入</option>
                            <option value="1">批量导入</option>
                            <option value="2">对接</option>
                        </select>
                    </div>
                    <br>


                    <label>商户编号</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input id="merchantNo" placeholder="请输入商户编号" autocomplete="off" class="layui-input">
                    </div>
                    <label >登记日期</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date"  class="layui-input" placeholder="开始日期" id="startTime"></div>至
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="date" class="layui-input" placeholder="结束日期"  id="endTime"></div>
                     <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                    <button class="layui-btn layui-btn-primary" id="a" >清除数据</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 8px">



                    <button class="layui-btn " id="btn1"onclick="xadmin.open('录入交易信息','/addCode')" >录入交易信息</button>
                    <button class="layui-btn" id="btn2"  onclick="xadmin.open('导入Excel','/daoru',600,200)"><i class="layui-icon"></i>批量导入</button>
                    <button class="layui-btn" id="btn3"  onclick="tiaozhuan()" ><i class="layui-icon-export"></i> 导出EXCEL</button>
             <div class="layui-card-body layui-table-body layui-table-main ">
                 <h1 id="h1"></h1>
                      <table class="layui-table layui-form">


                            <thead>
                            <tr style="font-size: 30px">
                                <%-- <th>
                                     <input type="checkbox" name="" lay-skin="primary">
                                 </th>--%>
                                <th>平台名称</th>
                                <th>流水号/交易编号</th>
                                <th>归属代理商</th>
                                <th>商户姓名</th>
                                <th>交易日期</th>
                                <th>交易卡号</th>
                                <th>交易金额</th>
                                <th>结算金额</th>
                                <th>手续费</th>
                                <th>费率</th>
                                <th>机具SN</th>
                                <th>来源</th>
                                <th>操作</th>
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
       /*  var  gname=$("#jigou").val();//公司机构树*/
         var aname =$("#aname").val();//归属代理商
         var  sname=$("#sname").val();//商户姓名
         var  source=$("#source").val();//数据来源
         var  pname=$("#pingtai").val();//平台名字
         var  startTime=$("#startTime").val();//开始时间
         var  endTime=$("#endTime").val();//结束时间
         var merchantNo =$("#merchantNo").val();//商户编号
         $.ajax({
             url:"traderecord/jiaoyiquancha",
             type:'POST',
             dataType:'json',
             data:{
               /*  "gname":gname,*/
                 "aname":aname,
                 "sname":sname,
                 "source":source,
                 "pname":pname,
                 "startTime":startTime,
                 "endTime":endTime,
                 "merchantNo":merchantNo,
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
                            "<td>"+n.platformList.name+"</td>"+//平台名称
                            "<td>"+n.id+"</td>"+//流水号
                            "<td>"+n.agentList.name+"</td>"+//归属代理商
                            "<td>"+n.merchantList.name+"</td>"+//商户姓名
                            "<td> "+n.tradedate+"</td>"+//交易日期
                            "<td>"+n.bankcard+"</td>"+//交易卡号
                            "<td>"+n.trademoney+"</td>"+//交易金额
                            "<td>"+n.realamount+"</td>"+//结算金额
                            "<td>"+n.poundage+"</td>"+//手续费
                            "<td>"+n.rate+'%'+"</td>"+//费率
                            "<td>"+n.posInfoList.posSN+"</td>"+//机具SN
                            "<td>"+n.sourceList.name+"</td>"+//来源
                            "<td>" +"<button class='layui-btn layui-btn-warm layui-btn-radius' " +
                            "onclick='xadmin.open(\"修改信息\",\"/updcode?id="+n.id+"\")'>编辑  </a>"+

                            "<button class='layui-btn layui-btn-danger layui-btn-radius' onclick='shan(\""+n.id+"\")'>删除</a></td>"+
                            "</tr>"
                    )

                    })

                    $('.pageon').html(result.pageon);
                    $('.pages').html(result.pages);
                    $('.count').html(result.count);
                 }


             },error:function (p) {
                alert("查询错误回调函数")
             }
         })

     });//查询条件完成加载事件结束

        //完成加载事件  进入页面先全查显示不携带参数
        $.ajax({
            url:'traderecord/jiaoyiquancha',  //请求地址
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

         /*   var  gname=$("#jigou").val();//公司机构树*/
            var aname =$("#aname").val();//归属代理商
            var  sname=$("#sname").val();//商户姓名
            var  source=$("#source").val();//数据来源
            var  pname=$("#pingtai").val();
            var  startTime=$("#startTime").val();
            var  endTime=$("#endTime").val();
            var merchantNo =$("#merchantNo").val();
            $.ajax({
                url:'traderecord/jiaoyiquancha',
                type:'POST',
                dataType:'json',
                data:{
                /*    "gname":gname,*/
                    "aname":aname,
                    "sname":sname,
                    "source":source,
                    "pname":pname,
                    "startTime":startTime,
                    "endTime":endTime,
                    "merchantNo":merchantNo,
                    "pageon":"1",
                },
                success:function (p) {
                    fenye(p);
                }

            })


        });//首页完成加载事件结束
        //上一页  需要参数  当前页  当前页 减 1 需要先获取 当前页和总页数
        $('.up').click(function () {
            var pageon = parseInt($('.pageon').html());
            var pages = parseInt($('.pages').html());
        /*    var  gname=$("#jigou").val();//公司机构树*/
            var aname =$("#aname").val();//归属代理商
            var  sname=$("#sname").val();//商户姓名
            var  source=$("#source").val();//数据来源
            var  pname=$("#pingtai").val();
            var  startTime=$("#startTime").val();
            var  endTime=$("#endTime").val();
            var merchantNo =$("#merchantNo").val();

            if(pageon>1){
                var m = pageon -1;
                $.ajax({
                    url:'traderecord/jiaoyiquancha',
                    type:'POST',
                    dataType:'json',
                    data:{
                /*        "gname":gname,*/
                        "aname":aname,
                        "sname":sname,
                        "source":source,
                        "pname":pname,
                        "startTime":startTime,
                        "endTime":endTime,
                        "merchantNo":merchantNo,
                        "pageon":m,
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
        /*    var  gname=$("#jigou").val();//公司机构树*/
            var aname =$("#aname").val();//归属代理商
            var  sname=$("#sname").val();//商户姓名
            var  source=$("#source").val();//数据来源
            var  pname=$("#pingtai").val();
            var  startTime=$("#startTime").val();
            var  endTime=$("#endTime").val();
            var merchantNo =$("#merchantNo").val();

            if(pageon<pages){
                var m = pageon+1;
                $.ajax({
                    url:'traderecord/jiaoyiquancha',
                    type:'POST',
                    dataType:'json',
                    data:{
           /*             "gname":gname,*/
                        "aname":aname,
                        "sname":sname,
                        "source":source,
                        "pname":pname,
                        "startTime":startTime,
                        "endTime":endTime,
                        "merchantNo":merchantNo,
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
        /*    var  gname=$("#jigou").val();//公司机构树*/
            var aname =$("#aname").val();//归属代理商
            var  sname=$("#sname").val();//商户姓名
            var  source=$("#source").val();//数据来源
            var  pname=$("#pingtai").val();
            var  startTime=$("#startTime").val();
            var  endTime=$("#endTime").val();
            var merchantNo =$("#merchantNo").val();

            $.ajax({
                url:'traderecord/jiaoyiquancha',
                type:'POST',
                dataType:'json',
                data:{
            /*        "gname":gname,*/
                    "aname":aname,
                    "sname":sname,
                    "source":source,
                    "pname":pname,
                    "startTime":startTime,
                    "endTime":endTime,
                    "merchantNo":merchantNo,
                    "pageon":pages
                },
                success:function (p) {
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
//////////////////////////////////////////////////////////////////////////////////////
        //平台select下拉列表ajax
        $.ajax({
            url:"platform/listPlatform",
            type:"POST",
            dataType:"json",
            success:function (result) {
                $.each(result,function (i,n) {
                    $("#pingtai").append(
                        "<option value='"+n.id+"'>"+n.name+"</option>"
                    )
                })
            },error:function (p) {
                alert("这是平台下拉列表框错误回调函数");

            }

        })//平台下拉列表框ajax结束
////////////////////////////////////////////////////////////////////////////
        /*清除数据*/
        $("#a").click(function () {
     /*       var  gname=$("#jigou").val("");//公司机构树
*/
            var aname =$("#aname").val("");//归属代理商
            var  sname=$("#sname").val("");//商户姓名
            var  source=$("#source").val("");//数据来源
            var  pname=$("#pingtai").val("");//平台名字
            var  startTime=$("#startTime").val("");//开始时间
            var  endTime=$("#endTime").val("");//结束时间
            var merchantNo =$("#merchantNo").val("");//商户编号

        })//清楚数据结束

    });//完成加载事件结束


    ////////分页方法
    function fenye(p) {
        $(".yi").empty();
        $.each(p.list,function (i,n) {
                $('.yi').append(
                    "<tr>"+
                    "<td>"+n.platformList.name+"</td>"+//平台名称
                    "<td>"+n.id+"</td>"+//流水号
                    "<td>"+n.agentList.name+"</td>"+//归属代理商
                    "<td>"+n.merchantList.name+"</td>"+//商户姓名
                    "<td>"+n.tradedate+"</td>"+//交易日期
                    "<td>"+n.bankcard+"</td>"+//交易卡号
                    "<td>"+n.trademoney+"</td>"+//交易金额
                    "<td>"+n.realamount+"</td>"+//结算金额
                    "<td>"+n.poundage+"</td>"+//手续费
                    "<td>"+n.rate+'%'+"</td>"+//费率
                    "<td>"+n.posInfoList.posSN+"</td>"+//机具SN
                    "<td>"+n.sourceList.name+"</td>"+//来源
                    "<td >" +"<button class='layui-btn layui-btn-warm layui-btn-radius' " +
                    "onclick='xadmin.open(\"修改信息\",\"/updcode?id="+n.id+"\")'>编辑  </a>"+
                    "<button class='layui-btn layui-btn-danger layui-btn-radius' onclick='shan(\""+n.id+"\")'>删除</a></td>"+
                    "</tr>"
            )

            $('.pageon').html(p.pageon);
            $('.pages').html(p.pages);
            $('.count').html(p.count);

        })
 }

    /**
     * 删除
     *
     */
    function shan(id) {
        if(confirm("确定要删除吗？")){
            $.ajax({
                url:'traderecord/delId',
                type:"GET",
                data:"id="+id,
                dataType:"json",
                success:function (result) {
                    if(result.result==true && result.flag==1){
                alert("删除成功");
                       location.reload();
                        fenye(p);
                        }else {
                        alert("删除失败");
                    }
                }
            })
        }
   }

    /*跳转到下载EXcel页面*/
    function tiaozhuan() {
        location.href="traderecord/exportExcel";
    }







</script>


</html>