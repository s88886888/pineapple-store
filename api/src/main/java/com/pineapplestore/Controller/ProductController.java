package com.pineapplestore.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Product;
import com.PineappleStore.service.ProductService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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


    @GetMapping("/getList")
    public ResultVo SelectAllForProductImg() {
        ResultVo resultVo = productService.SelectAllForProductImg();
        return resultVo;
    }


    @GetMapping("/Id/{id}")
    public ResultVo SelectById(@PathVariable int id) {
        ResultVo resultVo = productService.SelectById(id);

        return resultVo;
    }

    @GetMapping("/getId/{id}")
    public ResultVo SelectByIdForProductImg(@PathVariable int id) {

       return productService.SelectByIdForProductImg(id);


    }

    @PutMapping("/")
    public ResultVo UpdateByModel(@RequestBody Product product) {

        ResultVo resultVo = productService.UpdateByModel(product);

        return resultVo;
    }

    @DeleteMapping("/{id}")
    public ResultVo DeleteById(@PathVariable String id) {
        return productService.DeleteById(id);


    }

    @PostMapping("/")
    public ResultVo AddModel(@RequestBody Product product) {

        ResultVo resultVo = productService.AddModel(product);

        return resultVo;
    }

    //关联商品分类等级是1 的商品
    @GetMapping("/SelectByCategoryStar/{star}")
    public ResultVo SelectByCategoryStar(@PathVariable int star) {


        ResultVo resultVo = productService.SelectByCategoryStar(star);

        return resultVo;
    }


    @GetMapping("/selectAllByCategoryId/{id}")
    public ResultVo selectAllByCategoryId(@PathVariable String id) {

        ResultVo resultVo = productService.selectAllByCategoryId(id);

        return resultVo;
    }


}

