package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Orders;
import com.PineappleStore.entity.OrdersVo;
import com.PineappleStore.service.OrdersService;
import com.sun.org.apache.regexp.internal.RE;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 订单  前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/orders")
@Api(value = "订单", tags = "订单接口")
public class OrdersController {


    @Autowired
    private OrdersService ordersService;


    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {
        return ordersService.SelectByAll();
    }

    @GetMapping("/Page")
    @ApiOperation(value = "分页查询", notes = "分页查询")
    public ResultVo SelectByPage(@RequestParam(required = false) String id,
                                 @RequestParam(required = false) String name,
                                 @RequestParam(required = false) String status,
                                 @RequestParam(required = false) String dataTimeOne,
                                 @RequestParam(required = false) String dataTimeTwo,
                                 @RequestParam int current,
                                 @RequestParam int size) {
        return ordersService.SelectByPage(id, name, status, dataTimeOne, dataTimeTwo, current, size);
    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable String id) {
        return ordersService.SelectById(id);
    }

    @GetMapping("/getOrder/{id}")
    @ApiOperation(value = "根据用户ID获取一条数据", notes = "根据用户ID获取一条数据")
    public ResultVo SelectByUserId(@PathVariable String id) {
        return ordersService.SelectByUserId(id);
    }


    @GetMapping("/getUserIdbyStatus")
    @ApiOperation(value = "状态获取用户订单", notes = "状态获取用户订单")
    public ResultVo SelectByUserId(@RequestParam String Id, @RequestParam String status) {
        return ordersService.SelectByUserIdNopay(Id, status);
    }


    @GetMapping("/getOrderitem/{id}")
    @ApiOperation(value = "根据ID嵌套查询item", notes = "根据ID嵌套查询item")
    public ResultVo SelectOrederItem(@PathVariable String id) {
        return ordersService.SelectOrederItem(id);
    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody Orders orders) {
        return ordersService.UpdateByModel(orders);
    }


    @PutMapping("/UpdateUserOff")
    @ApiOperation(value = "用户手动取消订单", notes = "用户手动取消订单")
    public ResultVo UpdateUserOff(@RequestParam String OrderID , @RequestParam String UserId) {
        return ordersService.UpdateUserOff(OrderID,UserId);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable String id) {
        return ordersService.DeleteById(id);
    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody OrdersVo orders) {
        return ordersService.AddModel(orders);
    }


    @PostMapping("/pay")
    @ApiOperation(value = "支付宝结算", notes = "null")
    public ResultVo OrderPay(@RequestParam String orderId) {
        return ordersService.aliPay(orderId);
    }


    @ApiOperation(value = "接受支付宝推送的内容", notes = "null")
    @PostMapping("/notify")
    public ResultVo notify(HttpServletRequest request) throws Exception {
        return ordersService.aliPayNotify(request);
    }


    @ApiOperation(value = "推送发货", notes = "推送发货")
    @PutMapping("/seedOrder")
    public ResultVo seedOreder(@RequestBody List<Orders> orders) throws Exception {
        return ordersService.seedOrder(orders);

    }


}

