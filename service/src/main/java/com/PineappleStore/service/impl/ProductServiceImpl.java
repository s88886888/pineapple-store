package com.PineappleStore.service.impl;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ProductMapper;
import com.PineappleStore.entity.Product;
import com.PineappleStore.service.ProductService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * <p>
 * 商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表 服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {


    @Autowired
    private ProductMapper productMapper;

    @Override
    public ResultVo SelectByAll() {

        QueryWrapper<Product> wrapper = new QueryWrapper<>();

        List<Product> productList = productMapper.selectList(wrapper);
        
        return new ResultVo("查询成功", StatusVo.success, productList);

    }
}
