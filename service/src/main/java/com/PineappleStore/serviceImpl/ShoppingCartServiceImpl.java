package com.PineappleStore.serviceImpl;


import com.PineappleStore.RedisService.RedisUtil;
import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ShoppingCartMapper;
import com.PineappleStore.entity.*;
import com.PineappleStore.service.ShoppingCartService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 购物车  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {


    @Resource
    private ShoppingCartMapper shoppingCartMapper;


    @Resource
    private RedisUtil redisUtil;


    @Override
    public ResultVo SelectByAll() {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        List<ShoppingCart> IndexImgList = shoppingCartMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, IndexImgList);
    }

    @Override
    public ResultVo SelectById(int Id) {
        ShoppingCart ShoppingCart = shoppingCartMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, ShoppingCart);
    }

    @Override
    public ResultVo SelectByUserid(String Id) {

        if (redisUtil.hasKey("shop" + Id)) {
            return new ResultVo("查询成功", StatusVo.success, redisUtil.get("shop" + Id));
        } else {

            List<ShoppingCartVo> ShoppingCartVo = shoppingCartMapper.selectJoinList(ShoppingCartVo.class, new MPJLambdaWrapper<ShoppingCart>()
                    .select(Product::getProductName, Product::getCategoryId)
                    .select(ProductImg::getUrl).eq(ProductImg::getIsMain, 1)
                    .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuName)
                    .selectAll(ShoppingCart.class)
                    .leftJoin(Product.class, Product::getProductId, ShoppingCart::getProductId)
                    .leftJoin(ProductImg.class, ProductImg::getItemId, ShoppingCart::getProductId)
                    .leftJoin(ProductSku.class, ProductSku::getSkuId, ShoppingCart::getSkuId)
                    .eq(ShoppingCart::getUserId, Id)
            );

            if (ShoppingCartVo.size() > 0) {
                redisUtil.set("shop" + ShoppingCartVo.get(0).getUserId(), ShoppingCartVo, 60 * 5);
            }

            return new ResultVo("查询成功", StatusVo.success, ShoppingCartVo);
        }


    }

    @Override
    public ResultVo SelectByIdForproduct(int Id) {

        ShoppingCartVo ShoppingCartVo = shoppingCartMapper.selectJoinOne(ShoppingCartVo.class, new MPJLambdaWrapper<ShoppingCart>()

                .select(Product::getProductName, Product::getCategoryId)
                .select(ProductImg::getUrl).eq(ProductImg::getIsMain, 1)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts)
                .selectAll(ShoppingCart.class)
                .leftJoin(Product.class, Product::getProductId, ShoppingCart::getProductId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, ShoppingCart::getProductId)
                .leftJoin(ProductSku.class, ProductSku::getSkuId, ShoppingCart::getSkuId)
                .eq(ShoppingCart::getCartId, Id)
        );

        return new ResultVo("查询成功", StatusVo.success, ShoppingCartVo);
    }


    @Override
    public ResultVo AddModel(ShoppingCart shoppingCart) {

        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .select(ShoppingCart::getUserId, ShoppingCart::getProductId, ShoppingCart::getCartId, ShoppingCart::getCartNum)
                .eq(ShoppingCart::getUserId, shoppingCart.getUserId())
                .eq(ShoppingCart::getProductId, shoppingCart.getProductId())
                .eq(ShoppingCart::getSkuId, shoppingCart.getSkuId());

        ShoppingCart shoppingCartOne = shoppingCartMapper.selectOne(wrapper);



        if (shoppingCartOne != null) {

            shoppingCart.setCartId(shoppingCartOne.getCartId());
            shoppingCart.setCartTime(shoppingCartOne.getCartTime());

            int cartNum = Integer.parseInt(shoppingCartOne.getCartNum());

            if (cartNum >= 10) {
                return new ResultVo("增加失败:数量不能超过10！", 203, null);
            }
            shoppingCart.setCartNum(String.valueOf(cartNum + 1));
            redisUtil.del("shop" + shoppingCart.getUserId());
            return UpdateByModel(shoppingCart);

        } else {

            shoppingCart.setCartTime(String.valueOf(new Date()));
            shoppingCart.setCartNum("1");
            int i = shoppingCartMapper.insert(shoppingCart);

            MPJLambdaWrapper<ShoppingCart> queryWrapper = new MPJLambdaWrapper<ShoppingCart>()
                    .selectAll(ShoppingCart.class)
                    .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts, ProductSku::getSkuId, ProductSku::getSkuName)
                    .select(ProductImg::getUrl)
                    .select(Product::getProductName)
                    .leftJoin(ProductSku.class, ProductSku::getSkuId, ShoppingCart::getSkuId)
                    .leftJoin(ProductImg.class, ProductImg::getItemId, ShoppingCart::getProductId).eq(ProductImg::getIsMain, 1)
                    .leftJoin(Product.class, Product::getProductId, ShoppingCart::getProductId)
                    .eq(ShoppingCart::getCartId, shoppingCart.getCartId());
            ShoppingCartVo data = shoppingCartMapper.selectJoinOne(ShoppingCartVo.class, queryWrapper);

            redisUtil.del("shop" + shoppingCart.getUserId());
            if (i > 0) {
                return new ResultVo("添加购物车成功", StatusVo.success, data);

            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
            }
        }

    }

    @Override
    public boolean SelectByIdForBoolean(int Id) {
        ShoppingCart ShoppingCart = shoppingCartMapper.selectById(Id);
        return ShoppingCart != null;
    }

    @Override
    public ResultVo DeleteById(int Id) {


        LambdaQueryWrapper<ShoppingCart> wrapper = new LambdaQueryWrapper<ShoppingCart>()
                .select(ShoppingCart::getCartId, ShoppingCart::getUserId)
                .eq(ShoppingCart::getCartId, Id);

        ShoppingCart data = shoppingCartMapper.selectOne(wrapper);

        if (data != null) {


            int category = shoppingCartMapper.deleteById(data.getCartId());
            if (category > 0) {

                redisUtil.del("shop" + data.getUserId());

                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该数据不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateByModel(ShoppingCart shoppingCart) {



        if (SelectByIdForBoolean(shoppingCart.getCartId())) {

            shoppingCartMapper.updateById(shoppingCart);
            redisUtil.del("shop" + shoppingCart.getUserId());
            return new ResultVo("修改购物成功", StatusVo.created, shoppingCart);
        } else {

            return new ResultVo("更新失败，该数据不存在", StatusVo.Error, null);
        }


    }


}
