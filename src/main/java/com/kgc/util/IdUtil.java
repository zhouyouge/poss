package com.kgc.util;

import java.util.UUID;

public class IdUtil {

    public static String genPrimaryKey() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
