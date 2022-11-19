package com.PineappleStore.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户发送短信码验证表
 * </p>
 *
 * @author Linson
 * @since 2022-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserChenck implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "user_checkid", type = IdType.AUTO)
    private Integer userCheckid;

    /**
     * 电话
     */
    private String phone;

    /**
     * 验证码
     */
    private String code;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;


    /**
     * 过期时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date expirationTime;

}
