package com.PineappleStore.service.impl;

import com.PineappleStore.dao.OrderItemMapper;
import com.PineappleStore.entity.OrderItem;
import com.PineappleStore.service.OrderItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单项/快照  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItem> implements OrderItemService {

}
