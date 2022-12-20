package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.dao.ProductSkuMapper;
import com.PineappleStore.entity.ProductSku;
import com.PineappleStore.service.ProductSkuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计 服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class ProductSkuServiceImpl extends ServiceImpl<ProductSkuMapper, ProductSku> implements ProductSkuService {

    @Override
    public ResultVo SelectByAll() {
        return null;
    }

    @Override
    public ResultVo SelectById(String Id) {
        return null;
    }

    @Override
    public ResultVo UpdateByModel(ProductSku productSku) {
        return null;
    }

    @Override
    public ResultVo DeleteById(String Id) {
        return null;
    }

    @Override
    public ResultVo AddModel(ProductSku productSku) {
        return null;
    }


}
