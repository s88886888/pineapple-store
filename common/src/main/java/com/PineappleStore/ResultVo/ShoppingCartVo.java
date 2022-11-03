package com.PineappleStore.ResultVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingCartVo {


    /**
     * 购物车主键
     */
    private Integer cartId;

    /**
     * 商品ID
     */
    private String productId;

    /**
     * skuID
     */
    private String skuId;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 购物车商品数量
     */
    private String cartNum;

    /**
     * 添加购物车时间
     */
    private String cartTime;

    /**
     * 添加购物车时商品价格
     */
    private BigDecimal productPrice;

    /**
     * 选择的套餐的属性
     */
    private String skuProps;


    /**
     * 商品名称 商品名称
     */
    private String productName;

    /**
     * 分类外键id 分类id
     */
    private Integer categoryId;


    /**
     * 图片地址
     */

    private String url;


    /**
     * 原价
     */
    private int originalPrice;


    /**
     * 折扣
     */
    private BigDecimal discounts;


    /**
     * 是否勾选
     */
    private boolean checkbox;


}
