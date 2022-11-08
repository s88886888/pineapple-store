package com.PineappleStore.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;


@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)

public class OrdersInfoVo {
    /**
     * 订单ID 同时也是订单编号
     */

    private String orderId;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 产品名称（多个产品用,隔开）
     */
    private String untitled;

    /**
     * 收货人快照
     */
    private String receiverName;

    /**
     * 收货人手机号快照
     */
    private String receiverMobile;

    /**
     * 收货地址快照
     */
    private String receiverAddress;

    /**
     * 订单总价格
     */
    private BigDecimal totalAmount;

    /**
     * 实际支付总价格
     */
    private Integer actualAmount;

    /**
     * 支付方式 1:微信 2:支付宝
     */
    private Integer payType;

    /**
     * 订单备注
     */
    private String orderRemark;

    /**
     * 订单状态 1:待付款 2:待发货 3:待收货 4:待评价 5:已完成 6:已关闭
     */
    private String status;

    /**
     * 配送方式
     */
    private String deliveryType;

    /**
     * 物流单号
     */
    private String deliveryFlowId;

    /**
     * 订单运费 默认可以为零，代表包邮
     */
    private BigDecimal orderFreight;

    /**
     * 逻辑删除状态 1: 删除 0:未删除
     */
    private Integer deleteStatus;

    /**
     * 创建时间（成交时间）
     */
    private Date createTime;

    /**
     * 更新时间
     */

    private Date updateTime;

    /**
     * 付款时间
     */
    private Date payTime;

    /**
     * 发货时间
     */
    private Date deliveryTime;

    /**
     * 完成时间
     */
    private Date flishTime;

    /**
     * 取消时间
     */
    private Date cancelTime;

    /**
     * 订单关闭类型1-超时未支付 2-退款关闭 4-买家取消 15-已通过货到付款交易
     */
    private Integer closeType;


    /**
     * 订单项ID
     */

    private String itemId;


    /**
     * 商品ID
     */
    private String productId;

    /**
     * 商品名称
     */
    private String productName;

    /**
     * 商品图片
     */
    private String productImg;

    /**
     * skuID
     */
    private String skuId;

    /**
     * sku名称
     */
    private String skuName;

    /**
     * 商品价格
     */
    private BigDecimal productPrice;

    /**
     * 购买数量
     */
    private Integer cartNum;


    /**
     * 加入购物车时间
     */
    private Date basketDate;

    /**
     * 购买时间
     */
    private Date buyTime;

    /**
     * 评论状态： 0 未评价  1 已评价
     */
    private Integer isComment;

    /**
     * 购物车ID
     */
    private String cartId;

}
