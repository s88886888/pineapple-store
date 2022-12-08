package com.PineappleStore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author Linson
 * @since 2022-11-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserCollect implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 收藏主键
     */
    @TableId(value = "collect_id", type = IdType.AUTO)
    private Integer collectId;

    /**
     * 用户主键
     */
    private Integer userId;

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


}
