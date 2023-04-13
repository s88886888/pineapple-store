package com.PineappleStore.service;


import com.PineappleStore.entity.OrderReturn;
import com.baomidou.mybatisplus.extension.service.IService;
import com.github.yulichang.base.MPJBaseService;

/**
* @author Linson
* @description 针对表【order_return】的数据库操作Service
* @createDate 2023-04-09 14:27:50
*/
public interface OrderReturnService extends MPJBaseService<OrderReturn> {


    int addModel(OrderReturn orderReturn);

}
