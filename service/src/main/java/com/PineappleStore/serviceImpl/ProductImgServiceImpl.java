package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.ProductImgMapper;
import com.PineappleStore.entity.ProductImg;
import com.PineappleStore.entity.imgVo;
import com.PineappleStore.service.ProductImgService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 * 商品图片  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class ProductImgServiceImpl extends ServiceImpl<ProductImgMapper, ProductImg> implements ProductImgService {


    @Autowired
    private ProductImgMapper productImgMapper;

    @Override
    public ResultVo SelectByAll() {

        QueryWrapper<ProductImg> wrapper = new QueryWrapper<>();

        List<ProductImg> productList = productImgMapper.selectList(wrapper);

        return new ResultVo("查询成功", StatusVo.success, productList);

    }


    @Override
    public ResultVo SelectById(int Id) {
        ProductImg ProductImg = productImgMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, ProductImg);
    }


    @Override
    public ResultVo AddModel(ProductImg ProductImg) {


        ProductImg.setId(String.valueOf(UUID.randomUUID()));
        ProductImg.setCreatedTime(new Date());
        ProductImg.setUpdatedTime(new Date());
        int i = productImgMapper.insert(ProductImg);
        if (i > 0) {
            return new ResultVo("增加成功", StatusVo.success, null);
        } else {
            return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
        }
    }

    @Override
    public ResultVo AddModelList(imgVo list) {


        for (ProductImg item : list.getImgList()) {
            item.setId(String.valueOf(UUID.randomUUID()));
            item.setIsMain(0);
            item.setItemId(list.getItemId());
            item.setCreatedTime(new Date());
            item.setUpdatedTime(new Date());
            productImgMapper.insert(item);
        }

        return new ResultVo("商品列表数据变更成功", StatusVo.success, null);
    }


    @Override
    public boolean SelectByIdForBoolean(String Id) {

        ProductImg ProductImg = productImgMapper.selectById(Id);

        return ProductImg != null;
    }

    @Override
    public boolean SelectByProductStarForBoolean(String id) {

        QueryWrapper<ProductImg> wrapper = new QueryWrapper<>();

        wrapper.lambda().select(ProductImg::getProductStar).eq(ProductImg::getProductStar, 1)
                .eq(ProductImg::getItemId, id);

        ProductImg ProductImg = productImgMapper.selectOne(wrapper);

        return ProductImg != null;
    }


    @Override
    public ResultVo DeleteById(String Id) {


        if (SelectByIdForBoolean(Id)) {
            int product = productImgMapper.deleteById(Id);
            if (product > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：这个商品不存在", StatusVo.Error, null);
        }

    }


    @Override
    public ResultVo UpdateByModel(ProductImg ProductImg) {


        if (SelectByProductStarForBoolean(ProductImg.getItemId())) {


            if (SelectByIdForBoolean(ProductImg.getId())) {
                productImgMapper.updateById(ProductImg);
                return new ResultVo("更新成功", StatusVo.success, null);
            } else {
                return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
            }
        } else {
            return new ResultVo("增加失败：不允许设置两张图片", StatusVo.Error, null);
        }
    }

    @Override
    public ResultVo UpdateByUrl(ProductImg productImg) {
        LambdaQueryWrapper<ProductImg> wrapper = new LambdaQueryWrapper<ProductImg>()
                .eq(ProductImg::getIsMain, 1)
                .eq(ProductImg::getItemId, productImg.getItemId());

        ProductImg data = productImgMapper.selectOne(wrapper);

        if (data == null) {
            return new ResultVo("更新失败：找不到该商品", StatusVo.Error, null);
        }


        data.setUrl(productImg.getUrl());


        productImgMapper.updateById(data);

        return new ResultVo("更新成功", StatusVo.success, null);
    }

}
