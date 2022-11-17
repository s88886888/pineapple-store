package com.PineappleStore.service;

import com.PineappleStore.ResultVo.TokenVo;
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


     TokenVo Login(String userName, String passWord, String loginToken) throws Exception;

     TokenVo resgit(String name, String passWord, String loginToken) throws Exception;

     boolean CheckUserByname(String userName);


}
