/**
 * Copyright(c) 2018 Sunyur.com, All Rights Reserved.
 * Project: order_center.config 
 * Author: zhanghaolin
 * Createdate: 下午8:33:05
 */
package com.sunyur.purchaser.config;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.sunyur.user.service.UserOrganizationRelQueryService;

/**
 * @Description: Mybatis配置中心
 * @author zhanghaolin
 * @date 2019年6月17日 下午8:33:05   
 */
@Configuration
public class MybatisPluginConfig {

	@Autowired
	private SqlSessionFactory					sqlSessionFactory;
	
	@Autowired
	private UserOrganizationRelQueryService		userOrganizationRelQueryService;

	/**
	 * 	业务表名(如：订单表为order)
	 */
	private String								businessTableName = "purchase_apply_item";
	
	/**
	 * 
	 * @Description: 添加插件
	 * @author zhanghaolin
	 * @date 2019年6月17日 下午8:44:06
	 */
	@PostConstruct
	public void addInterceptor() {
		org.apache.ibatis.session.Configuration configuration = sqlSessionFactory.getConfiguration();
		
		DataAuthStatementHandlerInterceptor statementHandlerInterceptor = new DataAuthStatementHandlerInterceptor(userOrganizationRelQueryService);
		statementHandlerInterceptor.setBusinessTableName(businessTableName);
		
		configuration.addInterceptor(statementHandlerInterceptor);
	}
	
}
