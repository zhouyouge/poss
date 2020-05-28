package com.kgc.entity;

import java.io.Serializable;

/**
 * 封装结果响应结果集实体类
 */
public class    ResponseResult implements Serializable {

    private boolean result;
    private int flag;
    private Object data;

    public boolean getResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
