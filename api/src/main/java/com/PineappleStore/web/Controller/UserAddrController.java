package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.UserAddr;
import com.PineappleStore.service.UserAddrService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户地址  前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/user-addr")
@Api(value = "用户地址管理", tags = "用户地址管理")
public class UserAddrController {

    @Autowired
    private UserAddrService userAddrService;


    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {

        return userAddrService.SelectByAll();


    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable String id) {
        return userAddrService.SelectById(id);

    }


    @GetMapping("/getUserId/{userid}")
    @ApiOperation(value = "根据用户ID获取数据", notes = "根据用户ID获取数据")
    public ResultVo SelectByUserId(@PathVariable String userid) {
        return userAddrService.SelectByUserId(userid);

    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody UserAddr uerAddr) {

        return userAddrService.UpdateByModel(uerAddr);


    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable String id) {
        return userAddrService.DeleteById(id);


    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody UserAddr uerAddr) {

        return userAddrService.AddModel(uerAddr);

    }


}

