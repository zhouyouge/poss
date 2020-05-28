package com.kgc.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 日志表实体类
 */
public class    SysLog implements Serializable {
    /**日志id*/
    private String logId;
    /**用户id*/
    private String userId;
    /**模块名称*/
    private String moduleName;
    /**操作*/
    private String operate;
    /**时间*/
    private String time;
    /**类名*/
    private String className;
    /**方法名*/
    private String methodName;
    /**传入参数*/
    private String params;
    /**操作ip*/
    private String ip;


 /*以下为数据库没有的字段*/
    private  String username;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }



    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
