package com.PineappleStore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 登录历史表
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserLoginHistory implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    /**
     * 地区
     */
    @TableField("AREA")
    private String area;

    /**
     * 国家
     */
    @TableField("COUNTRY")
    private String country;

    /**
     * 用户id
     */
    @TableField("USER_ID")
    private String userId;

    /**
     * IP
     */
    @TableField("IP")
    private String ip;

    /**
     * 时间
     */
    @TableField("LOGIN_TIME")
    private String loginTime;


}
