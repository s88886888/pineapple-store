package com.pineapplestore.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.Category;
import com.PineappleStore.service.CategoryService;
import io.swagger.annotations.Api;
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
    public ResultVo SelectByAll() {

        ResultVo resultVo = categoryService.SelectByAll();

        return resultVo;


    }

    @GetMapping("/getId/{id}")
    public ResultVo SelectById(@PathVariable int id) {
        ResultVo resultVo = categoryService.SelectById(id);

        return resultVo;
    }

    @PutMapping("/")
    public ResultVo UpdateByModel(@RequestBody Category Category) {

        ResultVo resultVo = categoryService.UpdateByModel(Category);

        return resultVo;
    }

    @DeleteMapping("/{id}")
    public ResultVo DeleteById(@PathVariable int id) {
        ResultVo resultVo = categoryService.DeleteById(id);

        return resultVo;
    }

    @PostMapping("/")
    public ResultVo AddModel(@RequestBody Category Category) {

        ResultVo resultVo = categoryService.AddModel(Category);

        return resultVo;
    }

}

