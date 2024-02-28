package com.b66k.www.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = {"com.b66k.www"}) // com.myweb.www 밑에 있는 패키지에서 다 찾기 (큰 프로젝트는 경로 따로 지정)
@MapperScan(basePackages = {"com.b66k.www.repository"})
public class RootConfig {	
	
	@Autowired
	ApplicationContext applicationcontext;
	

	@Bean //ApllicationContext에 bean으로 등록 어노테이션(있는 라이브러리 => bean 아니면 component)
	public DataSource dataSource() {
		HikariConfig hikariconfig = new HikariConfig(); 
		hikariconfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariconfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/b66k");
		hikariconfig.setUsername("hot6");
		hikariconfig.setPassword("mysql");
		hikariconfig.setMinimumIdle(5); // 최소 유효한 커넥션 수
		
		hikariconfig.setConnectionTestQuery("SELECT now()"); // test 쿼리
		hikariconfig.setPoolName("springHikariCP");

		// 추가되는 부분
		
		// cache 사용 여부에 대한 설정
		hikariconfig.addDataSourceProperty("dataSource.cachePrepStmts", "true");
		
		// mysql 드라이브가 캐시할 statement의 수에 관한 설정 (기본 25)
		hikariconfig.addDataSourceProperty("dataSource.prepStmtCacheSize", "200");
		
		// cache할 sql 구문의 최대 길이
		hikariconfig.addDataSourceProperty("dataSource.prepStmtCacheSqlLimit", "true");
		
		// 서버에서 지원받는 설정이 있다면 허용할지에 대한 설정
		hikariconfig.addDataSourceProperty("dataSource.useServerPrepStmts", "true");
		
		HikariDataSource hikariDataSource = new HikariDataSource(hikariconfig);
		return hikariDataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlFactoryBean = new SqlSessionFactoryBean();
		sqlFactoryBean.setDataSource(dataSource());
		//설정 사항이 저장되어있는 경로
		sqlFactoryBean.setConfigLocation(
				applicationcontext.getResource("classpath:/MybatisConfig.xml"));
		sqlFactoryBean.setMapperLocations(
				applicationcontext.getResources("classpath:/Mappers/*.xml"));
		return (SqlSessionFactory)sqlFactoryBean.getObject();
		
	}
	
	
}

