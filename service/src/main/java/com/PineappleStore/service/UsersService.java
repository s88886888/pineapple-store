package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.TokenVo;
import com.PineappleStore.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <p>
 * 用户  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface UsersService extends IService<Users> {


    TokenVo Login(String userName, String passWord, String loginToken, int loginType,String ip) throws Exception;


    TokenVo resgit(String userName, String phone, String passWord, String phonecode,String ip);

    ResultVo getPhoneCode(String phone, String resgitToken) throws Exception;

    boolean CheckUserByName(String userName);

    boolean CheckUserByPhone(String Phone);


    ResultVo getUserPage(String name, String phone, int current, int size);

    ResultVo updateUserStatus(Integer userId);


}
