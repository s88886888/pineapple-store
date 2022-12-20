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
 * 商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ProductSku implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * sku编号
     */
    @TableId(value = "sku_id", type = IdType.AUTO)
    private String skuId;

    /**
     * 商品id
     */
    private String productId;

    /**
     * sku名称
     */
    private String skuName;

    /**
     * sku图片
     */
    private String skuImg;

    /**
     * 属性组合（格式是p1:v1;p2:v2）
     */
    private String untitled;

    /**
     * 原价
     */
    private Integer originalPrice;


    /**
     * 销售价格
     */
    private Integer sellPrice;

    /**
     * 折扣力度
     */
    private BigDecimal discounts;


    /**
     * 库存
     */
    private Integer stock;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    /**
     * sku状态(1启用，0禁用，-1删除)
     */
    private Integer status;

    /**
     * 是否为推荐商品的 推荐价格（1启用）
     */
    private Integer skuStar;


}
