package com.PineappleStore.dao;

import com.PineappleStore.entity.Orders;
import com.PineappleStore.entity.OrdersVo;
import com.PineappleStore.entity.orderWeekVo;
import com.github.yulichang.base.MPJBaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 订单  Mapper 接口
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Repository
public interface OrdersMapper extends MPJBaseMapper<Orders> {

    List<OrdersVo> SelectByIdUserId(String id);


    List<orderWeekVo> selectWeekOrder();

}
