package com.kgc.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 分页实体类
 */
public class Page<T>  implements Serializable {
    private Integer pageon;//当前页
    private  Integer pages;//总页数
    private  Integer count;//总记录数
    private List<T> list ;//每个页数里面的内容

    public Integer getPageon() {
        return pageon;
    }

    public void setPageon(Integer pageon) {
        this.pageon = pageon;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
