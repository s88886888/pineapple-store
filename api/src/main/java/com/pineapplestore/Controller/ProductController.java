package com.pineapplestore.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.service.ProductService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表 前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/product")
@Api(value = "商品", tags = "商品信息")
public class ProductController {

    @Autowired
    private ProductService productService;


    @GetMapping("/List")
    public ResultVo SelectByAll() {
        ResultVo resultVo = productService.SelectByAll();
        return resultVo;
    }

}

