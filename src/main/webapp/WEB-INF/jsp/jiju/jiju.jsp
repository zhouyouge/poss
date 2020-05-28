<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<style>
    #source,#pt,#isStand,#active,#dls,#posSN,#posId {
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
        align-content: center;
    }
  /*  a{
        align-content: center;
    }*/




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
                        <select id="pt">
                            <option value="">平台名称</option>
                        </select>
                    </div>
                    <label>归属代理商</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="contrller" id="dls">
                            <option value="">归属代理商名称</option>
                        </select>
                    </div>
                    <label>数据来源</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="contrller" id="source">
                            <option value="">请选择数据来源</option>
                            <option value="0">导入</option>
                            <option value="1">批量导入</option>
                            <option value="2">对接</option>
                        </select>
                    </div>
                    <label>激活状态</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="activeStatus" id="active">
                            <option value="">请选择激活状态</option>
                            <option value="0">未激活</option>
                            <option value="1">已激活</option>
                        </select>
                    </div>
                    <br>
                    <label>机具编号</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="text" name="username" placeholder="请输入机具编号" autocomplete="off" class="layui-input" id="posId">
                    </div>
                    <label>机具SN</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="text" name="username" placeholder="请输入机具编号" autocomplete="off" class="layui-input" id="posSN">
                    </div>
                    <label>达标状态</label>
                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="isStandard" id="isStand">
                            <option value="">请选择达标状态</option>
                            <option value="0">未达标</option>
                            <option value="1">已达标</option>
                        </select>
                    </div>

                     <div class="layui-input-inline layui-show-xs-block">
                        <button class="layui-btn" id="chaxun">查询</button>
                    <button id="a" class="layui-btn layui-btn-primary">清除数据</button>
                    </div>
                    <hr class="layui-bg-gray" style="height: 5px">
                    <button class="layui-btn " id="btn1" onclick="xadmin.open('添加机具','/addPosInfo')"><i class="layui-icon"></i>录入交易信息</button>
                    <button class="layui-btn" id="btn2"  onclick="xadmin.open('导入ExcelXXX','jiju/daorujiju',600,200)"><i class="layui-icon"></i>批量导入XXX</button>
                    <button class="layui-btn" id="btn3"  onclick="tiaozhuan()" ><i class="layui-icon-export"></i>导出EXCEL</button>
             <div class="layui-card-body layui-table-body layui-table-main ">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <%-- <th>
                                     <input type="checkbox" name="" lay-skin="primary">
                                 </th>--%>
                                <th>平台名称</th>
                                <th>机具编号</th>
                                <th>机具SN号码</th>
                                <th>入库时间</th>
                                <th>机具划拨归属</th>
                                <th>划拨日期</th>
                                <th>激活状态</th>
                                <th>达标状态</th>
                                <th>来源</th>
                                <th>创建日期</th>
                                <th>可执行操作</th>
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
</div>
</div>
</body>
<script type="text/javascript" src="../statics/js/jquery-1.12.4.min.js" ></script>
<script>

$(function () {//完成加载事件

    $("#chaxun").click(function () {//查询按钮点击完成加载事件
        var  pt=$("#pt").val();//平台
        var dls =$("#dls").val();//归属代理商
        var  source=$("#source").val();//数据来源
        var  isStand=$("#isStand").val();//达标状态
        var  posId=$("#posId").val();//posId
        var  posSN=$("#posSN").val();//posSN
        var  active=$("#active").val();//激活状态

        $.ajax({
            url:"jiju/fenye",
            type:'POST',
            dataType:'json',
            data:{
                "pt":pt,
                "dls":dls,
                "source":source,
                "isStand":isStand,
                "posId":posId,
                "posSN":posSN,
                "active":active,
                "pageon":"1",
            },
            success:function (result) {
                if(result.list.length ==0){
                    alert("没有找到相关的记录即将为你返回主页")
                    location.reload();
                    fenye(result);
                }else{
                    fenye(result);
                }


            },error:function (p) {
                alert("查询错误回调函数")
            }
        })

    });//查询条件完成加载事件结束







    $.ajax({
        url:'jiju/fenye',  //请求地址
        type:'POST',
        dataType:'json',
        data:{'pageon':'1'
        },
        success:function (p) {
            fenye(p);//调用分页方法
        }
    });
    $.ajax({
        url:"jiju/dls",
        type:"get",
        success:function (result) {
            $(result).each(function () {
                $("#dls").append(
                    "<option value="+this.id+">"+this.name+"</option>"
            )
            })

        }
    });
    $.ajax({
        url:"jiju/pt",
        type:"get",
        success:function (result) {
            $(result).each(function () {
                $("#pt").append(
                    "<option value="+this.id+">"+this.name+"</option>"
                )
            })

        }
    })
    //首页  需要参数 当前页 1
    $('.first').click(function () {
        var  pt=$("#pt").val();//平台
        var dls =$("#dls").val();//归属代理商
        var  source=$("#source").val();//数据来源
        var  isStand=$("#isStand").val();//达标状态
        var  posId=$("#posId").val();//posId
        var  posSN=$("#posSN").val();//posSN
        var  active=$("#active").val();//激活状态
        $.ajax({
            url:'jiju/fenye',
            type:'POST',
            dataType:'json',
            data:{'pageon':1, },
            success:function (p) {
                fenye(p);
            }

        })


    });//首页完成加载事件结束
    //上一页  需要参数  当前页  当前页 减 1 需要先获取 当前页和总页数
    $('.up').click(function () {
        var  pt=$("#pt").val();//平台
        var dls =$("#dls").val();//归属代理商
        var  source=$("#source").val();//数据来源
        var  isStand=$("#isStand").val();//达标状态
        var  posId=$("#posId").val();//posId
        var  posSN=$("#posSN").val();//posSN
        var  active=$("#active").val();//激活状态
        var pageon = parseInt($('.pageon').html());
        if(pageon>1){
            var m = pageon -1;
            $.ajax({
                url:'jiju/fenye',
                type:'POST',
                dataType:'json',
                data:{
                    "pt":pt,
                    "dls":dls,
                    "source":source,
                    "isStand":isStand,
                    "posId":posId,
                    "posSN":posSN,
                    "active":active,
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
        var  pt=$("#pt").val();//平台
        var dls =$("#dls").val();//归属代理商
        var  source=$("#source").val();//数据来源
        var  isStand=$("#isStand").val();//达标状态
        var  posId=$("#posId").val();//posId
        var  posSN=$("#posSN").val();//posSN
        var  active=$("#active").val();//激活状态
        var pageon = parseInt($('.pageon').html());
        var pages = parseInt($('.pages').html());
        if(pageon<pages){
            var m = pageon+1;
            $.ajax({
                url:'jiju/fenye',
                type:'POST',
                dataType:'json',
                data:{ "pt":pt,
                    "dls":dls,
                    "source":source,
                    "isStand":isStand,
                    "posId":posId,
                    "posSN":posSN,
                    "active":active,
                    "pageon":m,
                },
                success:function (p) {
                    fenye(p);
                }
            })
        }else{
            alert("已经是最后一页")
        }
    });//下一页完成加载事件结束
    //尾页 需要参数 总页数
    $('.last').click(function () {
        var  pt=$("#pt").val();//平台
        var dls =$("#dls").val();//归属代理商
        var  source=$("#source").val();//数据来源
        var  isStand=$("#isStand").val();//达标状态
        var  posId=$("#posId").val();//posId
        var  posSN=$("#posSN").val();//posSN
        var  active=$("#active").val();//激活状态
        var pages = parseInt($('.pages').html());
        $.ajax({
            url:'jiju/fenye',
            type:'POST',
            dataType:'json',
            data:{ "pt":pt,
                "dls":dls,
                "source":source,
                "isStand":isStand,
                "posId":posId,
                "posSN":posSN,
                "active":active,
                'pageon':pages,},
            success:function (p) {
                fenye(p);
            }

        })

    })
});//完成加载事件结束


////////分页方法
function fenye(p) {

    $(".yi").empty();
    $.each(p.list,function (i,n) {
        $('.yi').append(
                "<tr>"+
                "<td>"+n.platformName+"</td>"+//平台名称
                "<td>"+n.posId+"</td>"+//机具编号
                "<td>"+n.posSN+"</td>"+//机具SN号码
                "<td>"+n.storeDate+"</td>"+//入库时间
                "<td>"+n.agentName+"</td>"+//机具划拨归属
                "<td>"+n.transferDate+"</td>"+//划拨日期
                "<td>"+n.activeName+"</td>"+//激活状态
                "<td>"+n.isStandardName+"</td>"+//达标状态
                "<td>"+n.sourceName+"</td>"+//来源
                "<td>"+n.importDate+"</td>"+//创建日期
                 "<td>" +"<button class='layui-btn layui-btn-warm layui-btn-radius' " +
                    "onclick='xadmin.open(\"修改信息\",\"/jiju/updatePosInfo?id="+n.id+"\")'>编辑  </a>"+

                 "<button class='layui-btn layui-btn-danger layui-btn-radius' onclick='shan(\""+n.id+"\")'>删除</a></td>"+
               /** " <td >" +"<a href='#' onclick='kan("+n.id+")'>编辑|   </a>"+
                " <a href='#' onclick='shan("+n.id+")'>删除</a></td>"+**/

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
            url:'jiju/delId',
            type:"GET",
            data:"id="+id,
            success:function (result) {
                if(result.result==true){
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
function kan(id) {
    alert(id);
    location.href="jiju/updatePosInfo?id="+id;
}
function tiaozhuan() {
    location.href="jiju/exportExcel";
}
</script>

</html>