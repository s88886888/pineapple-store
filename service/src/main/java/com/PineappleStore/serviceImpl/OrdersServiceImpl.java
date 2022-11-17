package com.PineappleStore.serviceImpl;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.OrderItemMapper;
import com.PineappleStore.dao.OrdersMapper;
import com.PineappleStore.dao.ShoppingCartMapper;
import com.PineappleStore.entity.OrderItem;
import com.PineappleStore.entity.Orders;
import com.PineappleStore.entity.OrdersVo;
import com.PineappleStore.entity.ProductImg;
import com.PineappleStore.service.OrdersService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.yulichang.base.MPJBaseServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

public class OrdersServiceImpl extends MPJBaseServiceImpl<OrdersMapper, Orders> implements OrdersService {


    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private ShoppingCartMapper shoppingCartMapper;


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
    public ResultVo SelectByUserId(String Id) {


        MPJLambdaWrapper<Orders> mpjLambdaWrapper = new MPJLambdaWrapper<Orders>()
                .selectAll(Orders.class)


                //嵌套查询
                .selectCollection(OrderItem.class, OrdersVo::getProductList)
                .leftJoin(OrderItem.class, OrderItem::getOrderId, Orders::getOrderId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, OrderItem::getProductId)
                .eq(Orders::getUserId, Id)
                .orderByDesc(Orders::getCreateTime);


        List<OrdersVo> orders = ordersMapper.selectJoinList(OrdersVo.class, mpjLambdaWrapper);


        return new ResultVo("查询成功", StatusVo.success, orders);
    }

    @Override
    @Transactional
    public ResultVo AddModel(OrdersVo ordersVo) {


        /*订单表*/

        UUID uuid = UUID.randomUUID();
        ordersVo.setOrderId(String.valueOf(uuid));

        Orders orders = new Orders();
        orders.setOrderId(ordersVo.getOrderId());
        orders.setOrderId(ordersVo.getOrderId());
        orders.setUserId(ordersVo.getUserId());
        orders.setReceiverAddress(ordersVo.getReceiverAddress());
        orders.setReceiverName(ordersVo.getReceiverName());
        orders.setReceiverMobile(ordersVo.getReceiverMobile());
        orders.setTotalAmount(ordersVo.getTotalAmount());
        orders.setCreateTime(new Date());
        orders.setUpdateTime(new Date());


        int in = ordersMapper.insert(orders);

        /*  订单快照表*/
        for (int i = 0; i < ordersVo.getProductList().size(); i++) {
            OrderItem orderItem = new OrderItem();
            orderItem.setItemId(doOrderNum());
            orderItem.setOrderId(ordersVo.getOrderId());
            orderItem.setProductId(ordersVo.getProductList().get(i).getProductId());
            orderItem.setProductName(ordersVo.getProductList().get(i).getProductName());
            orderItem.setProductImg(ordersVo.getProductList().get(i).getUrl());
            orderItem.setSkuId(ordersVo.getProductList().get(i).getSkuId());

//            orderItem.setSkuName(ordersVo.getProduct().get(i).getSkuName());
            orderItem.setSkuName("测试");
            orderItem.setProductPrice(ordersVo.getProductList().get(i).getProductPrice());
            orderItem.setBuyCounts(ordersVo.getProductList().get(i).getCartNum());
            orderItem.setBuyTime(new Date());

            int isok = orderItemMapper.insert(orderItem);
            int deleter = shoppingCartMapper.deleteById(ordersVo.getProductList().get(i).getCartId());

            if (isok < 1 || deleter < 1) {
                throw new RuntimeException("参数错误,事物回滚");
//              return new ResultVo("结算出错：请稍后再试", StatusVo.Error, ordersVo.getProduct().get(i).getProductName());
            }
        }

        if (in > 0) {
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
