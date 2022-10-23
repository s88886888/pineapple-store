package com.PineappleStore.service.impl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.CategoryMapper;
import com.PineappleStore.entity.Category;
import com.PineappleStore.service.CategoryService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 商品分类 服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {


    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public ResultVo SelectByAll() {
        QueryWrapper<Category> wrapper = new QueryWrapper<>();
        List<Category> categoryList = categoryMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, categoryList);
    }

    @Override
    public ResultVo SelectById(int Id) {
        Category category = categoryMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, category);
    }

    @Override
    public ResultVo AddModel(Category category) {

        if (SelectByNameForBoolean(category.getCategoryName())) {
            return new ResultVo("增加失败:已经存在这个名字", StatusVo.Error, category);
        } else {
            int i = categoryMapper.insert(category);


            if (i > 0) {

                return new ResultVo("增加成功", StatusVo.success, null);
            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
            }


        }
    }

    @Override
    public boolean SelectByIdForBoolean(int Id) {


        Category category = categoryMapper.selectById(Id);
        return category != null;


    }


    @Override
    public ResultVo DeleteById(int Id) {

        boolean Checkmodel = SelectByIdForBoolean(Id);
        if (Checkmodel) {
            int category = categoryMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, Checkmodel);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, Checkmodel);
            }

        } else {
            return new ResultVo("删除失败：这个商品不存在", StatusVo.Error, Checkmodel);
        }

    }


    @Override
    public ResultVo UpdateByModel(Category category) {

        if (SelectByIdForBoolean(category.getCategoryId())) {
            categoryMapper.updateById(category);
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该商品不存在", StatusVo.Error, null);
        }

    }

    @Override
    public boolean SelectByNameForBoolean(String Name) {

        QueryWrapper<Category> wrapper = new QueryWrapper<>();

        wrapper.lambda().select(Category::getCategoryName).eq(Category::getCategoryName, Name);

        Category category = categoryMapper.selectOne(wrapper);

        return category != null;


    }
}
