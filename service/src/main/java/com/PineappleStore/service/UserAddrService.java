package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.UserAddr;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户地址  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface UserAddrService extends IService<UserAddr> {


    ResultVo SelectByAll();

    ResultVo SelectById(String Id);

    ResultVo SelectByUserId(String Id);

    ResultVo UpdateByModel(UserAddr UserAddr);

    ResultVo DeleteById(String Id);

    ResultVo AddModel(UserAddr UserAddr);


}
