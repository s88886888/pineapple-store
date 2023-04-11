package com.PineappleStore.serviceImpl;


import com.PineappleStore.dao.OrderReturnMapper;
import com.PineappleStore.entity.OrderReturn;
import com.PineappleStore.service.OrderReturnService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
* @author Linson
* &#064;description  针对表【order_return】的数据库操作Service实现
* &#064;createDate  2023-04-09 14:27:50
 */
@Service
public class OrderReturnServiceImpl extends ServiceImpl<OrderReturnMapper, OrderReturn> implements OrderReturnService {

    @Resource
    private  OrderReturnMapper orderReturnMapper;

    @Override
    public int addModel(OrderReturn orderReturn) {
       return orderReturnMapper.insert(orderReturn);
    }
}
