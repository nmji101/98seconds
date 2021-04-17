package com.example.demo;


import com.example.demo.mybatis.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "com.example.demo", annotationClass = Mapper.class)
public class MybatisConfig {

    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(
            DataSource dataSource, ApplicationContext applicationContext) throws IOException {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        factoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/configuration.xml"));

        factoryBean.setTypeAliasesPackage("com.example.demo.api.*.dto");
        factoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mappers/*Mapper.xml"));

        return factoryBean;
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
