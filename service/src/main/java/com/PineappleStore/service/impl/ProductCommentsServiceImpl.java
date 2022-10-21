package com.PineappleStore.service.impl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.dao.ProductCommentsMapper;
import com.PineappleStore.entity.ProductComments;
import com.PineappleStore.service.ProductCommentsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品评价  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class ProductCommentsServiceImpl extends ServiceImpl<ProductCommentsMapper, ProductComments> implements ProductCommentsService {


    @Override
    public ResultVo SelectByAll() {
        return null;
    }
}
