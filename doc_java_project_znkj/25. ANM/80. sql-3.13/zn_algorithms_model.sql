
-- �㷨����(1Ŀ��ʶ��2�������)
select e.id,e.algorithm_type,e.* from zn_algorithms_model e ;

-- 27
select e.core_id,e.* from zn_algorithms_model e ;

select * from zn_algorithms_config e
where e.core_id = 27;

-- �ɽ����㷨����
-- ������Դ��һ��
SELECT e.algorithms_allow,e.algorithm_type,e.* FROM zn_algorithms_model e
WHERE e.del_flag=0
  AND e.algorithm_type = 1 AND e.id <> 1866378124951154688;
-- �ɽ����㷨����
-- �㷨�������: /����б��ֵ