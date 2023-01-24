package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ProductSkuMapper;
import com.PineappleStore.entity.Product;
import com.PineappleStore.entity.ProductImg;
import com.PineappleStore.entity.ProductSku;
import com.PineappleStore.entity.ProductSkuVo;
import com.PineappleStore.service.ProductSkuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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


    @Autowired
    private ProductSkuMapper productSkuMapper;


    @Override
    public ResultVo SelectPage(int current, int size) {

        MPJLambdaWrapper<ProductSku> wrapper = new MPJLambdaWrapper<ProductSku>()
                .selectAll(ProductSku.class)
                .selectAll(Product.class)
                .select(ProductImg::getUrl)
                .leftJoin(Product.class, Product::getProductId, ProductSku::getProductId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(ProductImg::getIsMain, 1)
                .ge(ProductSku::getStock, 100);

        IPage<ProductSkuVo> data = productSkuMapper.selectJoinPage(new Page<>(current, size), ProductSkuVo.class, wrapper);

        return new ResultVo("查询成功", StatusVo.success, data);


    }

    @Override
    public ResultVo SelectPage(String productId, String productName, String SkuId, String SkuName, int Stock, int Status, int current, int size) {
        MPJLambdaWrapper<ProductSku> wrapper = new MPJLambdaWrapper<ProductSku>()
                .selectAll(ProductSku.class)
                .selectAll(Product.class)
                .select(ProductImg::getUrl)
                .leftJoin(Product.class, Product::getProductId, ProductSku::getProductId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(ProductImg::getIsMain, 1)
                .eq(ProductSku::getStatus, Status);

        if (productId != null && !productId.equals("")) {
            wrapper.like(Product::getProductId, productId);
        }
        if (productName != null && !productName.equals("")) {
            wrapper.like(Product::getProductName, productName);
        }
        if (SkuId != null && !SkuId.equals("")) {
            wrapper.eq(ProductSku::getSkuId, SkuId);
        }
        if (SkuName != null && !SkuName.equals("")) {
            wrapper.like(ProductSku::getSkuName, SkuName);
        }
        if (Stock == 1) {
            wrapper.lt(ProductSku::getStock, 100);
        } else {
            wrapper.ge(ProductSku::getStock, 100);
        }


        IPage<ProductSkuVo> data = productSkuMapper.selectJoinPage(new Page<>(current, size), ProductSkuVo.class, wrapper);

        return new ResultVo("查询成功", StatusVo.success, data);
    }

    @Override
    public ResultVo SelectById(String Id) {
        return new ResultVo("查询成功", StatusVo.success, productSkuMapper.selectById(Id));
    }

    @Override
    public ResultVo UpdateByModel(ProductSku productSku) {

        ProductSku data = productSkuMapper.selectById(productSku.getSkuId());

        if (data == null) {

            return new ResultVo("修改失败", StatusVo.Error, null);

        } else {
            productSku.setUpdateTime(new Date());
            productSkuMapper.updateById(productSku);
            return new ResultVo("修改成功！", StatusVo.success, null);
        }


    }

    @Override
    public ResultVo UpdateStock(ProductSku productSku) {


        ProductSku data = productSkuMapper.selectOne(new LambdaQueryWrapper<ProductSku>()
                .eq(ProductSku::getSkuId, productSku.getSkuId()));

        if (data == null) {
            return new ResultVo("补货失败，不存该库存", StatusVo.Error, null);
        } else {
            data.setStock(productSku.getStock() + data.getStock());

            int i = productSkuMapper.updateById(data);
            if (i < 0) return new ResultVo("补货失败,请联系管理员", StatusVo.wrong, null);
            return new ResultVo("补货成功", StatusVo.success, null);
        }
    }

    @Override
    public ResultVo DeleteById(String Id) {
        return null;
    }

    @Override
    public ResultVo AddModel(ProductSku productSku) {
        return null;
    }

    @Override
    public ResultVo Delete(String Id) {

//        ProductSku data = productSkuMapper.selectById(Id);

        return new ResultVo("不支持删除，请下架，订单中存在该库存信息！", StatusVo.Error, null);

//        if (data==null)
//        {
//            return new ResultVo("删除失败，不存该库存", StatusVo.Error, null);
//        }
//        else
//        {
//            productSkuMapper.deleteById(data);
//            return new ResultVo("删除成功", StatusVo.success, null);
//        }
    }
}
