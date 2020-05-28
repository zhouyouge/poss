package com.kgc.entity;

import java.io.Serializable;

/**
 * @author GJT
 * @create 2020/3/31 15:50
 */
public class Source implements Serializable {
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
