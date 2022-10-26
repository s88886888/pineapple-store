package com.PineappleStore.service.impl;


import com.PineappleStore.ResultVo.ProductVo;
import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ProductMapper;
import com.PineappleStore.entity.Category;
import com.PineappleStore.entity.Product;
import com.PineappleStore.entity.ProductImg;
import com.PineappleStore.service.ProductService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
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
    private ProductMapper ProductMapper;

    @Override
    public ResultVo SelectByAll() {

        QueryWrapper<Product> wrapper = new QueryWrapper<>();

        List<Product> productList = ProductMapper.selectList(wrapper);

        return new ResultVo("查询成功", StatusVo.success, productList);

    }


    @Override
    public ResultVo SelectById(int Id) {
        Product product = ProductMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, product);
    }


    @Override
    public ResultVo SelectByIdForProductImg(int Id) {

        ProductVo product = ProductMapper.selectJoinOne(ProductVo.class, new MPJLambdaWrapper<ProductVo>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(Product::getProductId, Id)
                .last("limit 1"));

        return new ResultVo("查询成功", StatusVo.success, product);
    }


    @Override
    public ResultVo SelectAllForProductImg() {
        List<ProductVo> ProductVo = ProductMapper.selectJoinList(ProductVo.class, new MPJLambdaWrapper<ProductVo>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId));

        return new ResultVo("查询成功", StatusVo.success, ProductVo);
    }


    //关联商品分类等级是1 的商品
    @Override
    public ResultVo SelectBygetCategoryStar() {


        QueryWrapper<Product> wrapper = new QueryWrapper<>();
        List<Product> product = ProductMapper.selectJoinList(Product.class, new MPJLambdaWrapper<Product>()
                .selectAll(Product.class)
                .leftJoin(Category.class, Category::getCategoryId, Product::getCategoryId)
                .eq(Category::getCategoryStar, 1)
        );
        return new ResultVo("查询成功", StatusVo.success, product);

    }

    @Override
    public ResultVo SelectByProductCount(int num) {

        QueryWrapper<Product> wrapper = new QueryWrapper<>();
        Long productCount = ProductMapper.selectCount(wrapper);

        return new ResultVo("查询成功", StatusVo.success, productCount);
    }

    @Override
    public ResultVo selectAllByCategoryId(String Id) {

        List<ProductVo> ProductVo = ProductMapper.selectJoinList(ProductVo.class, new MPJLambdaWrapper<ProductVo>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(Product::getCategoryId, Id)
        );

        return new ResultVo("查询成功", StatusVo.success, ProductVo);

    }

    @Override
    public ResultVo AddModel(Product product) {

        if (SelectByNameForBoolean(product.getProductName())) {
            return new ResultVo("增加失败:已经存在相同名字", StatusVo.Error, product);
        } else {
            int i = ProductMapper.insert(product);
            if (i > 0) {
                return new ResultVo("增加成功", StatusVo.success, null);
            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
            }
        }
    }


    @Override
    public boolean SelectByIdForBoolean(String Id) {

        Product product = ProductMapper.selectById(Id);

        return product != null;
    }


    @Override
    public ResultVo DeleteById(String Id) {

        boolean Checkmodel = SelectByIdForBoolean(Id);
        if (Checkmodel) {
            int product = ProductMapper.deleteById(Id);
            if (product > 0) {
                return new ResultVo("删除成功", StatusVo.success, Checkmodel);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, Checkmodel);
            }

        } else {
            return new ResultVo("删除失败：这个商品不存在", StatusVo.Error, Checkmodel);
        }

    }


    @Override
    public ResultVo UpdateByModel(Product product) {


        if (SelectByIdForBoolean(product.getProductId())) {
            ProductMapper.updateById(product);
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
        }

    }

    @Override
    public boolean SelectByNameForBoolean(String Name) {

        QueryWrapper<Product> wrapper = new QueryWrapper<>();

        wrapper.lambda().select(Product::getProductName).eq(Product::getProductName, Name);

        Product product = ProductMapper.selectOne(wrapper);

        return product != null;


    }
}
