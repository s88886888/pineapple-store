package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.ProductImg;
import com.PineappleStore.service.ProductImgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 商品图片  前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/productimg")
@Api(value = "商品图片", tags = "商品图片接口")
public class ProductImgController {


    @Autowired
    private ProductImgService productImgService;


    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {
        ResultVo resultVo = productImgService.SelectByAll();
        return resultVo;
    }


    @GetMapping("/Id/{id}")
    @ApiOperation(value = "根据主表ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable int id) {
        ResultVo resultVo = productImgService.SelectById(id);

        return resultVo;
    }


    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody ProductImg productImg) {

        ResultVo resultVo = productImgService.UpdateByModel(productImg);

        return resultVo;
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable String id) {
        return productImgService.DeleteById(id);


    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody ProductImg productImg) {

        ResultVo resultVo = productImgService.AddModel(productImg);

        return resultVo;
    }


}

