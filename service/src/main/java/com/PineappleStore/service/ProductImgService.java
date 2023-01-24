package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.ProductImg;
import com.PineappleStore.entity.imgVo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品图片  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface ProductImgService extends IService<ProductImg> {


    ResultVo SelectByAll();

    ResultVo SelectById(int Id);


    ResultVo UpdateByModel(ProductImg ProductImg);

    ResultVo DeleteById(String Id);

    ResultVo AddModel(ProductImg ProductImg);

    ResultVo AddModelList(imgVo list);


    boolean SelectByIdForBoolean(String Id);


    //是否已经有 推荐相片 不允许为设置两个
    boolean SelectByProductStarForBoolean(String Id);


}
