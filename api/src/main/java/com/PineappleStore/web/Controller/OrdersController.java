package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Orders;
import com.PineappleStore.entity.OrdersVo;
import com.PineappleStore.service.OrdersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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

//        if ("TRADE_SUCCESS".equals(request.getParameter("trade_status"))) {
//            Map<String, String> params = new HashMap<>();
//            Map<String, String[]> requestParams = request.getParameterMap();
//            for (String name : requestParams.keySet()) {
//                params.put(name, request.getParameter(name));
//                System.out.println((name + " = " + request.getParameter(name)));
//            }
//            // 支付宝验签
//            if (Factory.Payment.Common().verifyNotify(params)) {
//
//                System.out.println("交易名称: " + params.get("subject"));
//                System.out.println("交易状态: " + params.get("trade_status"));
//                System.out.println("支付宝交易凭证号: " + params.get("trade_no"));
//                System.out.println("商户订单号: " + params.get("out_trade_no"));
//                System.out.println("交易金额: " + params.get("total_amount"));
//                System.out.println("买家在支付宝唯一id: " + params.get("buyer_id"));
//                System.out.println("买家付款时间: " + params.get("gmt_payment"));
//                System.out.println("买家付款金额: " + params.get("buyer_pay_amount"));
//            }
//            return "success";
//        }
//        return "failed";


        return ordersService.aliPayNotify(request);


    }

}

