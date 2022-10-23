package com.pineapplestore.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.IndexImg;
import com.PineappleStore.service.IndexImgService;
import io.swagger.annotations.Api;
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
    public ResultVo SelectByAll() {

        ResultVo resultVo = indexImgService.SelectByAll();

        return resultVo;


    }

    @GetMapping("/getId/{id}")
    public ResultVo SelectById(@PathVariable String id) {
        ResultVo resultVo = indexImgService.SelectById(id);

        return resultVo;
    }

    @PutMapping("/")
    public ResultVo UpdateByModel(@RequestBody IndexImg indexImg) {

        ResultVo resultVo = indexImgService.UpdateByModel(indexImg);

        return resultVo;
    }

    @DeleteMapping("/{id}")
    public ResultVo DeleteById(@PathVariable String id) {
        ResultVo resultVo = indexImgService.DeleteById(id);

        return resultVo;
    }

    @PostMapping("/")
    public ResultVo AddModel(@RequestBody IndexImg indexImg) {

        ResultVo resultVo = indexImgService.AddModel(indexImg);

        return resultVo;
    }

}

