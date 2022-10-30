package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品分类 服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface CategoryService extends IService<Category> {


    ResultVo SelectByAll();

    ResultVo SelectById(int Id);


    ResultVo SelectByCategoryStar(int Star);


    boolean SelectByCategoryStarCount();

    ResultVo UpdateByModel(Category Category);

    ResultVo DeleteById(int Id);

    ResultVo AddModel(Category Category);

    boolean SelectByIdForBoolean(int Id);

    boolean SelectByNameForBoolean(String Name);


}
