package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.IndexImg;
import com.PineappleStore.service.IndexImgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 轮播图  前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/index-img")
@Api(value = "轮播图", tags = "轮播图接口")
public class IndexImgController {


    @Autowired
    private IndexImgService indexImgService;


    @GetMapping("/List")
    @ApiOperation(value = "获取全部数据", notes = "获取全部数据")
    public ResultVo SelectByAll() {
        return indexImgService.SelectByAll();
    }

    @GetMapping("/listStatus")
    @ApiOperation(value = "获取全部数据不受staus影响", notes = "获取全部数据")
    public ResultVo SelectByAllStatus() {
        return indexImgService.SelectByAllStatus();
    }

    @GetMapping("/getId/{id}")
    @ApiOperation(value = "根据ID获取一条数据", notes = "根据ID获取一条数据")
    public ResultVo SelectById(@PathVariable String id) {
        return indexImgService.SelectById(id);
    }


    @GetMapping("/likeName/{name}")
    @ApiOperation(value = "根据name进行模糊查询", notes = "根据name进行模糊查询")
    public ResultVo SelectByName(@PathVariable String name) {
        return indexImgService.SelectByName(name);
    }

    @PutMapping("/")
    @ApiOperation(value = "更新数据", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@RequestBody IndexImg indexImg) {
        return indexImgService.UpdateByModel(indexImg);
    }


    @PutMapping("/{id}")
    @ApiOperation(value = "根据id更新Status数据状态", notes = "提交model进行更新")
    public ResultVo UpdateByModel(@PathVariable String id) {
        return indexImgService.UpdateStatusById(id);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据一条id进行删除数据", notes = "传入单id")
    public ResultVo DeleteById(@PathVariable String id) {
        return indexImgService.DeleteById(id);
    }

    @PostMapping("/")
    @ApiOperation(value = "增加一条数据", notes = "提交model进行增加数据")
    public ResultVo AddModel(@RequestBody IndexImg indexImg) {
        return indexImgService.AddModel(indexImg);
    }

}

