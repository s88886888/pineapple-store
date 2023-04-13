package com.PineappleStore.entity;

import java.io.Serializable;
import java.util.Date;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
* 
* @TableName order_return
*/

@Data
public class OrderReturn implements Serializable {

    /**
    * 主键
    */

    @ApiModelProperty("主键")
    private Integer id;
    /**
    * 订单主键
    */

    @ApiModelProperty("订单主键")

    private String orderId;
    /**
    * 退货类型
    */
    @ApiModelProperty("退货类型")
    private Integer orderReturnDict;
    /**
    * 退货理由
    */

    @ApiModelProperty("退货理由")

    private String orderReturn;

    @ApiModelProperty("创建时间")
    private Date createTime;


    private Integer returnExa;

    private Date returnExaTime;
}
