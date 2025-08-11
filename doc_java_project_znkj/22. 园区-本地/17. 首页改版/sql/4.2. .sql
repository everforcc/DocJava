
select * from (
                  (
                      select
                          zfdd.create_time createTime,
                          CONVERT(json_unquote(JSON_EXTRACT(zfdd.data,'$.\"姓名\"')) USING utf8mb4) COLLATE utf8mb4_unicode_ci userName,
                          CONVERT(json_unquote(JSON_EXTRACT(zfdd.data,'$.\"电话号码\"')) USING utf8mb4) COLLATE utf8mb4_unicode_ci phone,
                          CONVERT('计划收费' USING utf8mb4) COLLATE utf8mb4_unicode_ci as type,
                          CONVERT(zft.name USING utf8mb4) COLLATE utf8mb4_unicode_ci as feeName,
                          CAST(json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费金额\"')) AS DECIMAL(20, 2)) amount
                      from zn_fee_dynamic_data zfdd left join zn_fee_template zft on zft.fee_plan_id = zfdd.fee_plan_id
                      where json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费状态\"')) = '已缴费'
                      order by zfdd.create_time desc
                      limit 20
                  )
                  union all
                  (
                      select zcpvr.create_time as createTime,
                             CONVERT(zcpvr.username USING utf8mb4) COLLATE utf8mb4_unicode_ci as userName,
                             CONVERT(zcpvr.user_phone USING utf8mb4) COLLATE utf8mb4_unicode_ci as phone,
                             CONVERT('固定收费' USING utf8mb4) COLLATE utf8mb4_unicode_ci as type,
                             CONVERT('停车场收费' USING utf8mb4) COLLATE utf8mb4_unicode_ci as feeName,
                             zcpvr.pay_money as amount
                      from zn_car_park_vehicle_record zcpvr
                      where zcpvr.status = 2
                      order by zcpvr.create_time desc
                      limit 20
                  )
                  union all
                  (
                      select zdo.create_time as createTime,
                             CONVERT(zdo.member_name USING utf8mb4) COLLATE utf8mb4_unicode_ci as userName,
                             CONVERT(zdo.member_phone USING utf8mb4) COLLATE utf8mb4_unicode_ci as phone,
                             CONVERT('收银台' USING utf8mb4) COLLATE utf8mb4_unicode_ci as type,
                             CONVERT(case when 1 = zdo.type then '商品/餐饮'
                                          when 2 = zdo.type then '买卡'
                                          when 4 = zdo.type then '续卡'
                                          when 5 = zdo.type then '无商品付款'
                                          else '未知' end USING utf8mb4) COLLATE utf8mb4_unicode_ci as feeName,
                             CAST(zdo.end_price AS DECIMAL(20, 2)) as amount
                      from zn_dzg_order zdo
                      where zdo.status = 2
                      order by zdo.create_time desc
                      limit 20
                  )
                  union all
                  (
                      select zmopr.create_time as createTime,
                             CONVERT(zu.username USING utf8mb4) COLLATE utf8mb4_unicode_ci as userName,
                             CONVERT(zu.phone USING utf8mb4) COLLATE utf8mb4_unicode_ci as phone,
                             CONVERT('固定收费' USING utf8mb4) COLLATE utf8mb4_unicode_ci as type,
                             CONVERT(case when 0 = zmopr.meter_type then '水表'
                                          when 1 = zmopr.meter_type then '水表'
                                          else '未知' end USING utf8mb4) COLLATE utf8mb4_unicode_ci as feeName,
                             CAST(zmopr.payment_money AS DECIMAL(20, 2)) as amount
                      from zn_meter_off_payment_recrd zmopr
                               left join zn_meter_water zmw on zmw.id = zmopr.device_id
                               left join zn_user zu on zmw.userid = zu.id
                      where zmopr.paye_type = 0
                        and zmopr.payment_results = 1
                      order by zmopr.create_time desc
                      limit 20
                  )
                  union all
                  (
                      select zfcpr.create_time as createTime,
                             CONVERT(zu.username USING utf8mb4) COLLATE utf8mb4_unicode_ci as userName,
                             CONVERT(zu.phone USING utf8mb4) COLLATE utf8mb4_unicode_ci as phone,
                             CONVERT('充卡收费' USING utf8mb4) COLLATE utf8mb4_unicode_ci as type,
                             CONVERT(zfcm.name USING utf8mb4) COLLATE utf8mb4_unicode_ci as feeName,
                             CAST(zfcpr.payment_money AS DECIMAL(20, 2)) as amount
                      from zn_fee_card_payment_record zfcpr
                               left join zn_fee_card zfc on zfc.id = zfcpr.device_id
                               left join zn_user zu on zfc.manager_id = zu.id
                               left join zn_fee_card_meter zfcm on zfcm.id = zfcpr.meter_type
                      where zfcpr.payment_results = 1
                      order by zfcpr.create_time desc
                      limit 20
                  )
              ) as count_fee
order by count_fee.createTime desc
limit 20