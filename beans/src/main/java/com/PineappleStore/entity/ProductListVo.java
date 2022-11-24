package com.PineappleStore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductListVo {


    /**
     * 商品主键id
     */
    private String productId;

    /**
     * 商品名称 商品名称
     */
    private String productName;

    /**
     * 分类外键id 分类id
     */
    private Integer categoryId;

    /**
     * 一级分类外键id 一级分类id，用于优化查询
     */
    private Integer rootCategoryId;

    /**
     * 销量 累计销售
     */
    private Integer soldNum;

    /**
     * 默认是1，表示正常状态, -1表示删除, 0下架 默认是1，表示正常状态, -1表示删除, 0下架
     */
    private Integer productStatus;

    /**
     * 商品内容 商品内容
     */
    private String content;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 原价
     */
    private Integer originalPrice;


    /**
     * 折扣
     */
    private BigDecimal discounts;


//    /**
//     * skuID
//     */
//    private String skuId;
//
//    /**
//     * sku名称
//     */
//    private String skuName;


    private List<ProductImg> imgList;


}
