package com.PineappleStore.web.Controller;


import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.entity.ProductSku;
import com.PineappleStore.entity.skuVo;
import com.PineappleStore.service.ProductSkuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计 前端控制器
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@RestController
@RequestMapping("/product-sku")
@Api(value = "商品库存接口", tags = "商品库存接口")
public class ProductSkuController {

    @Autowired
    private ProductSkuService productSkuService;

    @GetMapping("/page")
    @ApiOperation(value = "分页获取所有数据", notes = "根据商品表的一个ID获取所有关联子表的图片")
    public ResultVo SelectPage(@RequestParam int current, @RequestParam int size) {
        return productSkuService.SelectPage(current, size);
    }

    @GetMapping("/Like-page")
    @ApiOperation(value = "分页模糊查询数据", notes = "根据商品表的一个ID获取所有关联子表的图片")
    public ResultVo SelectPage(@RequestParam(required = false) String productId,
                               @RequestParam(required = false) String productName,
                               @RequestParam(required = false) String SkuId,
                               @RequestParam(required = false) String SkuName,
                               @RequestParam(required = false) int Stock,
                               @RequestParam(required = false) int Status,
                               @RequestParam int current,
                               @RequestParam int size) {
        return productSkuService.SelectPage(productId, productName, SkuId, SkuName, Stock, Status, current, size);
    }

    @GetMapping("/getId")
    @ApiOperation(value = "获取一条数据", notes = "获取一条数据")
    public ResultVo SelectPage(@RequestParam String Id) {
        return productSkuService.SelectById(Id);
    }


    @PutMapping("/updateStock")
    @ApiOperation(value = "获取一条数据", notes = "获取一条数据")
    public ResultVo SelectPage(@RequestBody ProductSku productSku) {
        return productSkuService.UpdateStock(productSku);
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation(value = "添加数据", notes = "添加数据")
    public ResultVo AddModelList(@RequestBody skuVo skuvo) {
        return productSkuService.AddModelList(skuvo);
    }

    @PutMapping("/update")
    @ApiOperation(value = "更新数据", notes = "更新数据")
    public ResultVo Update(@RequestBody ProductSku productSku) {
        return productSkuService.UpdateByModel(productSku);
    }

    @DeleteMapping("/delete")
    @ApiOperation(value = "删除一条数据", notes = "删除一条数据")
    public ResultVo Delete(@RequestBody ProductSku productSku) {
        return productSkuService.Delete(productSku.getSkuId());
    }
}

