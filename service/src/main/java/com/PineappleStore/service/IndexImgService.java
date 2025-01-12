package com.PineappleStore.service;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.IndexImg;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 轮播图  服务类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
public interface IndexImgService extends IService<IndexImg> {


    ResultVo SelectByAll();

    ResultVo SelectByAllStatus();

    ResultVo SelectById(String Id);

    ResultVo SelectByName(String Name);

    ResultVo UpdateByModel(IndexImg IndexImg);

    ResultVo UpdateStatusById(String Id);

    ResultVo DeleteById(String Id);

    ResultVo AddModel(IndexImg IndexImg);

    boolean SelectByIdForBoolean(String Id);

    boolean SelectByNameForBoolean(String Name);

}
