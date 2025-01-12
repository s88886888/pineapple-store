package com.PineappleStore.serviceImpl;


import com.PineappleStore.RedisService.RedisUtil;
import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ProductMapper;
import com.PineappleStore.entity.*;
import com.PineappleStore.service.ProductService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;


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

    @Resource
    private RedisUtil redisUtil;


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
    public ResultVo SelectImgListById(String Id) {

        MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()

                .selectAll(Product.class)
                .selectCollection(ProductImg.class, ProductVo::getImgList)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(Product::getProductId, Id);

        List<ProductVo> data = ProductMapper.selectJoinList(ProductVo.class, wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);
    }


    @Override
    public ResultVo SelectByIdForProductImg(int Id) {

        ProductVo product = ProductMapper.selectJoinOne(ProductVo.class, new MPJLambdaWrapper<Product>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(Product::getProductId, Id)
                .last("limit 1"));

        return new ResultVo("查询成功", StatusVo.success, product);
    }


    @Override
    public ResultVo SelectByAllForProductImgAndProductSku(int current, int size) {


        MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()
                .select(Category::getCategoryName)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId)
                .selectAll(Product.class).eq(Product::getProductStatus, 1)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId).eq(ProductImg::getIsMain, 1)
                .leftJoin(Category.class, Category::getCategoryId, Product::getCategoryId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId).eq(ProductSku::getSkuStar, 1);
        IPage<ProductVo> data = ProductMapper.selectJoinPage(new Page<>(current, size), ProductVo.class, wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);

    }


    @Override
    public ResultVo SelectLikeNameForProductImgAndProductSku(String Name, int current, int size) {


        MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()
                .select(Category::getCategoryName)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId)
                .selectAll(Product.class).eq(Product::getProductStatus, 1)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId).eq(ProductImg::getIsMain, 1)
                .leftJoin(Category.class, Category::getCategoryId, Product::getCategoryId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId).eq(ProductSku::getSkuStar, 1)
                .like(Product::getProductName, Name);


        IPage<ProductVo> data = ProductMapper.selectJoinPage(new Page<>(current, size), ProductVo.class, wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);
    }


    @Override
    public ResultVo SelectByAllPage(int current, int size) {
        MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()
                .select(Category::getCategoryName)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId)
                .selectAll(Product.class)
                .selectCollection(ProductImg.class, ProductVo::getImages)

                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .leftJoin(Category.class, Category::getCategoryId, Product::getCategoryId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId).eq(ProductSku::getSkuStar, 1);

        IPage<ProductVo> data = ProductMapper.selectJoinPage(new Page<>(current, size), ProductVo.class, wrapper);


        return new ResultVo("查询成功", StatusVo.success, data);
    }


    //关联商品分类等级是1 的商品
    @Override
    public ResultVo SelectByCategoryStar(int star) {


        if (redisUtil.hasKey("CategoryStar"))
        {
            return new ResultVo("查询成功", StatusVo.success, redisUtil.get("CategoryStar"));
        }
        else
        {
            List<ProductVo> product = ProductMapper.selectJoinList(ProductVo.class, new MPJLambdaWrapper<Product>()
                    .selectAll(Product.class)
                    .selectAll(ProductImg.class)
                    .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts)
                    .leftJoin(Category.class, Category::getCategoryId, Product::getCategoryId).eq(Product::getProductPreferred, 1)
                    .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId).eq(ProductImg::getIsMain, 1)
                    .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId).eq(ProductSku::getSkuStar, 1)
                    .eq(Category::getCategoryStar, star)
            );
            redisUtil.set("CategoryStar",product);
            return new ResultVo("查询成功", StatusVo.success, product);
        }
    }

    @Override
    public ResultVo selectAllByCategoryIdForProductImgAndProductSku(String Id) {

        List<ProductVo> ProductVo = ProductMapper.selectJoinList(ProductVo.class, new MPJLambdaWrapper<Product>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId)
                .eq(Product::getCategoryId, Id)
        );

        return new ResultVo("查询成功", StatusVo.success, ProductVo);

    }

    @Override
    public ResultVo selectByIdForProductImgAndProductSku(String Id) {

        List<ProductVo> ProductVo = ProductMapper.selectJoinList(ProductVo.class, new MPJLambdaWrapper<Product>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId)
                .eq(Product::getProductId, Id)
        );

/*        System.out.println("当前页码："+page.getCurrent());

        System.out.println("每页显示："+page.getSize());

        System.out.println("一共多少页："+page.getPages());

        System.out.println("一共多少条："+page.getTotal());*/

        return new ResultVo("查询成功", StatusVo.success, ProductVo);
    }

    @Override
    public ResultVo selectByNameForProductImgAndProductSku(String Id, String Name, int categoryId, String content, int status, int current, int size) {

        MPJLambdaWrapper<Product> wrapper = new MPJLambdaWrapper<Product>()
                .select(Category::getCategoryName)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId)
                .selectAll(Product.class).eq(Product::getProductStatus, status)
                .selectAll(ProductImg.class)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId).eq(ProductImg::getIsMain, 1)
                .leftJoin(Category.class, Category::getCategoryId, Product::getCategoryId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId).eq(ProductSku::getSkuStar, 1);

        if (Id != null) {
            wrapper.like(Product::getProductId, Id);
        }
        if (Name != null) {
            wrapper.like(Product::getProductName, Name);
        }
        if (categoryId != 0) {
            wrapper.eq(Product::getCategoryId, categoryId);
        }
        if (content != null) {
            wrapper.like(Product::getContent, content);
        }
        if (content != null) {
            wrapper.like(Product::getContent, content);
        }


        IPage<ProductVo> data = ProductMapper.selectJoinPage(new Page<>(current, size), ProductVo.class, wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);
    }

    @Override
    public ResultVo AddModel(Product product) {
            product.setProductId(String.valueOf(UUID.randomUUID()));
            product.setSoldNum(0);
            product.setCreateTime(new Date());
            product.setUpdateTime(new Date());
            int i = ProductMapper.insert(product);
            if (i > 0) {
                redisUtil.del("CategoryStar");
                redisUtil.del("SelectByParent");
                return new ResultVo("增加成功", StatusVo.success, product);
            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
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

//            MPJLambdaWrapper<ProductImg> wrapper =new MPJLambdaWrapper<ProductImg>().
//                    selectAll(ProductImg.class).
//                    eq(ProductImg::getItemId,Id);
//            List<ProductImg>  data =productImgMapper.selectList(wrapper);
//
//            System.out.println(data+"-----------------------------------------------");
////
////            //偷懒不写 事务回滚  你是一个成熟的系统了 一定不会断网，断电，宕机。
//            for (ProductImg datum : data) {
//                productImgMapper.deleteById(datum.getId());
//                int isok = productImgMapper.deleteById(datum.getId());
//                if(isok<0)
//                {
//                    return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
//                }
//            }

            int product = ProductMapper.deleteById(Id);
            if (product > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
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
            product.setUpdateTime(new Date());
            ProductMapper.updateById(product);
            return new ResultVo("更新成功", StatusVo.success, product);
        } else {
            return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateStatus(Product product) {
        if (SelectByIdForBoolean(product.getProductId())) {


            Product data = ProductMapper.selectById(product.getProductId());

            if (data.getProductStatus().equals(0)) {
                data.setProductStatus(1);
            } else {
                data.setProductStatus(0);
            }

            ProductMapper.updateById(data);
            redisUtil.del("CategoryStar");
            redisUtil.del("SelectByParent");
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
        }
    }

    @Override
    public ResultVo UpdateRecommend(Product product) {
        Product data = ProductMapper.selectOne(new LambdaQueryWrapper<Product>()
                .eq(Product::getProductId, product.getProductId()));

        if (data == null) {
            return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
        } else {
            Long sternum = ProductMapper.selectCount(new MPJLambdaWrapper<Product>()
                    .select(Product::getProductId)
                    .eq(Product::getCategoryId, data.getCategoryId())
                    .eq(Product::getProductPreferred, 1));

            if (data.getProductPreferred().equals(1)) {
                data.setProductPreferred(0);
            } else {
                if (sternum >= 7) {
                    return new ResultVo("更新失败，菠萝推荐的商品数量不能超过7个", StatusVo.Error, null);
                } else {
                    data.setProductPreferred(1);
                }
            }
            ProductMapper.updateById(data);
            redisUtil.del("CategoryStar");
            redisUtil.del("SelectByParent");
            return new ResultVo("更新成功", StatusVo.success, null);
        }

    }


    @Override
    //qwq
    public ResultVo UpdateStar(Product product) {

        Product data = ProductMapper.selectOne(new LambdaQueryWrapper<Product>()
                .eq(Product::getProductId, product.getProductId()));

        if (data == null) {
            return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
        } else {
            Long sternum = ProductMapper.selectCount(new MPJLambdaWrapper<Product>()
                    .select(Product::getProductId)
                    .eq(Product::getCategoryId, data.getCategoryId())
                    .eq(Product::getProductStar, 1));

            if (data.getProductStar().equals(1)) {
                data.setProductStar(0);
            } else {
                if (sternum >= 24) {
                    return new ResultVo("更新失败，轮播图推荐商品数量不能超过24个", StatusVo.Error, null);
                } else {
                    data.setProductStar(1);
                }
            }
            ProductMapper.updateById(data);
            redisUtil.del("CategoryStar");
            redisUtil.del("SelectByParent");
            return new ResultVo("更新成功", StatusVo.success, null);
        }
    }


    @Override
    public ResultVo selectByCategoryId(int id, int current, int size) {

        IPage<ProductVo> ProductVo = ProductMapper.selectJoinPage(new Page<>(current, size), ProductVo.class, new MPJLambdaWrapper<Product>()
                .selectAll(Product.class)
                .selectAll(ProductImg.class)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts).eq(ProductSku::getSkuStar, 1)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId)
                .eq(Product::getCategoryId, id)
                .eq(ProductImg::getIsMain, 1)
        );

        return new ResultVo("查询成功", StatusVo.success, ProductVo);
    }

    @Override
    public ResultVo selectByItemid(String Id) {
        MPJLambdaWrapper<Product> mpjLambdaWrapper = new MPJLambdaWrapper<Product>()
                .selectAll(Product.class)
                .selectCollection(ProductImg.class, ProductVo::getImgList)
                .selectCollection(ProductSku.class, ProductVo::getSkuList)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId).eq(ProductSku::getStatus, 1)
                .eq(Product::getProductId, Id);


        List<ProductVo> productVoList = ProductMapper.selectJoinList(ProductVo.class, mpjLambdaWrapper);
        return new ResultVo("查询成功", StatusVo.success, productVoList);
    }

}
