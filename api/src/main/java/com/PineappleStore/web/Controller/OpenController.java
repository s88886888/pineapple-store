package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.service.OrdersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Api(value = "开放数据接口", tags = "开放数据接口")
@RestController
@RequestMapping("/open")
public class OpenController {

    @Resource
    private OrdersService ordersService;
    @ApiOperation(value = "获取上周的订单量", notes = "获取上周的订单量")
    @GetMapping("/selectWeekOrder")
    public ResultVo selectWeekOrder() {
        return new ResultVo("获取成功", StatusVo.success, ordersService.selectWeekORder());

    }

}
