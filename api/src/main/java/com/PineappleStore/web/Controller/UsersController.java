package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.TokenVo;
import com.PineappleStore.service.UsersService;
import io.swagger.annotations.Api;
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

    @PostMapping("/login")
    @ResponseBody
    public TokenVo login(@RequestParam String userName, @RequestParam String passWrod, @RequestParam String loginToken) throws Exception {
        return usersService.Login(userName, passWrod, loginToken);
    }

    @PostMapping("/resgit")
    public TokenVo Resgit(@RequestParam String userName, @RequestParam String passWrod, @RequestParam String resgitToken) throws Exception {
        return usersService.resgit(userName, passWrod, resgitToken);
    }


}


