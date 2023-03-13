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
        return productService.SelectByAllForProductImgAndProductSku(current, size);

    }

    @GetMapping("/getListPage")
    @ApiOperation(value = "新版获取所有商品数据（含图片价格）", notes = "获取所有商品数据包含图片价格")
    public ResultVo SelectByAllPage(@RequestParam int current, @RequestParam int size) {
        return productService.SelectByAllPage(current, size);

    }

    @GetMapping("/List/{id}")
    @ApiOperation(value = "根据商品ID获取所有图片库存信息", notes = "根据商品表的一个ID获取所有关联子表的图片")
    public ResultVo SelectByItemid(@PathVariable String id) {
        return productService.selectByItemid(id);
    }


    @GetMapping("/Id/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable int id) {
        return productService.SelectById(id);
    }


    @GetMapping("/getImgLisbyId/{id}")
    @ApiOperation(value = "嵌套查询根据主表查询图片", notes = "嵌套查询根据主表查询图片")
    public ResultVo SelectImgListById(@PathVariable String id) {
        return productService.SelectImgListById(id);
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


    @GetMapping("/getProductName/{Name}")
    @ApiOperation(value = "模糊查询商品数据（含图片价格）", notes = "根据一条id获取商品（图片价格）")
    public ResultVo SelectLikeNameForProductImgAndProductSku(@PathVariable String Name, @RequestParam int current, @RequestParam int size) {


        return productService.SelectLikeNameForProductImgAndProductSku(Name, current, size);

    }

    @GetMapping("/getProductName")
    @ApiOperation(value = "根据商品名字查找（图片价格）", notes = "根据一条id获取商品（图片价格）")
    public ResultVo selectByNameForProductImgAndProductSku(@RequestParam(required = false) String Id, @RequestParam(required = false) String name,
                                                           @RequestParam(required = false) int categoryId, @RequestParam(required = false) String content,
                                                           @RequestParam(required = false) int status,
                                                           @RequestParam int current, @RequestParam int size) {

        return productService.selectByNameForProductImgAndProductSku(Id, name, categoryId, content, status, current, size);

    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody Product product) {

        return productService.UpdateByModel(product);

    }

    @PutMapping("/updateStatus")
    @ApiOperation(value = "更新状态", notes = "提交model进行更新")
    public ResultVo UpdateStatus(@RequestBody Product Product) {

        return productService.UpdateStatus(Product);

    }


    @PutMapping("/UpdateStar")
    @ApiOperation(value = "更新推荐", notes = "提交model进行更新")
    public ResultVo UpdateStar(@RequestBody Product Product) {

        return productService.UpdateStar(Product);

    }

    @PutMapping("/UpdateRecommend")
    @ApiOperation(value = "更新菠萝推荐", notes = "提交model进行更新")
    public ResultVo UpdateRecommend(@RequestBody Product Product) {

        return productService.UpdateRecommend(Product);

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

        return productService.selectByCategoryId(id, current, size);

    }


}

