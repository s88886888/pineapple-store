package com.PineappleStore.serviceImpl;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.OrdersMapper;
import com.PineappleStore.entity.OrderItem;
import com.PineappleStore.entity.Orders;
import com.PineappleStore.entity.OrdersVo;
import com.PineappleStore.service.OrdersService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * <p>
 * 订单  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements OrdersService {


    @Autowired
    private OrdersMapper ordersMapper;


    @Override
    public ResultVo SelectByAll() {
        QueryWrapper<Orders> wrapper = new QueryWrapper<>();
        List<Orders> OrdersList = ordersMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, OrdersList);
    }

    @Override
    public ResultVo SelectById(String Id) {
        Orders orders = ordersMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, orders);
    }

    @Override
    public ResultVo AddModel(OrdersVo ordersVo) {






        /*订单表*/

        UUID uuid = UUID.randomUUID();
        ordersVo.setOrderId(String.valueOf(uuid));

        Orders orders = new Orders();
        orders.setOrderId(ordersVo.getOrderId());
        orders.setOrderId(ordersVo.getOrderId());
        orders.setUserId(ordersVo.getUserId());
        orders.setReceiverAddress(orders.getReceiverAddress());
        orders.setReceiverName(orders.getReceiverAddress());
        orders.setReceiverMobile(ordersVo.getReceiverAddress());
        orders.setCreateTime(new Date());
        orders.setUpdateTime(new Date());


        /*  订单快照表*/
        OrderItem orderItem = new OrderItem();


//        orderItem.setItemId(doOrderNum());
//
//        orderItem.setOrderId(ordersVo.getOrderId());
//        orderItem.setProductId(ordersVo.getProductId());
//        orderItem.setProductName(ordersVo.getProductName());
//        orderItem.setSkuId(ordersVo.getSkuId());
//        orderItem.setSkuName(ordersVo.getSkuName());
//        orderItem.setProductPrice(ordersVo.getProductPrice());
//        orderItem.setBuyCounts(ordersVo.getBuyCounts());


        for (int i = 0; i < ordersVo.getProduct().size(); i++) {
            System.out.println(ordersVo.getProduct().get(i));
        }


        int i = 0;

        if (i > 0) {

            return new ResultVo("增加成功", StatusVo.success, null);
        } else {
            return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
        }


    }


    /**
     * 生成订单号
     *
     * @return
     */
    protected String doOrderNum() {
        Random random = new Random();
        SimpleDateFormat allTime = new SimpleDateFormat("YYYYMMddHHmmSSS");
        String subjectno = allTime.format(new Date()) + random.nextInt(10);
        return subjectno + random.nextInt(10);
    }

    @Override
    public boolean SelectByIdForBoolean(String Id) {


        Orders orders = ordersMapper.selectById(Id);
        return orders != null;


    }

    @Override
    public ResultVo DeleteById(String Id) {

        boolean checkModel = SelectByIdForBoolean(Id);

        if (checkModel) {
            int category = ordersMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该轮播图不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateByModel(Orders orders) {

        if (SelectByIdForBoolean(orders.getOrderId())) {
            orders.setUpdateTime(new Date());
            ordersMapper.updateById(orders);
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该轮播图不存在", StatusVo.Error, null);
        }

    }


}
