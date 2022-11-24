package com.PineappleStore.serviceImpl;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.OrderItemMapper;
import com.PineappleStore.dao.OrdersMapper;
import com.PineappleStore.dao.ProductMapper;
import com.PineappleStore.dao.ShoppingCartMapper;
import com.PineappleStore.entity.*;
import com.PineappleStore.service.OrdersService;
import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.util.ResponseChecker;
import com.alipay.easysdk.payment.page.models.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.yulichang.base.MPJBaseServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        orders.setUserId(ordersVo.getUserId());
        orders.setReceiverAddress(ordersVo.getReceiverAddress());
        orders.setReceiverName(ordersVo.getReceiverName());
        orders.setReceiverMobile(ordersVo.getReceiverMobile());
//        orders.setTotalAmount(ordersVo.getTotalAmount());
        orders.setCreateTime(new Date());
        orders.setUpdateTime(new Date());




        /*  订单快照表*/

        //选中的商品 的总价
        BigDecimal TotalAmount = new BigDecimal("0");

        for (int i = 0; i < ordersVo.getProductList().size(); i++) {

            OrderItem orderItem = new OrderItem();

            orderItem.setItemId(doOrderNum());
            orderItem.setOrderId(ordersVo.getOrderId());

            orderItem.setProductId(ordersVo.getProductList().get(i).getProductId());


            MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()
                    .select(Product::getProductName)
                    .select(ProductImg::getUrl)
                    .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId, ProductSku::getSkuName)
                    .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                    .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId)
                    .eq(ProductImg::getIsMain, "1")
                    .eq(Product::getProductId, ordersVo.getProductList().get(i).getProductId());
            ProductVo selectJoinOne = productMapper.selectJoinOne(ProductVo.class, wrapper);


            orderItem.setProductName(selectJoinOne.getProductName());
            orderItem.setProductImg(selectJoinOne.getUrl());


            //库存待完善
            orderItem.setSkuId(selectJoinOne.getSkuId());
//            orderItem.setSkuName(ordersVo.getProduct().get(i).getSkuName());
            orderItem.setSkuName("测试");


            //商品价格
            orderItem.setProductPrice(selectJoinOne.getDiscounts().multiply(BigDecimal.valueOf(selectJoinOne.getOriginalPrice())));
            //商品数量
            orderItem.setBuyCounts(ordersVo.getProductList().get(i).getCartNum());

            //商品总价
            orderItem.setTotalAmount(orderItem.getProductPrice().multiply(BigDecimal.valueOf(orderItem.getBuyCounts())));


            TotalAmount = TotalAmount.add(orderItem.getTotalAmount());

            orderItem.setBuyTime(new Date());


            //订单总价


            int isok = orderItemMapper.insert(orderItem);
            int deleter = shoppingCartMapper.deleteById(ordersVo.getProductList().get(i).getCartId());

            if (isok < 1 || deleter < 1) {
                throw new RuntimeException("参数错误,事物回滚");
            }
        }
        orders.setTotalAmount(TotalAmount);
        orders.setUntitled("测试ing" + TotalAmount);
        orders.setStatus("1");
        int in = ordersMapper.insert(orders);

        if (in > 0) {
            return new ResultVo("清单确认成功：请支付", StatusVo.success, orders);
        } else {

            throw new RuntimeException("参数错误,事物回滚");
//            return new ResultVo("结算失败：请检查库存", StatusVo.Error, null);
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


    public ResultVo aliPay(String orderId) {


        QueryWrapper<Orders> wrapper = new QueryWrapper<>();
        wrapper.lambda().select(Orders::getTotalAmount, Orders::getUntitled)
                .eq(Orders::getOrderId, orderId)
                .eq(Orders::getStatus, "1");

        Orders orders = ordersMapper.selectOne(wrapper);

        Date date = new Date();
//        orders.getCreateTime()data.

        if (orders == null) {
            return new ResultVo("该订单不存在", StatusVo.Error, orderId);
        }

        //BigDecimal 切割两位小数
        DecimalFormat df1 = new DecimalFormat("0.00");
        String totalAmount = df1.format(orders.getTotalAmount());

        try {
            // 2. 发起API调用 电脑收银台 二维码+账号登录
            AlipayTradePagePayResponse response = Factory.Payment.Page()
                    //设置15分钟未支付，则此次支付失败，因为订单过期了
                    .optional("timeout_express", "15m")
                    .pay(orders.getUntitled(), orderId, totalAmount, "");

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
            }
//            return "success";
            return new ResultVo("支付成功", StatusVo.success, null);
        }
//        return "failed";
        return new ResultVo("支付失败", StatusVo.Error, null);
    }


}
