package com.PineappleStore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 订单项/快照
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class OrderItem implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单项ID
     */
    @TableId(value = "item_id", type = IdType.AUTO)
    private String itemId;

    /**
     * 订单ID
     */
    private String orderId;

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
    private Integer buyCounts;

    /**
     * 商品总金额
     */
    private BigDecimal totalAmount;

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


}
