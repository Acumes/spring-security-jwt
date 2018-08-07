package com.htf.common.utils;

import java.util.Random;
import java.util.UUID;

public class UuidGenerateUtil {
    public static String generateUuid(String prefix) {
        StringBuffer sb = new StringBuffer(prefix);
        String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
        sb.append(uuid);
        return sb.toString();
    }

    public static String generateUuid() {
        String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
        return uuid;
    }

    public static String generate30Uuid() {
        String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "").substring(0,30);
        return uuid;
    }


    public static String generate4RandomDigital(){
        int code = new Random().nextInt(10000);
        return String.format("%04d", code);
    }
}
