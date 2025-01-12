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


    ResultVo SelectByAll(int Level);

    ResultVo SelectPage(Integer Id, String Name, String slogan, Integer Status, Integer level, int current, int size);

    ResultVo SelectById(int Id);

    ResultVo SelectByParentId(int parentId, int current, int size);


    ResultVo SelectByCategoryStar(int Star);


    boolean SelectByCategoryStarCount();

    ResultVo UpdateByModel(Category Category);

    ResultVo DeleteById(int Id);

    ResultVo AddModel(Category Category);

    boolean SelectByIdForBoolean(int Id);

    boolean SelectByNameForBoolean(String Name);


    ResultVo SelectByParent();


}
