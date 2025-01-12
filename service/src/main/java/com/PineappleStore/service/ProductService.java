package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表 服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface ProductService extends IService<Product> {


    ResultVo SelectByAll();

    ResultVo SelectById(int Id);

    ResultVo SelectImgListById(String Id);

    ResultVo selectByItemid(String Id);

    ResultVo SelectByAllForProductImgAndProductSku(int current, int size);

    ResultVo SelectLikeNameForProductImgAndProductSku(String Name, int current, int size);


    ResultVo SelectByAllPage(int current, int size);

    ResultVo SelectByIdForProductImg(int Id);


    //1为轮播图 ，2为商品推送板块
    ResultVo SelectByCategoryStar(int star);

    ResultVo UpdateByModel(Product Product);

    ResultVo UpdateStatus(Product Product);

    ResultVo UpdateRecommend(Product Product);

    ResultVo UpdateStar(Product Product);

    ResultVo DeleteById(String Id);

    ResultVo AddModel(Product Product);


    ResultVo selectAllByCategoryIdForProductImgAndProductSku(String Id);

    ResultVo selectByCategoryId(int id, int current, int size);

    ResultVo selectByIdForProductImgAndProductSku(String Id);

    ResultVo selectByNameForProductImgAndProductSku(String Id, String Name, int categoryId, String content, int status, int current, int size);

    boolean SelectByIdForBoolean(String Id);


}
