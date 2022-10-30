package com.PineappleStore.service.impl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ShoppingCartMapper;
import com.PineappleStore.entity.ShoppingCart;
import com.PineappleStore.service.ShoppingCartService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


    @Autowired
    private ShoppingCartMapper shoppingCartMapper;


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
    public ResultVo AddModel(ShoppingCart ShoppingCart) {

        ShoppingCart.setCartTime(String.valueOf(new Date()));

        int i = shoppingCartMapper.insert(ShoppingCart);
        if (i > 0) {
            return new ResultVo("增加成功", StatusVo.success, null);
        } else {
            return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
        }

    }

    @Override
    public boolean SelectByIdForBoolean(int Id) {
        ShoppingCart ShoppingCart = shoppingCartMapper.selectById(Id);
        return ShoppingCart != null;
    }

    @Override
    public ResultVo DeleteById(int Id) {

        if (SelectByIdForBoolean(Id)) {
            int category = shoppingCartMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }
        } else {
            return new ResultVo("删除失败：该数据不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateByModel(ShoppingCart ShoppingCart) {

        if (SelectByIdForBoolean(ShoppingCart.getCartId())) {
            shoppingCartMapper.updateById(ShoppingCart);
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该数据不存在", StatusVo.Error, null);
        }

    }


}
