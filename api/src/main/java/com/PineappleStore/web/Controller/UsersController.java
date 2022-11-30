package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.ResultVo.TokenVo;
import com.PineappleStore.service.UsersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户  前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */

@Api(value = "用户", tags = "用户接口")
@RestController
@RequestMapping("/users")

public class UsersController {

    @Autowired
    private UsersService usersService;


    @ApiOperation(value = "登录接口", notes = "登录接口")
    @PostMapping("/login")
    public TokenVo login(@RequestParam("userName") String userName, @RequestParam("passWord") String passWord, @RequestParam("loginToken") String loginToken, int loginType) throws Exception {
        return usersService.Login(userName, passWord, loginToken, loginType);
    }

    @ApiOperation(value = "注册接口", notes = "注册接口")
    @PostMapping("/resgit")
    public TokenVo Resgit(@RequestParam String userName, @RequestParam String phone, @RequestParam String passWord, @RequestParam String phonecode) {
        return usersService.resgit(userName, phone, passWord, phonecode);
    }

    @ApiOperation(value = "获取手机验证码", notes = "获取手机验证码")
    @PostMapping("/getPhoneCode")
    public ResultVo getPhoneCode(@RequestParam String phone, @RequestParam String resgitToken) throws Exception {
        return usersService.getPhoneCode(phone, resgitToken);
    }

    @ApiOperation(value = "用户名是否注册", notes = "用户名是否注册")
    @GetMapping("/CheckUserByName/{Name}")
    public ResultVo CheckUserByName(@PathVariable String Name) {

        if (usersService.CheckUserByName(Name)) {

            return new ResultVo("恭喜您用户名可用", StatusVo.success, null);

        } else {
            return new ResultVo("用户名已被注册", StatusVo.Error, null);

        }

    }

    @ApiOperation(value = "电话是否注册", notes = "电话是否注册")
    @GetMapping("/CheckUserByPhone/{phone}")
    public ResultVo CheckUserByPhone(@PathVariable String phone) {
        if (usersService.CheckUserByPhone(phone)) {
            return new ResultVo("手机号码未被注册", StatusVo.success, null);
        } else {
            return new ResultVo("手机号码已被注册,请您先登录", StatusVo.Error, null);

        }
    }


}


