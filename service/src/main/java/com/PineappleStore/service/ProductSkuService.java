package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.ProductSku;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计 服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface ProductSkuService extends IService<ProductSku> {


    ResultVo SelectByAll();

    ResultVo SelectById(String Id);

    ResultVo UpdateByModel(ProductSku productSku);

    ResultVo DeleteById(String Id);

    ResultVo AddModel(ProductSku productSku);


}
