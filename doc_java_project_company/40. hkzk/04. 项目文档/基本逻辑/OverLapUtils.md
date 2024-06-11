<span  style="font-family: Simsun,serif; font-size: 17px; ">

~~~java
/**
 * @Description : 计算区间工具类
 * @Author : GKL
 * @Date: 2024-05-17 11:07
 */
public class OverLapUtils {

    /**
     * 先判断 开始小于结束
     * 区间A 和区间B
     * 三种情况 有交集
     * 一。  B.start <= A.start && A.start < B.end
     * 二。  B.start < A.end && A.end <= B.end
     * 三。  A.start < B.start && B.end < A.end
     *
     * @param tempStartHour A.start
     * @param tempEndHour   A.end
     * @param compareStart  B.start
     * @param compareEnd    B.end
     * @return true 有交集
     */
    public static boolean isOverLap(int tempStartHour, int tempEndHour, int compareStart, int compareEnd) {
        return (compareStart <= tempStartHour && tempStartHour < compareEnd) ||
                (compareStart < tempEndHour && tempEndHour < compareEnd) ||
                (tempStartHour < compareStart && compareEnd < tempEndHour);
    }

}

~~~

</span>