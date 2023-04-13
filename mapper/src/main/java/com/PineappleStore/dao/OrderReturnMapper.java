package com.PineappleStore.dao;


import com.PineappleStore.entity.OrderReturn;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

/**
* @author Linson
* @description 针对表【order_return】的数据库操作Mapper
* @createDate 2023-04-09 14:27:50
* @Entity entity.domain.OrderReturn
*/
public interface OrderReturnMapper extends MPJBaseMapper<OrderReturn> {


//   Date nowDaytime = new Date();


   OrderReturn  selectOrderReturnDesc (String orderId);



   int  updateOrderStatus (@Param("orderId") String orderId,@Param("time") Date nowDaytime );

   int  updateOrderNoStatus (@Param("orderId") String orderId,@Param("time") Date nowDaytime );

}
