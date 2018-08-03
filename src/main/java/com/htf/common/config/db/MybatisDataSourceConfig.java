package com.htf.common.config.db;

import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@MapperScan(basePackages = "com.htf.**.dao", sqlSessionFactoryRef = "mybatisSqlSessionFactory")
public class MybatisDataSourceConfig {

    //事务管理器
    @Bean(name = "mybatisTransactionManager")
    @Primary
    public DataSourceTransactionManager mybatisTransactionManager(@Qualifier("htfDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    //会话工厂
    @Bean(name = "mybatisSqlSessionFactory")
    @Primary
    public SqlSessionFactory mybatisSqlSessionFactory(@Qualifier("htfDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sf = new SqlSessionFactoryBean();
        sf.setDataSource(dataSource);
        sf.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:repository/**/*Mapper.xml"));
        PageInterceptor pageInterceptor = new PageInterceptor();
        Properties properties = new Properties();
        properties.setProperty("helperDialect", "mysql");
        pageInterceptor.setProperties(properties);
        sf.setPlugins(new Interceptor[]{pageInterceptor});
        return sf.getObject();
    }
}

