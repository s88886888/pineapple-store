package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface UsersService extends IService<Users> {


     ResultVo Login(String userName, String passWord);

     ResultVo Resgit(String name, String passWord);

     boolean CheckUserByname(String userName);


}
