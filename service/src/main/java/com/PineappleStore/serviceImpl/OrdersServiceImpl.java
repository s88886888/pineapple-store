package com.PineappleStore.serviceImpl;


import com.PineappleStore.RedisService.RedisUtil;
import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.WebSocket.PayWebSocket;
import com.PineappleStore.dao.*;
import com.PineappleStore.entity.*;
import com.PineappleStore.service.OrdersService;
import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.util.ResponseChecker;
import com.alipay.easysdk.payment.page.models.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.yulichang.base.MPJBaseServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

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

    @Autowired
    private ProductMapper productMapper;

    @Resource
    private OrderReturnMapper orderReturnMapper;

    @Resource
    private RedisUtil redisUtil;


    @Override
    public ResultVo SelectByAll() {
        QueryWrapper<Orders> wrapper = new QueryWrapper<>();
        List<Orders> OrdersList = ordersMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, OrdersList);
    }

    @Override
    public ResultVo SelectByPage(String id, String name, String status, String dataTimeOne, String datetimeTwo, int current, int size) {

        MPJLambdaWrapper<Orders> wrapper = new MPJLambdaWrapper<Orders>()
                .select(Users::getUsername)
                .selectAll(Orders.class)
                .leftJoin(Users.class, Users::getUserId, Orders::getUserId)
                .orderByDesc(Orders::getCreateTime);


        if (id != null && !id.equals("")) {
            wrapper.eq(Orders::getOrderId, id);
        }
        if (name != null && !name.equals("")) {
            wrapper.like(Users::getUsername, name);
        }
        if (status != null && !status.equals("0")) {
            wrapper.eq(Orders::getStatus, status);
        }
        if (dataTimeOne != null && !dataTimeOne.equals("")) {
            wrapper.ge(Orders::getCreateTime, dataTimeOne);
        }
        if (datetimeTwo != null && !datetimeTwo.equals("")) {
            wrapper.le(Orders::getCreateTime, datetimeTwo);
        }


        IPage<OrdersVo> OrdersList = ordersMapper.selectJoinPage(new Page<>(current, size), OrdersVo.class, wrapper);

        return new ResultVo("查询成功", StatusVo.success, OrdersList);
    }

    @Override
    public ResultVo SelectById(String Id) {

        Orders orders = ordersMapper.selectById(Id);

        return new ResultVo("查询成功", StatusVo.success, orders);
    }

    @Override
    public ResultVo SelectByUserId(String Id) {


        MPJLambdaWrapper<Orders> mpjLambdaWrapper = new MPJLambdaWrapper<Orders>().selectAll(Orders.class)
                //嵌套查询
                .selectCollection(OrderItem.class, OrdersVo::getProductList)
                .leftJoin(OrderItem.class, OrderItem::getOrderId, Orders::getOrderId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, OrderItem::getProductId).eq(Orders::getUserId, Id).orderByDesc(Orders::getCreateTime);


        List<OrdersVo> orders = ordersMapper.selectJoinList(OrdersVo.class, mpjLambdaWrapper);

        return new ResultVo("查询成功", StatusVo.success, orders);
    }

    @Override
    public ResultVo SelectOrederItem(String Id) {

        MPJLambdaWrapper<Orders> wrapper = new MPJLambdaWrapper<Orders>()
                .selectAll(Orders.class)
                .select(Users::getUsername)
                .selectCollection(OrderItem.class, OrdersVo::getProductList)
                .leftJoin(OrderItem.class, OrderItem::getOrderId, Orders::getOrderId)
                .leftJoin(Users.class, Users::getUserId, Orders::getUserId)
                .eq(Orders::getOrderId, Id);

        List<OrdersVo> orders = ordersMapper.selectJoinList(OrdersVo.class, wrapper);


        return new ResultVo("查询成功", StatusVo.success, orders);
    }

    @Override
    public ResultVo SelectByUserIdNopay(String Id, String status) {


        MPJLambdaWrapper<Orders> wrapper = new MPJLambdaWrapper<Orders>()
                .selectAll(Orders.class)
                //嵌套查询
                .selectCollection(OrderItem.class, OrdersVo::getProductList)
                .leftJoin(OrderItem.class, OrderItem::getOrderId, Orders::getOrderId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, OrderItem::getProductId)
                .eq(Orders::getUserId, Id)
                .eq(Orders::getStatus, status)
                .orderByDesc(Orders::getCreateTime);

        List<OrdersVo> orders = ordersMapper.selectJoinList(OrdersVo.class, wrapper);


        return new ResultVo("查询成功", StatusVo.success, orders);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo AddModel(OrdersVo ordersVo) {

        try {

            /*订单表*/
            ordersVo.setOrderId(UUID.randomUUID().toString());
            Orders orders = new Orders();
            orders.setOrderId(ordersVo.getOrderId());
            orders.setUserId(ordersVo.getUserId());
            orders.setReceiverAddress(ordersVo.getReceiverAddress());
            orders.setReceiverName(ordersVo.getReceiverName());
            orders.setReceiverMobile(ordersVo.getReceiverMobile());
            orders.setCreateTime(new Date());
            orders.setUpdateTime(new Date());


            //订单商品的总价 结算价格
            BigDecimal TotalAmount = new BigDecimal("0");

            //添加的订单详细表
            List<OrderItem> orderItemList = new ArrayList<>();

            // 需要删除的用户购物车商品
            List<String> shopIdList = new ArrayList<>();

            /*  订单快照表*/
            for (int i = 0; i < ordersVo.getProductList().size(); i++) {

                //初始化数据
                OrderItem orderItem = new OrderItem();
                //只需要前端给我们的数量和商品ID，根据这些安全信息数据库自己查询，防止第三方修改
                orderItem.setItemId(doOrderNum());

                orderItem.setProductId(ordersVo.getProductList().get(i).getProductId());


                //外键绑定订单表的ID
                orderItem.setOrderId(ordersVo.getOrderId());

                MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()
                        .select(Product::getProductName, Product::getProductId, Product::getSoldNum)
                        .select(ProductImg::getUrl)
                        .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId, ProductSku::getSkuName)
                        .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                        .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId)
                        .eq(ProductImg::getIsMain, "1")
                        .eq(ProductSku::getSkuId, ordersVo.getProductList().get(i).getSkuId())
                        .eq(Product::getProductId, ordersVo.getProductList().get(i).getProductId());

                ProductVo selectJoinOne = productMapper.selectJoinOne(ProductVo.class, wrapper);

                if (selectJoinOne == null) {
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return new ResultVo("非法账户:联系管理员解除限制", StatusVo.Error, null);
                }


                Product product = new Product();
                product.setSoldNum(selectJoinOne.getSoldNum() + ordersVo.getProductList().get(i).getCartNum());
                product.setUpdateTime(new Date());
                productMapper.updateById(product);


                orderItem.setProductName(selectJoinOne.getProductName());
                orderItem.setProductImg(selectJoinOne.getUrl());

                //库存待完善
                orderItem.setSkuId(selectJoinOne.getSkuId());
                orderItem.setSkuName(selectJoinOne.getSkuName());


                //商品价格
                orderItem.setProductPrice(selectJoinOne.getDiscounts().multiply(BigDecimal.valueOf(selectJoinOne.getOriginalPrice())));
                //商品数量
                orderItem.setBuyCounts(ordersVo.getProductList().get(i).getCartNum());
                //商品总价
                orderItem.setTotalAmount(orderItem.getProductPrice().multiply(BigDecimal.valueOf(orderItem.getBuyCounts())));
                //订单时间
                orderItem.setBuyTime(new Date());

                //订单信息
                //订单总价格
                TotalAmount = TotalAmount.add(orderItem.getTotalAmount());

                //订单商品总名字
                orders.setUntitled(orders.getUntitled() == null ? orderItem.getProductName() + " * " + orderItem.getBuyCounts() + "|" : orders.getUntitled() + orderItem.getProductName() + " * " + orderItem.getBuyCounts() + "|");

                //订单详细表增加
                orderItemList.add(orderItem);

                //删掉购物车
                shopIdList.add(ordersVo.getProductList().get(i).getCartId());


            }
            orders.setTotalAmount(TotalAmount);
            orders.setStatus("1");
            int in = ordersMapper.insert(orders);


            redisUtil.del("shop" + orders.getUserId());


            if (in > 0) {

                for (OrderItem orderItem : orderItemList) {

                    int isok = orderItemMapper.insert(orderItem);

                    if (isok < 1) {
                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        return new ResultVo("结算失败：请检查库存", StatusVo.Error, null);
                    }
                }

                for (String id : shopIdList) {
                    int deleter = shoppingCartMapper.deleteById(id);
                    if (deleter < 1) {
                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        return new ResultVo("结算失败：请刷新购物车", StatusVo.Error, null);
                    }
                }

                return new ResultVo("清单确认成功：请支付", StatusVo.success, orders);
            } else {
                return new ResultVo("结算失败：请检查库存", StatusVo.Error, null);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResultVo("结算遭遇异常，请您不要担心系统已启用：数据回滚,不会对您的账号有任何影响。如有问题请联系管理员Linson！", StatusVo.Error, e);
        }
    }


    /**
     * 生成订单号
     */
    protected String doOrderNum() {
        Random random = new Random();
        SimpleDateFormat allTime = new SimpleDateFormat("yyyyMMddHHmmsss");
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


            LambdaQueryWrapper<OrderItem> wrapper = new LambdaQueryWrapper<>();


            wrapper.eq(OrderItem::getOrderId, Id);

            List<OrderItem> data = orderItemMapper.selectList(wrapper);

            //这里后期一定要加回滚事务 QAQ
            if (data == null) {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            } else {
                for (OrderItem datum : data) {
                    orderItemMapper.deleteById(datum.getItemId());
                }
            }

            int category = ordersMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该数据不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateByModel(Orders orders) {

        if (SelectByIdForBoolean(orders.getOrderId())) {
            orders.setUpdateTime(new Date());
            ordersMapper.updateById(orders);
            return new ResultVo("更新成功", StatusVo.success, orders);
        } else {
            return new ResultVo("更新失败，该轮播图不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateUserOff(String ordersId, String UserId) {
        LambdaQueryWrapper<Orders> wrapper = new LambdaQueryWrapper<Orders>()
                .select(Orders::getOrderId, Orders::getStatus)
                .eq(Orders::getOrderId, ordersId)
                .eq(Orders::getUserId, UserId);

        Orders data = ordersMapper.selectOne(wrapper);

        if (data != null) {
            if (data.getStatus().equals("1")) {
                data.setStatus("6");
                data.setCloseType(4);
                ordersMapper.updateById(data);
                return new ResultVo("取消订单成功", StatusVo.success, null);
            } else {
                return new ResultVo("订单状态异常", StatusVo.Error, null);
            }
        } else {
            return new ResultVo("法非订单", StatusVo.Error, null);
        }


    }


    public ResultVo aliPay(String orderId) {


        QueryWrapper<Orders> wrapper = new QueryWrapper<>();
        wrapper.lambda().select(Orders::getOrderId, Orders::getTotalAmount, Orders::getUntitled, Orders::getCreateTime).eq(Orders::getOrderId, orderId).eq(Orders::getStatus, "1");

        Orders orders = ordersMapper.selectOne(wrapper);
        if (orders == null) {
            return new ResultVo("订单已被支付或者超过支付时间", StatusVo.Error, orderId);
        }

        Calendar calendar = Calendar.getInstance();

        calendar.setTime(orders.getCreateTime()); //需要将date数据转移到Calender对象中操作
        calendar.add(Calendar.DATE, 1);//把日期往后增加n天.正数往后推,负数往前移动
//         calendar.getTime();   //这个时间就是日期往后推一天的结果


        //                1、如果指定的数与参数相等返回0。
        //                2、如果指定的数小于参数返回 -1。
        //                3、如果指定的数大于参数返回 1。
        int i = calendar.getTime().compareTo(new Date());
        if (i < 1) {
            orders.setCloseType(1);
            orders.setStatus("6");
            orders.setUpdateTime(new Date());
            ordersMapper.updateById(orders);
            return new ResultVo("订单支付有效时间为24小时", StatusVo.Error, orderId);
        }
        //BigDecimal 切割两位小数
        DecimalFormat df1 = new DecimalFormat("0.00");
        String totalAmount = df1.format(orders.getTotalAmount());
        try {
            // 2. 发起API调用 电脑收银台 二维码+账号登录
            AlipayTradePagePayResponse response = Factory.Payment.Page()
                    //设置15分钟未支付，则此次支付失败，因为订单过期了
                    .optional("timeout_express", "15m").pay(orders.getUntitled(), orderId, totalAmount, "");

            //当面付款 只生成二维码
//            AlipayTradePrecreateResponse response = Payment.FaceToFace()
//                    .preCreate("Apple iPhone11 128G", "2234567890", "5799.00");

            // 3. 处理响应或异常
            if (ResponseChecker.success(response)) {
                return new ResultVo("调用成功", StatusVo.success, response.getBody());
            } else {
                System.out.println(response.toString());
                return new ResultVo("调用失败", StatusVo.Error, response.getBody());
            }
        } catch (Exception e) {
            System.err.println("调用遭遇异常，原因：" + e.getMessage());
            throw new RuntimeException(e.getMessage(), e);
//            return new ResultVo("支付异常，原因:" + e.getMessage(), StatusVo.wrong, null);
        }
    }

    @Override
    public ResultVo aliPayNotify(HttpServletRequest request) throws Exception {

        if ("TRADE_SUCCESS".equals(request.getParameter("trade_status"))) {
            Map<String, String> params = new HashMap<>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (String name : requestParams.keySet()) {
                params.put(name, request.getParameter(name));
//                System.out.println((name + " = " + request.getParameter(name)));
            }
            // 支付宝验签
            if (Factory.Payment.Common().verifyNotify(params)) {

//                System.out.println("交易名称: " + params.get("subject"));
//                System.out.println("交易状态: " + params.get("trade_status"));
//                System.out.println("支付宝交易凭证号: " + params.get("trade_no"));
//                System.out.println("商户订单号: " + params.get("out_trade_no"));
//                System.out.println("交易金额: " + params.get("total_amount"));
//                System.out.println("买家在支付宝唯一id: " + params.get("buyer_id"));
//                System.out.println("买家付款时间: " + params.get("gmt_payment"));
//                System.out.println("买家付款金额: " + params.get("buyer_pay_amount"));

                Orders orders = new Orders();
                //订单支付状态
                orders.setStatus("2");
                //订单支付时间
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = simpleDateFormat.parse(params.get("gmt_payment"));
                orders.setPayTime(date);
                orders.setOrderId(params.get("out_trade_no"));
                orders.setUpdateTime(new Date());
                orders.setPayType(2);
                ordersMapper.updateById(orders);

                PayWebSocket.sendPay(params.get("out_trade_no"), "支付成功");
            }


//            return "success";
            return new ResultVo("支付成功", StatusVo.success, null);
        }
//        return "failed";
        return new ResultVo("支付失败", StatusVo.Error, null);
    }

    @Override
    public ResultVo seedOrder(List<Orders> list) {
        int count = 0;
        for (Orders item : list) {

            if (item.getStatus().equals("2")) {
                UUID uuid = UUID.randomUUID();
                item.setDeliveryType("中通快递");
                item.setDeliveryFlowId(uuid.toString());
                item.setDeliveryTime(new Date());
                item.setStatus("3");
                ordersMapper.updateById(item);
                count++;
            }
        }
        return new ResultVo("推送仓库,并且发货成功,本次发送数量:" + count, 200, list);
    }

    @Override
    public ResultVo confirmReceipt(String orderId, Integer userId) {

        MPJLambdaWrapper<Orders> dataWrapper = new MPJLambdaWrapper<Orders>()
                .selectAll(Orders.class)
                .eq(Orders::getOrderId, orderId)
                .eq(Orders::getUserId, userId);

        Orders orders = ordersMapper.selectOne(dataWrapper);


        if (orders == null) {
            return new ResultVo("用户不存在该订单", StatusVo.Error, null);
        } else {
            orders.setStatus("5");
            orders.setFlishTime(new Date());
            ordersMapper.updateById(orders);
            return new ResultVo("成功确认收货", StatusVo.success, null);
        }
//        return new ResultVo("系统错误，联系管理员",StatusVo.Error,null);
    }

    @Override
    public ResultVo returnOrder(List<Orders> list) {

        int count = 0;
        for (Orders item : list) {

            if ("7".equals(item.getStatus())) {
                UUID uuid = UUID.randomUUID();
                item.setDeliveryFlowId(uuid.toString());
                item.setDeliveryTime(new Date());
                item.setStatus("6");
                item.setCloseType(5);
                ordersMapper.updateById(item);
                orderReturnMapper.updateOrderStatus(item.getOrderId(), new Date());
                count++;
            }
        }
        return new ResultVo("成功同意用户退货" + count, StatusVo.success, list);
    }

    @Override
    public ResultVo noreturnOrder(List<Orders> list) {

        int count = 0;
        for (Orders item : list) {

            if ("7".equals(item.getStatus())) {
                item.setStatus("3");
                ordersMapper.updateById(item);
                orderReturnMapper.updateOrderNoStatus(item.getOrderId(), new Date());
                count++;
            }
        }
        return new ResultVo("驳回用户退货申请" + count, StatusVo.success, list);
    }

    @Override
    public ResultVo
    getReturnDesc(String orderId) {


        OrderReturn data = orderReturnMapper.selectOrderReturnDesc(orderId);

        return new ResultVo("查询成功", StatusVo.success, data);
    }

    @Override
    public ResultVo returnOrderUser(String orderId) {


        Orders data = ordersMapper.selectById(orderId);

        if (data != null) {

            if ("2".equals(data.getStatus())) {
                data.setStatus("6");
                data.setCloseType(5);
                ordersMapper.updateById(data);
                return new ResultVo("已经为您极速退货", StatusVo.success, null);
            } else if ("3".equals(data.getStatus())) {
                data.setStatus("7");
                data.setCloseType(5);
                ordersMapper.updateById(data);
                return new ResultVo("申请退货成功,等待管理审核", StatusVo.success, null);
            }

        } else {
            return new ResultVo("订单不存在", StatusVo.Error, null);
        }


        return null;
    }

    @Override
    public List<orderWeekVo> selectWeekORder() {
     return   ordersMapper.selectWeekOrder();
    }


}
