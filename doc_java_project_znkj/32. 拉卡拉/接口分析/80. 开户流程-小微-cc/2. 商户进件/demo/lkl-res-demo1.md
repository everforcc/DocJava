-

~~~json
{
  "merchant_no": "100143781",
  "state": "1",
  "status": "WAIT_AUDI"
}
~~~

~~~json
{
  "merchant_no": "100143783",
  "state": "1",
  "status": "WAIT_AUDI"
}
~~~

~~~json
{
  "merchant_no": "100143784",
  "state": "1",
  "status": "WAIT_AUDI"
}
~~~

- res

~~~json
{
  "settle_card": {
    "bank_code": "01030000",
    "clearing_bank_no": "103100000026",
    "create_time": 1757405388000,
    "id_card": "4****************2",
    "is_legal_person": true,
    "city_code": "6140",
    "audit_status": "SUCCESS",
    "province_code": "45",
    "bank_no": "103614010818",
    "account_no": "6228****6714",
    "able_status": "ENABLE",
    "province_name": "广西",
    "account_kind": "58",
    "optimistic": 0,
    "own_no": "100143782",
    "city_name": "柳州市",
    "account_name": "徐**",
    "bank_name": "中国农业银行广西柳州市柳南支行营业室",
    "id": 36190
  },
  "shop_info_list": [
    {
      "shop_contact_mobile": "182******50",
      "shop_id": 36359,
      "city_name": "柳州市",
      "shop_contact_name": "徐**",
      "city_code": "6140",
      "shop_dist_code": "986140",
      "province_code": "6100",
      "shop_name": "转发进件测试",
      "shop_dist_name": "柳州市",
      "shop_address": "柳州市解放南路金鱼巷1号花旗壹号楼15-10",
      "province_name": "广西自治区"
    }
  ],
  "product_vos": [
    {
      "product": "WECHAT_PAY",
      "product_name": "专业化扫码"
    }
  ],
  "terminal_info": [
    {
      "term_type_name": "专业化扫码",
      "term_type_code": 106,
      "core_term_id": 1017829207089430528,
      "active_no_vo_list": [
        {
          "term_no": "A9363908",
          "active_no": "659363908996",
          "busi_type_code": "QR_CODE_CARD"
        }
      ],
      "term_no_list": [
        "A9363908"
      ]
    }
  ],
  "customer_fee": [
    {
      "customer_no": 100143782,
      "create_time": 1757405389000,
      "trans_settle_type": "D1",
      "day_limit": 300000.0,
      "card_type": "CREDIT_CARD",
      "customer_managementd_fee": 0.0,
      "fee_rate": 0.006,
      "customer_managementf_fee": 0.0,
      "optimistic": 0,
      "customer_managemente_fee": 0.0,
      "month_limit": 3000000.0,
      "per_limi": 50000.0,
      "min_amt": 0.1,
      "max_amt": 9999.0,
      "customer_management_fee": 0.0,
      "id": 232966716,
      "trans_type": "POS"
    },
    {
      "customer_no": 100143782,
      "create_time": 1757405389000,
      "trans_settle_type": "D1",
      "day_limit": 300000.0,
      "card_type": "DEBIT_CARD",
      "customer_managementd_fee": 0.0,
      "fee_rate": 0.0038,
      "customer_managementf_fee": 0.0,
      "optimistic": 0,
      "customer_managemente_fee": 0.0,
      "month_limit": 3000000.0,
      "per_limi": 100000.0,
      "min_amt": 0.1,
      "max_amt": 20.0,
      "customer_management_fee": 0.0,
      "id": 232966717,
      "trans_type": "POS"
    },
    {
      "customer_no": 100143782,
      "create_time": 1757405389000,
      "trans_settle_type": "D1",
      "day_limit": 10000.0,
      "card_type": "QR_CORD",
      "customer_managementd_fee": 0.0,
      "fee_rate": 0.006,
      "customer_managementf_fee": 0.0,
      "optimistic": 0,
      "customer_managemente_fee": 0.0,
      "month_limit": 200000.0,
      "per_limi": 5000.0,
      "min_amt": 0.1,
      "max_amt": 9999.0,
      "customer_management_fee": 0.0,
      "id": 232966718,
      "trans_type": "POS"
    }
  ],
  "customer": {
    "phone_no": "182******50",
    "agency_no": 30000081,
    "open_time": 1757405395000,
    "platform": "LKL",
    "license_no": "92450202MA5MWYQK23",
    "optimistic": 4,
    "activity_type_name": "汇拓客专业化扫码活动",
    "term_no": "A9363908",
    "city_name": "柳州市",
    "update_time": 1757405396000,
    "receive_detail": "柳州市解放南路金鱼巷1号花旗壹号楼15-10",
    "pos_sn": "",
    "standard_fee": 0.0,
    "merchant_source": "H5",
    "activity_type": "H_W_PAY",
    "agreement_status": "TRUE",
    "mer_license_expire": "9999-12-31",
    "legal_name": "徐**",
    "channel_type": "TP_PERSONAL",
    "mcc_code": "5812",
    "is_standard": "FALSE",
    "mer_reg_name": "转发进件测试",
    "term_num": 1,
    "identity_no_expire": "2035-01-16",
    "merchant_no": "8226140581200GJ",
    "customer_no": 100143782,
    "create_time": 1757405388000,
    "phone_no_enc": "ANGG3XpIONCkA7G/e3o2AA==",
    "identity_no_st_dt": "2015-01-16",
    "agent_no": 20000101,
    "active_no": "659363908996",
    "contact_man_name": "徐**",
    "county_name": "柳州市",
    "province_name": "广西自治区",
    "ysf_discount": "FALSE",
    "bz_pos": "WECHAT_PAY",
    "phone_no_hash": "f3ad8f451f3850f288656b93e746ae2a",
    "mailbox": "28***9@qq.com",
    "customer_status": "OPEN",
    "mer_license_st_dt": "2017-11-21",
    "reward_mode": "TO_AGENT",
    "identity_no": "460027********7612",
    "customer_name": "转发进件测试",
    "mer_name": "烟酒行批发24小时"
  }
}
~~~
