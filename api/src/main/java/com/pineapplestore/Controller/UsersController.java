package com.pineapplestore.Controller;


import com.PineappleStore.ResultVo.ResultVo;
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

    @GetMapping("/login")

    public ResultVo login(@RequestParam String userName, @RequestParam(value = "passWrod") String passWrod) {
        ResultVo resultVo = usersService.Login(userName, passWrod);

        return resultVo;

    }

    @PostMapping("/resgit")
    public ResultVo Resgit(@RequestParam String userName, @RequestParam String passWrod) {
        System.out.println(userName + passWrod);
        ResultVo resultVo = usersService.Resgit(userName, passWrod);
        return resultVo;

    }


}

