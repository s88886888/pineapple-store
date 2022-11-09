package com.PineappleStore.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserCollectVo {


    private static final long serialVersionUID = 1L;

    /**
     * 收藏主键
     */
    private Integer collectId;

    /**
     * 用户主键
     */
    private String userId;

    /**
     * 商品分类主键
     */
    private String categoryId;

    /**
     * 商品主键
     */
    private Integer productId;

    /**
     * 库存主键
     */
    private String skuId;

    /**
     * 库存名字
     */
    private String skuName;

    /**
     * 创建时间
     */
    private Date createtime;

    /**
     * 阴影属性是否删除
     */
    private Boolean isdelete;


    /**
     * 商品名称 商品名称
     */
    private String productName;


    /**
     * 商品内容 商品内容
     */
    private String content;


    /**
     * 图片地址 图片地址
     */
    private String url;


    /**
     * 原价
     */
    private Integer originalPrice;


    /**
     * 折扣力度
     */
    private BigDecimal discounts;


}
