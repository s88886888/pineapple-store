package com.PineappleStore.job;

import com.PineappleStore.dao.OrdersMapper;
import com.PineappleStore.entity.Orders;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
public class jobServiceImpl {

    @Resource
    private OrdersMapper ordersMapper;


    @Scheduled(cron = "0 0/20 * * * ?")
    void AutoUpdateOrder() {


        Date date = new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000);
        MPJLambdaWrapper<Orders> wrapper = new MPJLambdaWrapper<Orders>()
                .selectAll(Orders.class)
                .eq(Orders::getStatus, "1")
                .lt(Orders::getCreateTime, date);
        List<Orders> OrdersList = ordersMapper.selectList(wrapper);

        for (Orders order : OrdersList) {
            order.setStatus("6");
            order.setCloseType(1);
            ordersMapper.updateById(order);

        }
    }


}
