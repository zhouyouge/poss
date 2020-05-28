<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />


    <script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>

    <link rel="stylesheet" href="statics/css/font.css">
    <link rel="stylesheet" href="statics/css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="statics/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="statics/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <c:if test="${user}==null ">
            localhost.href=index.jsp;
    </c:if>
    <div class="logo">
        <a href="./index.html">数据管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${user.username}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','')">个人信息</a></dd>
                <dd>
                    <a onclick="xadmin.open('切换帐号','')">切换帐号</a></dd>
                <dd>
                    <a href="index.jsp">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="/">前台首页</a></li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a onclick="xadmin.add_tab('首页','head')">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>首页</cite></a>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="">&#xe6b8;</i>
                    <cite>报表统计</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('交易报表','baobiao')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>交易报表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('交易图表','tubiao')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>交易图表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('机具报表','jiju/baobiao')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>机具报表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('代理商报表','agentbaobiao')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>代理商报表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('代理商报表','agenttubiao')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>代理商统计图表</cite></a>
                    </li>


                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="数据管理">&#xe723;</i>
                    <cite>数据管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('代理商管理','/agent')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>代理商管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('商户管理','/mfenye1')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商户管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('交易管理','/jiaoyi')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>交易管理</cite></a>
                    </li>




                    <li>
                        <a onclick="xadmin.add_tab('机具管理','jiju')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>机具管理</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="系统管理">&#xe723;</i>
                    <cite>系统管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('用户管理','/user')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('操作日志','rizhi')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>操作日志</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('机构管理','/jiju/jgs')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>机构管理</cite></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 --><!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
       <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd></dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/main' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<script>//百度统计可去掉
var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>
</html>
