package com.htf.common.config.db;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * @author acumes
 * @date 2018/7/25 14:13
 */
@Configuration
public class DataSourceConfig {

    @Primary
    @Bean(name = "htfDataSource")
    @ConfigurationProperties("spring.datasource.htf")
    public DruidDataSource htfDataSource() {
        return new DruidDataSource();
    }
}
