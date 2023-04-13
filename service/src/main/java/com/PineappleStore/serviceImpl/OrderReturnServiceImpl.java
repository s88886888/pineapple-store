package com.PineappleStore.serviceImpl;


import com.PineappleStore.dao.OrderReturnMapper;
import com.PineappleStore.dao.OrdersMapper;
import com.PineappleStore.entity.OrderReturn;
import com.PineappleStore.entity.Orders;
import com.PineappleStore.service.OrderReturnService;
import com.github.yulichang.base.MPJBaseServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author Linson
 * &#064;description  针对表【order_return】的数据库操作Service实现
 * &#064;createDate  2023-04-09 14:27:50
 */
@Service
public class OrderReturnServiceImpl extends MPJBaseServiceImpl<OrderReturnMapper, OrderReturn> implements OrderReturnService {

    @Resource
    private OrderReturnMapper orderReturnMapper;

    @Resource
    private OrdersMapper ordersMapper;

    @Override
    public int addModel(OrderReturn orderReturn) {


        orderReturn.setCreateTime(new Date());
        Orders data = ordersMapper.selectById(orderReturn.getOrderId());

        if (data != null) {
            if ("2".equals(data.getStatus())) {
                orderReturn.setReturnExa(0);
            } else {
                orderReturn.setReturnExa(1);
            }
        }


        return orderReturnMapper.insert(orderReturn);
    }
}
