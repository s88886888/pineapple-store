package com.pineapplestore.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.ShoppingCart;
import com.PineappleStore.service.ShoppingCartService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 购物车  前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/shopping-cart")
@Api(value = "购物车接口", tags = "购物车接口")
public class ShoppingCartController {


    @Autowired
    private ShoppingCartService shoppingCartService;

    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {
        return shoppingCartService.SelectByAll();
    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable int id) {
        return shoppingCartService.SelectById(id);
    }


    @GetMapping("/getUserId/{id}")
    @ApiOperation(value = "根据用户ID获取一条数据", notes = "根据用户ID获取一条数据")
    public ResultVo SelectByUserid(@PathVariable String id) {
        return shoppingCartService.SelectByUserid(id);
    }

    @GetMapping("/getCartId/{id}")
    @ApiOperation(value = "根据购物车ID获取一条数据", notes = "根据用户ID获取一条数据")
    public ResultVo SelectByIdForproduct(@PathVariable int id) {
        return shoppingCartService.SelectByIdForproduct(id);
    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody ShoppingCart ShoppingCart) {
        return shoppingCartService.UpdateByModel(ShoppingCart);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable int id) {
        return shoppingCartService.DeleteById(id);
    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody ShoppingCart shoppingCart) {
        return shoppingCartService.AddModel(shoppingCart);
    }

}

