package com.PineappleStore.web.Controller;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.entity.OrderReturn;
import com.PineappleStore.service.OrderReturnService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@RestController
@RequestMapping("/orderReturn")
@Api(value = "订单退货理由", tags = "订单退货理由")
public class OrderReturnController  {

@Resource
private OrderReturnService orderReturnService;


    @ApiOperation(value = "新增订单退货理由", notes = "新增订单退货理由")
    @PostMapping("/")
    public ResultVo getReturnDesc(@RequestBody OrderReturn orderReturn) {
        return new ResultVo("操作成功", StatusVo.success,orderReturnService.addModel(orderReturn));

    }
}
