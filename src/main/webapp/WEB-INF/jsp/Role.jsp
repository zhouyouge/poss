
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色设置</title>
    <script type="text/javascript" src="statics/js/jquery-1.12.4.min.js" ></script>
    <style>
        .box{
            position: relative;
            margin: 0 auto;

        }

    </style>
    <script>

    </script>
</head>
<body>
    <div class="box">
        <p>添加角色</p>
        <p><input type="text" class="name"></p>
        <p>功能配置</p>
        <table class="t" border="1">
            <tr>
                <td>模块</td>
                <td>方法</td>
            </tr>
            <tr>
                <th>首页</th>
                <th><input type="checkbox">首页</th>
            </tr>
            <tr>
                <th>交易报表</th>
                <th>
                    <input type="checkbox">图形统计
                    <input type="checkbox">报表展示
                    <input type="checkbox">导出报表
                </th>
            </tr>
            <tr>
                <th>机具报表</th>
                <th>
                    <input type="checkbox">图形统计
                    <input type="checkbox">报表展示
                    <input type="checkbox">导出报表
                </th>
            </tr>
            <tr>
                <th>代理商报表</th>
                <th>
                    <input type="checkbox">图形统计
                    <input type="checkbox">报表展示
                    <input type="checkbox">导出报表
                </th>
            </tr>
            <tr>
                <th>代理商管理</th>
                <th>
                    <input type="checkbox">导出报表
                    <input type="checkbox">批量导入
                    <input type="checkbox">录入代理商
                    <input type="checkbox">表单设置
                    <input type="checkbox">新建导出模板
                    <input type="checkbox">编辑
                    <input type="checkbox">删除
                </th>
            </tr>
            <tr>
                <th>商户管理</th>
                <th>
                    <input type="checkbox">导出报表
                    <input type="checkbox">批量导入
                    <input type="checkbox">录入代理商
                    <input type="checkbox">表单设置
                    <input type="checkbox">新建导出模板
                    <input type="checkbox">编辑
                    <input type="checkbox">删除
                </th>
            </tr>
            <tr>
                <th>交易管理</th>
                <th>
                    <input type="checkbox">导出报表
                    <input type="checkbox">批量导入
                    <input type="checkbox">录入代理商
                    <input type="checkbox">表单设置
                    <input type="checkbox">新建导出模板
                    <input type="checkbox">编辑
                    <input type="checkbox">删除
                </th>
            </tr>
            <tr>
                <th>机具管理</th>
                <th>
                    <input type="checkbox">导出报表
                    <input type="checkbox">批量导入
                    <input type="checkbox">录入代理商
                    <input type="checkbox">表单设置
                    <input type="checkbox">新建导出模板
                    <input type="checkbox">编辑
                    <input type="checkbox">删除
                </th>
            </tr>

            <tr>
                <th>角色设置</th>
                <th>
                    <input type="checkbox">新建角色
                    <input type="checkbox">权限修改
                    <input type="checkbox">删除
                </th>
            </tr>

            <tr>
                <th>用户管理</th>
                <th>
                    <input type="checkbox">新建角色
                    <input type="checkbox">编辑
                    <input type="checkbox">删除
                    <input type="checkbox">重置密码
                </th>
            </tr>

            <tr>
                <th>组织机构数列表</th>
                <th>
                    <input type="checkbox">新建机构
                    <input type="checkbox">批量导入
                    <input type="checkbox">修改
                    <input type="checkbox">禁用
                </th>
            </tr>

            <tr>
                <th>组织机构数管理</th>
                <th>
                    <input type="checkbox">移动到
                    <input type="checkbox">新增用户
                    <input type="checkbox">删除
                </th>
            </tr>
        </table>

        <input type="button" value="确定" class="ok">
        <input type="button" value="取消" class="cancel">
    </div>
</body>
</html>
