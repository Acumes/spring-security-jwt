package com.htf.controller.vo.response;

import lombok.Data;

@Data
public class IpResponse {
    /**
     * code : 0
     * data : {"ip":"127.0.0.1","country":"XX","area":"","region":"XX","city":"内网IP","county":"内网IP","isp":"内网IP","country_id":"xx","area_id":"","region_id":"xx","city_id":"local","county_id":"local","isp_id":"local"}
     */

    private int code;
    private DataBean data;

    @Data
    public static class DataBean {
        /**
         * ip : 127.0.0.1
         * country : XX
         * area :
         * region : XX
         * city : 内网IP
         * county : 内网IP
         * isp : 内网IP
         * country_id : xx
         * area_id :
         * region_id : xx
         * city_id : local
         * county_id : local
         * isp_id : local
         */

        private String ip;
        private String country;
        private String area;
        private String region;
        private String city;
        private String county;
        private String isp;
        private String country_id;
        private String area_id;
        private String region_id;
        private String city_id;
        private String county_id;
        private String isp_id;

    }
}
