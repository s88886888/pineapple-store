package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Product;
import com.PineappleStore.service.ProductService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {
        return productService.SelectByAll();

    }


    @GetMapping("/getList")
    @ApiOperation(value = "获取所有商品数据（含图片价格）", notes = "获取所有商品数据包含图片价格")
    public ResultVo SelectAllForProductImgAndProductSku(@RequestParam int current, @RequestParam int size) {
        ResultVo resultVo = productService.SelectByAllForProductImgAndProductSku(current, size);
        return resultVo;
    }


    @GetMapping("/Id/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable int id) {
        ResultVo resultVo = productService.SelectById(id);

        return resultVo;
    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条商品数据（含图片）", notes = "根据ID获取一条商品数据（含图片）")
    public ResultVo SelectByIdForProductImg(@PathVariable int id) {

        return productService.SelectByIdForProductImg(id);

    }


    @GetMapping("/getProductId/{id}")
    @ApiOperation(value = "根据一条id获取商品（图片价格）", notes = "根据一条id获取商品（图片价格）")
    public ResultVo selectByIdForProductImgAndProductSku(@PathVariable String id) {

        return productService.selectByIdForProductImgAndProductSku(id);

    }


    @GetMapping("/getProductName{name}")
    @ApiOperation(value = "根据商品名字查找（图片价格）", notes = "根据一条id获取商品（图片价格）")
    public ResultVo selectByNameForProductImgAndProductSku(@PathVariable String name, @RequestParam int current, @RequestParam int size) {

        return productService.selectByNameForProductImgAndProductSku(name, current, size);

    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody Product product) {

        return productService.UpdateByModel(product);

    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable String id) {
        return productService.DeleteById(id);


    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody Product product) {
        return productService.AddModel(product);
    }

    //关联商品分类等级是1 的商品
    @GetMapping("/SelectByCategoryStar/{star}")
    @ApiOperation(value = "根据商品分类推荐等级商品", notes = "1：为轮播图  2为今日特价")
    public ResultVo SelectByCategoryStar(@PathVariable int star) {
        return productService.SelectByCategoryStar(star);
    }


    @GetMapping("/selectAllByCategoryId/{id}")
    @ApiOperation(value = "根据商品分类id获取商品", notes = "根据商品分类id获取商品")
    public ResultVo selectAllByCategoryId(@PathVariable String id) {

        return productService.selectAllByCategoryIdForProductImgAndProductSku(id);


    }

    @GetMapping("/getProduct/{id}")
    @ApiOperation(value = "根据字段CategoryId进行分页查询所有商品", notes = "根据字段CategoryId进行分页查询所有商品")
    public ResultVo SelectByCategoryStar(@PathVariable int id, @RequestParam int current, @RequestParam int size) {

        ResultVo resultVo = productService.selectByCategoryId(id, current, size);

        return resultVo;
    }


}

