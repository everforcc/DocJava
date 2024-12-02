/**
 * Copyright(c) 2018 Sunyur.com, All Rights Reserved.
 * Project: order_center.config
 * Author: zhanghaolin
 * Createdate: 下午8:35:15
 */
package com.sunyur.purchaser.config;

import com.alibaba.fastjson.JSON;
import com.sunyur.common.base.DataAuthBaseDO;
import com.sunyur.common.pagination.ModelResult;
import com.sunyur.user.model.UserOrganizationRelModel;
import com.sunyur.user.service.UserOrganizationRelQueryService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Statement;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Description: mybatis插件
 * 	<ul>
 * 	  <li>在StatementHandler.update()织入</li>
 * 	</ul>
 *
 * @author zhanghaolin
 * @date 2019年6月17日 下午8:35:15
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "update", args = { Statement.class }) })
public class DataAuthStatementHandlerInterceptor implements Interceptor {

	private final static Logger LOGGER_INFO  	= LoggerFactory.getLogger(DataAuthStatementHandlerInterceptor.class);
    private final static Logger LOGGER_ERROR 	= LoggerFactory.getLogger(DataAuthStatementHandlerInterceptor.class);

    private static final String TABLE_SUFFIX 	= "_data_auth";
    private static final String INSERT			= "insert into ";
    private static final String UPDATE			= "update ";
    private static final String SET				= " set";
    private static final String NULL			= "NULL";
    private static final String PREFIX_KUOHAO	= " (";
    private static final String SUFFIX_KUOHAO	= ") ";
    private static final String DOUHAO 			= ", ";
    private static final String DANYINHAO 		= "'";
    private static final String FENHAO 			= ";";
    private static final String EQUALS 			= "=";


	private UserOrganizationRelQueryService 	userOrganizationRelQueryService;

	/**
	 * 	业务表名(如：订单表为order)
	 */
	private String								businessTableName;

	/**
	 *
	 * @Description: 织入
	 * @author zhanghaolin
	 * @date 2019年6月17日 下午8:38:43
	 * @param invocation
	 * @return
	 * @throws Throwable
	 */
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		Object target = invocation.getTarget();

		Object[] args = invocation.getArgs();
		Statement Statement = (Statement) args[0];

		StatementHandler statementHandler = (StatementHandler) target;
		BoundSql boundSql = statementHandler.getBoundSql();
		Object parameterObject = boundSql.getParameterObject();
		String sql = beautifySql(boundSql.getSql());
		String lowerCaseSql = sql.toLowerCase();

		try {
			return invocation.proceed();
		} finally {
			try {
				// 新增
				if (lowerCaseSql.startsWith(INSERT + businessTableName + PREFIX_KUOHAO)) {
					LOGGER_INFO.info("intercept insert, table is {}.", businessTableName);

					if (parameterObject instanceof Map) {	// 多行插入,parameterObject为业务MODEL List

						@SuppressWarnings("unchecked")
						Map<String, List<Object>> map = (Map<String, List<Object>>) parameterObject;

						/**
						 * @Param("list")
						 */
						List<Object> list = map.get("list");
						LOGGER_INFO.info("intercept batch insert, list {}", JSON.toJSONString(list));

						if (CollectionUtils.isNotEmpty(list)) {
							List<DataAuthBaseDO> dataAuthBaseDOList = new ArrayList<>();
							list.stream().forEach(object -> {
								DataAuthBaseDO dataAuthBaseDO = null;
								try {
									dataAuthBaseDO = (DataAuthBaseDO) object;
								} catch (Exception e) {
									// e
								}
								if (dataAuthBaseDO != null) {
									dataAuthBaseDOList.add(dataAuthBaseDO);
								}
							});
							LOGGER_INFO.info("intercept batch insert, dataAuthBaseDOList {}", JSON.toJSONString(dataAuthBaseDOList));

							if (CollectionUtils.isNotEmpty(dataAuthBaseDOList)) {
								buildManyDataAuthBaseDO(dataAuthBaseDOList);
								String newSql = buildBatchInsertDataAuthSQL(dataAuthBaseDOList);

								LOGGER_INFO.info("intercept batch insert, executeUpdate sql {}", beautifySql(newSql));
								if (StringUtils.isNotEmpty(newSql)) {
									Statement.executeUpdate(newSql);
								}
							}
						}
					} else {								// 单行插入,parameterObject为业务MODEL
						LOGGER_INFO.info("intercept single insert, parameterObject {}", JSON.toJSONString(parameterObject));
						DataAuthBaseDO dataAuthBaseDO = null;
						try {
							dataAuthBaseDO = (DataAuthBaseDO) parameterObject;
						} catch (Exception e) {
							// e
						}
						LOGGER_INFO.info("intercept single insert, dataAuthBaseDO {}", JSON.toJSONString(dataAuthBaseDO));

						if (dataAuthBaseDO != null) {
							buildSingleDataAuthBaseDO(dataAuthBaseDO);
							String newSql = buildInsertDataAuthSQL(dataAuthBaseDO);

							LOGGER_INFO.info("intercept single insert, executeUpdate sql {}", beautifySql(newSql));
							Statement.executeUpdate(newSql);
						}
					}

					LOGGER_INFO.info("<<<=== intercept end");
				}

				// 修改
				if (lowerCaseSql.startsWith(UPDATE + businessTableName + SET)) {
					LOGGER_INFO.info("intercept update, table is {}.", businessTableName);
					
					if (parameterObject instanceof Map) {	// 多行更新,parameterObject为业务MODEL List

						@SuppressWarnings("unchecked")
						Map<String, List<Object>> map = (Map<String, List<Object>>) parameterObject;

						/**
						 * @Param("list")
						 */
						List<Object> list = null;
						try {
							list = map.get("list");
							LOGGER_INFO.info("intercept batch update, list {}", JSON.toJSONString(list));
							if (CollectionUtils.isNotEmpty(list)) {
								List<DataAuthBaseDO> dataAuthBaseDOList = new ArrayList<>();
								list.stream().forEach(object -> {
									DataAuthBaseDO dataAuthBaseDO = null;
									try {
										dataAuthBaseDO = (DataAuthBaseDO) object;
									} catch (Exception e) {
										// e
									}
									if (dataAuthBaseDO != null) {
										dataAuthBaseDOList.add(dataAuthBaseDO);
									}
								});
								
								LOGGER_INFO.info("intercept batch update, dataAuthBaseDOList {}", JSON.toJSONString(dataAuthBaseDOList));
								
								if (CollectionUtils.isNotEmpty(dataAuthBaseDOList)) {
									List<DataAuthBaseDO> needUpdateDataAuthBaseDOList = dataAuthBaseDOList.stream().filter(a -> a.getNeedUpdateDataAuth()).collect(Collectors.toList());
									
									LOGGER_INFO.info("intercept batch update, need-update dataAuthBaseDOList {}", JSON.toJSONString(needUpdateDataAuthBaseDOList));
									
									if (CollectionUtils.isNotEmpty(needUpdateDataAuthBaseDOList)) {
										buildManyDataAuthBaseDO(needUpdateDataAuthBaseDOList);
										String newSql = buildBatchUpdateDataAuthSQL(needUpdateDataAuthBaseDOList);

										LOGGER_INFO.info("intercept batch update, executeUpdate sql {}", beautifySql(newSql));
										if (StringUtils.isNotEmpty(newSql)) {
											Statement.executeUpdate(newSql);
										}
									}

								}
							}
						} catch (Exception e2) {
							// ParamMap 中没有list，会报错，此异常不用抛出
						}
					} else {								// 单行更新,parameterObject为业务MODEL
						LOGGER_INFO.info("intercept single update, parameterObject {}", JSON.toJSONString(parameterObject));
						
						DataAuthBaseDO dataAuthBaseDO = null;
						try {
							dataAuthBaseDO = (DataAuthBaseDO) parameterObject;
						} catch (Exception e) {
							// e
						}
						LOGGER_INFO.info("intercept single update, dataAuthBaseDO {}", JSON.toJSONString(dataAuthBaseDO));

						if (dataAuthBaseDO != null && dataAuthBaseDO.getNeedUpdateDataAuth()) {
							buildSingleDataAuthBaseDO(dataAuthBaseDO);
							String newSql = buildUpdateSql(dataAuthBaseDO);
							
							if (StringUtils.isNotEmpty(newSql)) {
								LOGGER_INFO.info("intercept single update, executeUpdate sql {}", beautifySql(newSql));
								Statement.executeUpdate(newSql);
							}
						}
					}
					
					LOGGER_INFO.info("<<<=== intercept end");
				}
			} catch (Exception ex) {
				LOGGER_ERROR.error("intercept is Exception, {}", ex);
				throw ex;
			}
		}
	}

	/**
	 * @Description: 组装批量插入 SQL
	 * @author zhanghaolin
	 * @date 2019年6月20日 下午2:38:19
	 * @param dataAuthBaseDOList
	 * @return
	 */
	private String buildBatchInsertDataAuthSQL(List<DataAuthBaseDO> dataAuthBaseDOList) {
		if (CollectionUtils.isNotEmpty(dataAuthBaseDOList)) {
			StringBuffer sql = new StringBuffer(400 * dataAuthBaseDOList.size());
			sql.append(prefixInsertSql());
			dataAuthBaseDOList.stream().forEach(dataAuthBaseDO -> {
				sql.append(paramInsertSql(dataAuthBaseDO)).append(DOUHAO);
			});
			return sql.substring(0, sql.length() - DOUHAO.length());
		}
		return null;
	}

	/**
	 * @Description: 组装插入 SQL
	 * @author zhanghaolin
	 * @date 2019年6月20日 下午2:46:58
	 * @param userInfoDO
	 * @return
	 */
	private String buildInsertDataAuthSQL(DataAuthBaseDO dataAuthBaseDO) {
		String sql = prefixInsertSql() + paramInsertSql(dataAuthBaseDO);
		return sql;
	}

	private String prefixInsertSql() {
		StringBuffer baseSql = new StringBuffer(400);
		baseSql.append("insert into ").append(businessTableName).append(TABLE_SUFFIX).append(StringUtils.SPACE)
		.append(PREFIX_KUOHAO)
		.append(businessTableName).append("_id, purchaser_id,")
		.append("purchase_user_id, receive_user_id, invoice_receiver_id,")
		.append("needer_id, operator_id,")
		.append("purchase_user_org_code, receive_user_org_code, invoice_receiver_org_code,")
		.append("needer_org_code, operator_org_code,")
		.append("creator")
		.append(SUFFIX_KUOHAO)
		.append(" values ");

		return baseSql.toString();
	}

	private String paramInsertSql(DataAuthBaseDO dataAuthBaseDO) {
		StringBuffer paramSql = new StringBuffer(400);
		paramSql.append(PREFIX_KUOHAO)
		.append(dataAuthBaseDO.getId()).append(DOUHAO).append(dataAuthBaseDO.getPurchaserId()).append(DOUHAO)
		.append(dataAuthBaseDO.getPurchaseUserId()).append(DOUHAO).append(dataAuthBaseDO.getReceiveUserId()).append(DOUHAO).append(dataAuthBaseDO.getInvoiceReceiverId()).append(DOUHAO)
		.append(dataAuthBaseDO.getNeederId()).append(DOUHAO).append(dataAuthBaseDO.getOperatorId()).append(DOUHAO)
		.append(stringParam(dataAuthBaseDO.getPurchaseUserOrgCode())).append(DOUHAO).append(stringParam(dataAuthBaseDO.getReceiveUserOrgCode())).append(DOUHAO).append(stringParam(dataAuthBaseDO.getInvoiceReceiverOrgCode())).append(DOUHAO)
		.append(stringParam(dataAuthBaseDO.getNeederOrgCode())).append(DOUHAO).append(stringParam(dataAuthBaseDO.getOperatorOrgCode())).append(DOUHAO)
		.append(dataAuthBaseDO.getCreator())
		.append(SUFFIX_KUOHAO);

		return paramSql.toString();
	}
	
	private String buildBatchUpdateDataAuthSQL(List<DataAuthBaseDO> dataAuthBaseDOList) {
		StringBuffer batchSql = new StringBuffer(400 * dataAuthBaseDOList.size());
		dataAuthBaseDOList.stream().forEach(dataAuthBaseDO -> {
			String singleUpdateSql = buildUpdateSql(dataAuthBaseDO);
			if (StringUtils.isNotEmpty(singleUpdateSql)) {
				batchSql.append(singleUpdateSql).append(FENHAO);
			}
		});
		return batchSql.toString();
	}

	private String buildUpdateSql(DataAuthBaseDO dataAuthBaseDO) {
		StringBuffer baseSql = new StringBuffer(400);
		baseSql.append("update ").append(businessTableName).append(TABLE_SUFFIX).append(StringUtils.SPACE)
		.append("set ");
		if (dataAuthBaseDO.getPurchaseUserId() != null) {
			baseSql.append("purchase_user_id = " + dataAuthBaseDO.getPurchaseUserId() + DOUHAO);
		}
		if (dataAuthBaseDO.getReceiveUserId() != null) {
			baseSql.append("receive_user_id = " + dataAuthBaseDO.getReceiveUserId() + DOUHAO);
		}
		if (dataAuthBaseDO.getInvoiceReceiverId() != null) {
			baseSql.append("invoice_receiver_id = " + dataAuthBaseDO.getInvoiceReceiverId() + DOUHAO);
		}
		if (dataAuthBaseDO.getNeederId() != null) {
			baseSql.append("needer_id = " + dataAuthBaseDO.getNeederId() + DOUHAO);
		}
		if (dataAuthBaseDO.getOperatorId() != null) {
			baseSql.append("operator_id = " + dataAuthBaseDO.getOperatorId() + DOUHAO);
		}
		if (dataAuthBaseDO.getPurchaseUserOrgCode() != null) {
			baseSql.append("purchase_user_org_code = " + stringParam(dataAuthBaseDO.getPurchaseUserOrgCode()) + DOUHAO);
		}
		if (dataAuthBaseDO.getReceiveUserOrgCode() != null) {
			baseSql.append("receive_user_org_code = " + stringParam(dataAuthBaseDO.getReceiveUserOrgCode()) + DOUHAO);
		}
		if (dataAuthBaseDO.getInvoiceReceiverOrgCode() != null) {
			baseSql.append("invoice_receiver_org_code = " + stringParam(dataAuthBaseDO.getInvoiceReceiverOrgCode()) + DOUHAO);
		}
		if (dataAuthBaseDO.getNeederOrgCode()!= null) {
			baseSql.append("needer_org_code = " + stringParam(dataAuthBaseDO.getNeederOrgCode()) + DOUHAO);
		}
		if (dataAuthBaseDO.getOperatorOrgCode() != null) {
			baseSql.append("operator_org_code = " + stringParam(dataAuthBaseDO.getOperatorOrgCode()) + DOUHAO);
		}

		if (baseSql.toString().endsWith(DOUHAO)) {
			String baseSqlStr = baseSql.substring(0, baseSql.length() - DOUHAO.length());
			baseSql = new StringBuffer(baseSqlStr);
			baseSql.append(" where ").append(businessTableName).append("_id").append(EQUALS).append(dataAuthBaseDO.getId());
			return baseSql.toString();
		} else {
			// 这几个人都没有赋值，不需要更新了
			return StringUtils.EMPTY;
		}
	}

	// String Column
	private String stringParam(String param) {
		if (StringUtils.isEmpty(param)) {
			return NULL;
		}
		return DANYINHAO + param + DANYINHAO;
	}

	/**
	 * @Description: 解析参数并装入BusinessUserInfoDO
	 * @author zhanghaolin
	 * @date 2019年6月18日 上午7:52:33
	 * @param clazz
	 * @return
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 */
	private void buildSingleDataAuthBaseDO(DataAuthBaseDO dataAuthBaseDO) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {

		Long   purchaserId				= dataAuthBaseDO.getPurchaserId();
		Long   purchaseUserId			= dataAuthBaseDO.getPurchaseUserId();
		Long   receiveUserId			= dataAuthBaseDO.getReceiveUserId();
		Long   invoiceReceiverId		= dataAuthBaseDO.getInvoiceReceiverId();

		List<Long> userIdList = new ArrayList<>();
		if (purchaseUserId != null) {
			userIdList.add(purchaseUserId);
		}
		if (receiveUserId != null) {
			userIdList.add(receiveUserId);
		}
		if (invoiceReceiverId != null) {
			userIdList.add(invoiceReceiverId);
		}

		if (CollectionUtils.isNotEmpty(userIdList)) {
			ModelResult<List<UserOrganizationRelModel>> userOrgRelListResult = userOrganizationRelQueryService.listOrgCodeByUserIdList(userIdList, purchaserId);
			if (userOrgRelListResult.isSuccess()) {
				List<UserOrganizationRelModel> userOrgRelList = userOrgRelListResult.getContent();
				if (CollectionUtils.isNotEmpty(userOrgRelList)) {
					// userId-orgCode map
					Map<Long, String> userIdOrgCodeMap = userOrgRelList.parallelStream().collect(Collectors.toMap(UserOrganizationRelModel::getUserId, UserOrganizationRelModel::getCode));

					dataAuthBaseDO.setPurchaseUserOrgCode(userIdOrgCodeMap.get(purchaseUserId));
					dataAuthBaseDO.setReceiveUserOrgCode(userIdOrgCodeMap.get(receiveUserId));
					dataAuthBaseDO.setInvoiceReceiverOrgCode(userIdOrgCodeMap.get(invoiceReceiverId));

				}
			}
		}
	}
	
	/**
	 * 
	 * @Description: 解析参数并装入BusinessUserInfoDO
	 * @author zhanghaolin
	 * @date 2019年7月27日 下午1:38:32
	 * @param dataAuthBaseDO
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	private void buildManyDataAuthBaseDO(List<DataAuthBaseDO> dataAuthBaseDOList) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {

		if (CollectionUtils.isEmpty(dataAuthBaseDOList)) {
			return;
		}
		
		// 租户ID
		Long purchaserId = dataAuthBaseDOList.get(0).getPurchaserId();
		
		Set<Long> userIdSet = new HashSet<>(dataAuthBaseDOList.size());
		dataAuthBaseDOList.stream().forEach(dataAuthBaseDO -> {
			Long   purchaseUserId			= dataAuthBaseDO.getPurchaseUserId();
			Long   receiveUserId			= dataAuthBaseDO.getReceiveUserId();
			Long   invoiceReceiverId		= dataAuthBaseDO.getInvoiceReceiverId();
			Long   neederId					= dataAuthBaseDO.getNeederId();
			Long   operatorId				= dataAuthBaseDO.getOperatorId();
			
			if (purchaseUserId != null) {
				userIdSet.add(purchaseUserId);
			}
			if (receiveUserId != null) {
				userIdSet.add(receiveUserId);
			}
			if (invoiceReceiverId != null) {
				userIdSet.add(invoiceReceiverId);
			}
			if (neederId != null) {
				userIdSet.add(neederId);
			}
			if (operatorId != null) {
				userIdSet.add(operatorId);
			}
		});
		
		if (CollectionUtils.isNotEmpty(userIdSet)) {
			ModelResult<List<UserOrganizationRelModel>> userOrgRelListResult = userOrganizationRelQueryService.listOrgCodeByUserIdList(new ArrayList<Long>(userIdSet), purchaserId);
			if (userOrgRelListResult.isSuccess()) {
				List<UserOrganizationRelModel> userOrgRelList = userOrgRelListResult.getContent();
				if (CollectionUtils.isNotEmpty(userOrgRelList)) {
					// userId-orgCode map
					Map<Long, String> userIdOrgCodeMap = userOrgRelList.parallelStream().collect(Collectors.toMap(UserOrganizationRelModel::getUserId, UserOrganizationRelModel::getCode));

					dataAuthBaseDOList.stream().forEach(dataAuthBaseDO -> {
						dataAuthBaseDO.setPurchaseUserOrgCode(userIdOrgCodeMap.get(dataAuthBaseDO.getPurchaseUserId()));
						dataAuthBaseDO.setReceiveUserOrgCode(userIdOrgCodeMap.get(dataAuthBaseDO.getReceiveUserId()));
						dataAuthBaseDO.setInvoiceReceiverOrgCode(userIdOrgCodeMap.get(dataAuthBaseDO.getInvoiceReceiverId()));
						dataAuthBaseDO.setNeederOrgCode(userIdOrgCodeMap.get(dataAuthBaseDO.getNeederId()));
						dataAuthBaseDO.setOperatorOrgCode(userIdOrgCodeMap.get(dataAuthBaseDO.getOperatorId()));
					});
				}
			}
		}
	}

	private String beautifySql(String sql) {
		sql = sql.replaceAll("[\\s\n ]+", StringUtils.SPACE);
		sql = sql.replace("`", StringUtils.EMPTY);
		return sql;
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		System.out.println(JSON.toJSONString(properties));
	}


	// Setter Getter
	public String getBusinessTableName() {
		return businessTableName;
	}

	public void setBusinessTableName(String businessTableName) {
		this.businessTableName = businessTableName;
	}

	public UserOrganizationRelQueryService getUserOrganizationRelQueryService() {
		return userOrganizationRelQueryService;
	}

	public void setUserOrganizationRelQueryService(UserOrganizationRelQueryService userOrganizationRelQueryService) {
		this.userOrganizationRelQueryService = userOrganizationRelQueryService;
	}

	// Constructor
	public DataAuthStatementHandlerInterceptor(UserOrganizationRelQueryService userOrganizationRelQueryService) {
		this.userOrganizationRelQueryService = userOrganizationRelQueryService;
	}

}

/**
 * 	两种情况：
 * 	1、批量新增接口中参数声明了@Param("list")注解，则map中key是list和param1，list为真正的model集合，param1为参数占位
 * 	   其中，map中的key list是可变参数，即为@Param中配置的"list"
 *  2、如果没有声明@Param("list")注解，则map中key是collection和list，collection为真正的model集合，list为参数占位，如：$.collection[0]，$.collection[1]
 *
 * 	<bold>
 * 		如果list名字都不统一，没法搞了，所以，批量插入业务表的方法请必须用@Param("list")声明。
 * 	</bold>
 */
