package com.PineappleStore.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 订单
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单ID 同时也是订单编号
     */
    @TableId(value = "order_id", type = IdType.AUTO)
    private String orderId;

    /**
     * 用户ID
     */
    private Integer userId;

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
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
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


}
