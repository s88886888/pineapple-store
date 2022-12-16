package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Orders;
import com.PineappleStore.entity.OrdersVo;
import com.github.yulichang.base.MPJBaseService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 订单  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface OrdersService extends MPJBaseService<Orders> {


    ResultVo SelectByAll();

    ResultVo SelectById(String Id);

    ResultVo SelectByUserId(String Id);

    ResultVo SelectOrederItem(String Id);

    ResultVo UpdateByModel(Orders orders);

    ResultVo DeleteById(String Id);

    ResultVo AddModel(OrdersVo orders);

    boolean SelectByIdForBoolean(String Id);

    ResultVo aliPay(String orderId);

    ResultVo aliPayNotify(HttpServletRequest request) throws Exception;

    void ChenckTimeoutOrder();


}
