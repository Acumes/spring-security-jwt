package com.htf.common.utils;

import com.alibaba.fastjson.JSON;
import com.htf.controller.vo.response.IpResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class IpUtils {

    public static String getLocalIp() {
        return "127.0.0.1";
    }

    public static IpResponse getPublicIp(String ip) {
        String taobaoIp = "http://ip.taobao.com/service/getIpInfo.php?ip="+ip;
        StringBuilder inputLine = new StringBuilder();
        String read = "";
        URL url = null;
        HttpURLConnection urlConnection = null;
        BufferedReader in = null;
        try {
            url = new URL(taobaoIp);
            urlConnection = (HttpURLConnection) url.openConnection();
            in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
            while ((read = in.readLine()) != null) {
                inputLine.append(read + "\r\n");
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        IpResponse response = JSON.parseObject(inputLine.toString(),IpResponse.class);
        return response;
    }

    public static void main(String[] args) {
//        IpUtils.getPublicIp("114.114.114.114");
        IpUtils.getPublicIp("127.0.0.1");
    }
}
