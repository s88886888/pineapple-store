package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Category;
import com.PineappleStore.service.CategoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 商品分类 前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/category")
@Api(value = "商品分类", tags = "商品分类接口")
public class CategoryController {


    @Autowired
    private CategoryService categoryService;


    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {

        return categoryService.SelectByAll();


    }

    @GetMapping("/getlistByLevel")
    @ApiOperation(value = "获取全部数据根据Level", notes = "获取全部数据根据Level")
    public ResultVo SelectByAll(@RequestParam Integer Level) {
        return categoryService.SelectByAll(Level);
    }

    @GetMapping("/SelectPage")
    @ApiOperation(value = "分页获取全部数据", notes = "分页获取全部数据")
    public ResultVo SelectByAll(@RequestParam(required = false) Integer categoryId,
                                @RequestParam(required = false) String Name,
                                @RequestParam(required = false) String slogan,
                                @RequestParam(required = false) Integer Status,
                                @RequestParam(required = false) Integer level,
                                @RequestParam int current,
                                @RequestParam int size) {
        return categoryService.SelectPage(categoryId, Name, slogan, Status, level, current, size);
    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable int id) {
        return categoryService.SelectById(id);
    }


    @GetMapping("/getParentId")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectByParentId(@RequestParam int parentId, @RequestParam int current, @RequestParam int size) {
        return categoryService.SelectByParentId(parentId, current, size);
    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody Category Category) {



        return categoryService.UpdateByModel(Category);

    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable int id) {
        return categoryService.DeleteById(id);

    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody Category Category) {

        return categoryService.AddModel(Category);


    }


    @GetMapping("/SelectByCategoryStar/{Star}")
    @ApiOperation(value = "根据字段CategoryStar进行查询", notes = "如果CategoryStar的值为1则符合查询规则  注：1为轮播图的商品分类推荐  2为商品展示的商品分类推荐")
    public ResultVo SelectByCategoryStar(@PathVariable int Star) {

        return categoryService.SelectByCategoryStar(Star);
    }

    @GetMapping("/SelectByParent")
    @ApiOperation(value = "根据字段SelectByParent进行查询", notes = "SelectByParent")
    public ResultVo SelectByParent() {
        return categoryService.SelectByParent();
    }


}

