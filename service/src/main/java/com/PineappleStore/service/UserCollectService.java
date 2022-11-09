package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.UserCollect;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Linson
 * @since 2022-11-09
 */
public interface UserCollectService extends IService<UserCollect> {

    ResultVo SelectByAll();

    ResultVo SelectById(int Id);


    ResultVo SelectByUserId(String Id);

    ResultVo UpdateByModel(UserCollect userCollect);

    ResultVo DeleteById(int Id);

    ResultVo DeleteByUserId(int UserId, String ProductId);


    ResultVo AddModel(UserCollect userCollect);


}
