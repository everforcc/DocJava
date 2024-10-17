select * from mt_cart e;

-- 每月
select 3300 + 1700 from dual;

-- 9k 费率
-- 576
select 121+74+70+63+51+50+41+36+28+21+14+7 from dual;
select 576/9000 from dual;

-- 6800
select 8500 * 0.8 from dual;
-- 1001-1031
-- 5383
select 19/24*6800 from dual;

-- 每月四个时间点
select -670.95 from dual;
-- 1017
select 5767 from dual;
-- 1025
select 5767-2701 from dual; -- 3066
-- 1026
select 3066-0 from dual; -- 3066

-- 11 每月四个时间点
-- 1106
select 3066-315 from dual; -- 2751
-- 1108
select 2751-1471 from dual; -- 1280
-- no wu ye fei case
-- 1115
select 1280 + 5383 from dual; -- 6663

-- 1125
select 6663 - 1500 from dual; -- 5163

-- 12 每月四个时间点
-- 1208
select 5163 - 1473 from dual; -- 3690

-- 1215
select 3690 + 6800 from dual; -- 10490

-- 1225
select 10490-1500 from dual; -- 8990

-- 1226
select 8990-3300 from dual; -- 5690

-- 01 每月四个时间点
-- 0108
select 5690-970 from dual; -- 4720
-- 0115
select 4720+6800 from dual; -- 11520
-- 0125
select 11520-1500 from dual; -- 10020
-- 0126
select 10020-3300 from dual; -- 6720

-- 02 每月四个时间点
-- 0208
select 6720-970 from dual; -- 5750
-- 0215 有一部分不是全部，就按照 7900
select 5750+7900 from dual; -- 13650
-- 0225
-- 0226
select 13650-1500-3300 from dual; -- 8850

-- 03 每月四个时间点
-- 0308
select 8850-970 from dual; -- 7880
-- 0315
select 7880+8500 from dual; -- 16380
-- 0325
-- 0326
select 16380-1500-3300 from dual; -- 11580

-- 04 每月四个时间点
-- 0408
-- 0415
-- 0425
-- 0426



-- 12

-- 01

-- 02

-- complete

-- 03

-- 04