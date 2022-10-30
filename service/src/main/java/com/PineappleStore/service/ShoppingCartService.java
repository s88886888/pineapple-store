package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.ShoppingCart;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 购物车  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface ShoppingCartService extends IService<ShoppingCart> {

    ResultVo SelectByAll();

    ResultVo SelectById(int Id);

    ResultVo UpdateByModel(ShoppingCart ShoppingCart);

    ResultVo DeleteById(int Id);

    ResultVo AddModel(ShoppingCart ShoppingCart);

    boolean SelectByIdForBoolean(int Id);


}
