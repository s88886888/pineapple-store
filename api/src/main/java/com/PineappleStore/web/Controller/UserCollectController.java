package com.PineappleStore.web.Controller;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.UserCollect;
import com.PineappleStore.service.UserCollectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-11-09
 */
@RestController
@RequestMapping("/user-collect")
@Api(value = "用户收藏", tags = "用户收藏接口")
public class UserCollectController {
    @Autowired
    private UserCollectService UserCollectService;


    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {
        return UserCollectService.SelectByAll();
    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable int id) {
        return UserCollectService.SelectById(id);
    }

    @GetMapping("/getUserId/{id}")
    @ApiOperation(value = "根据用户ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectByUserId(@PathVariable String id) {
        return UserCollectService.SelectByUserId(id);
    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody UserCollect userCollect) {
        return UserCollectService.UpdateByModel(userCollect);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable int id) {
        return UserCollectService.DeleteById(id);
    }

    @DeleteMapping("/{UserId}/{ProductId}")
    @ApiOperation(value = "根据用户id和商品id进行删除数据", notes = "传入用户id和商品id")
    public ResultVo DeleteByUserId(@PathVariable int UserId, @PathVariable String ProductId) {
        return UserCollectService.DeleteByUserId(UserId, ProductId);
    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody UserCollect userCollect) {
        return UserCollectService.AddModel(userCollect);
    }
}

