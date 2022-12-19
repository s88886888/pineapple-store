package com.PineappleStore.serviceImpl;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.UserCollectMapper;
import com.PineappleStore.entity.*;
import com.PineappleStore.service.UserCollectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-11-09
 */
@Service
public class UserCollectServiceImpl extends ServiceImpl<UserCollectMapper, UserCollect> implements UserCollectService {

    @Autowired
    private UserCollectMapper userCollectMapper;


    @Override
    public ResultVo SelectByAll() {
        QueryWrapper<UserCollect> wrapper = new QueryWrapper<>();
        List<UserCollect> userCollectList = userCollectMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, userCollectList);
    }

    @Override
    public ResultVo SelectById(int Id) {
        UserCollect userCollect = userCollectMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, userCollect);
    }

    @Override
    public ResultVo SelectByUserId(String Id) {


        MPJLambdaWrapper<UserCollect> wrapper = new MPJLambdaWrapper<UserCollect>()
                .selectAll(UserCollect.class)
                .select(Product::getProductName, Product::getContent)
                .select(ProductImg::getUrl)
                .select(ProductSku::getOriginalPrice, ProductSku::getDiscounts)
                .leftJoin(Product.class, Product::getProductId, UserCollect::getProductId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, UserCollect::getProductId)
                .leftJoin(ProductSku.class, ProductSku::getSkuId, UserCollect::getSkuId)
                .eq(ProductImg::getIsMain, 1)
                .eq(UserCollect::getUserId, Id);


        List<UserCollectVo> userCollecList = userCollectMapper.selectJoinList(UserCollectVo.class, wrapper);

        return new ResultVo("查询成功", StatusVo.success, userCollecList);
    }

    @Override
    public ResultVo AddModel(UserCollect userCollect) {


        QueryWrapper<UserCollect> wrapper = new QueryWrapper<>();
        wrapper.lambda().select(UserCollect::getProductId)
                .eq(UserCollect::getProductId, userCollect.getProductId())
                .eq(UserCollect::getUserId, userCollect.getUserId());
        UserCollect Collect = userCollectMapper.selectOne(wrapper);

        if (Collect == null) {
            userCollect.setCreatetime(new Date());
            int i = userCollectMapper.insert(userCollect);
            if (i > 0) {
                return new ResultVo("增加成功", StatusVo.success, null);
            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
            }
        } else {
            return new ResultVo("添加失败:已经存在收藏夹中", StatusVo.Error, null);
        }

    }


    @Override
    public ResultVo DeleteById(int Id) {

        ResultVo checkModel = SelectById(Id);

        if (checkModel != null) {
            int category = userCollectMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该收藏不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo DeleteByUserId(int UserId, String ProductId) {


        QueryWrapper<UserCollect> wrapper = new QueryWrapper<>();
        wrapper.lambda().select(UserCollect::getProductId, UserCollect::getCollectId)
                .eq(UserCollect::getUserId, UserId)
                .eq(UserCollect::getProductId, ProductId);

        UserCollect check = userCollectMapper.selectOne(wrapper);


        if (check != null) {
            int userCollect = userCollectMapper.deleteById(check.getCollectId());
            if (userCollect > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该收藏不存在", StatusVo.Error, null);
        }
    }

    @Override
    public ResultVo UpdateByModel(UserCollect userCollect) {

        ResultVo checkModel = SelectById(userCollect.getCollectId());

        if (checkModel != null) {
            userCollectMapper.updateById(userCollect);
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该轮播图不存在", StatusVo.Error, null);
        }

    }

}
