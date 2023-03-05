package com.PineappleStore.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;


@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersVo extends Orders implements Serializable {


    /**
     * 用户名
     */
    private String username;


    ////////////////////////////////////订单快照/////////////////////////////////////////////////

    private List<OrderItemVo> productList;


}
