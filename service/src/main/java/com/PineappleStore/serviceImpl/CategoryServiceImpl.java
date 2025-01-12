package com.PineappleStore.serviceImpl;

import com.PineappleStore.RedisService.RedisUtil;
import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.CategoryMapper;
import com.PineappleStore.dao.ProductMapper;
import com.PineappleStore.entity.*;
import com.PineappleStore.service.CategoryService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 商品分类 服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Resource
    private RedisUtil redisUtil;


    @Override
    public ResultVo SelectByAll() {

        if (redisUtil.hasKey("CategoryList")) {

            return new ResultVo("查询成功", StatusVo.success, redisUtil.get("CategoryList"));
        } else {
            //定义一个规则集合
            QueryWrapper<Category> wrapper = new QueryWrapper<>();

            //"sql "
            List<Category> categoryList = categoryMapper.selectList(wrapper);

            redisUtil.set("CategoryList", categoryList);
            return new ResultVo("查询成功", StatusVo.success, categoryList);
        }


    }


    @Override
    public ResultVo SelectByAll(int Level) {
        //定义一个规则集合
        QueryWrapper<Category> wrapper = new QueryWrapper<>();

        wrapper.lambda().eq(Category::getCategoryLevel, Level);

        //"sql "
        List<Category> categoryList = categoryMapper.selectList(wrapper);


        return new ResultVo("查询成功", StatusVo.success, categoryList);
    }


    @Override
    public ResultVo SelectPage(Integer Id, String Name, String slogan, Integer Status, Integer level, int current, int size) {


        MPJLambdaWrapper<Category> wrapper = new MPJLambdaWrapper<Category>()
                .selectAll(Category.class);


        if (Id != null && !Id.equals(0)) {
            wrapper.eq(Category::getCategoryId, Id);
        }
        if (Name != null && !Name.equals("")) {
            wrapper.like(Category::getCategoryName, Name);
        }
        if (slogan != null && !slogan.equals("")) {
            wrapper.like(Category::getCategorySlogan, slogan);
        }
        if (Status != null && !Status.equals(0)) {
            wrapper.eq(Category::getCategoryStar, Status);
        }
        if (level != null && !level.equals(0)) {
            wrapper.eq(Category::getCategoryLevel, level);
        }


        IPage<Category> categoryList = categoryMapper.selectPage(new Page<>(current, size), wrapper);


        return new ResultVo("查询成功", StatusVo.success, categoryList);
    }

    @Override
    public ResultVo SelectById(int Id) {
        Category category = categoryMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, category);
    }

    @Override
    public ResultVo SelectByParentId(int parentId, int current, int size) {
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>()
                .eq(Category::getParentId, parentId);

        IPage<Category> data = categoryMapper.selectPage(new Page<>(current, size), wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);

    }


    //查询等级是1 的商品分类
    @Override
    public ResultVo SelectByCategoryStar(int Star) {

        MPJLambdaWrapper<Category> wrapper = new MPJLambdaWrapper<Category>()

                .selectAll(Category.class).eq(Category::getCategoryStar, Star)

                .selectCollection(Product.class, CategoryVO::getProductList,
                        map -> map.collection(ProductImg.class, ProductListVo::getImgList))
                .leftJoin(Product.class, Product::getCategoryId, Category::getCategoryId)
                .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                .eq(ProductImg::getIsMain, 1)
                .orderByAsc(Category::getCategoryId);

        if (Star == 1) {
            wrapper.eq(Product::getProductStar, 1);
        }
        if (Star == 2) {
            wrapper.eq(Product::getProductPreferred, 1);
        }


        List<CategoryVO> data = categoryMapper.selectJoinList(CategoryVO.class, wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);

    }


    @Override
    public boolean SelectByCategoryStarCount() {

        QueryWrapper<Category> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Category::getCategoryStar, 1);
        Long categoryCount = categoryMapper.selectCount(wrapper);

        return categoryCount < 10;
    }

    @Override
    public ResultVo AddModel(Category category) {

        if (SelectByNameForBoolean(category.getCategoryName())) {
            return new ResultVo("增加失败:已经存在相同名字", StatusVo.Error, category);
        }
        if (category.getCategoryStar() == 1 && !SelectByCategoryStarCount()) {
            return new ResultVo("增加失败:推荐商品不能超过数量:10", StatusVo.Error, null);
        } else {

            if (category.getCategoryStar() == 2) {
                LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
                wrapper.eq(Category::getCategoryStar, 3);
                Long dataCount = categoryMapper.selectCount(wrapper);
                if (dataCount == 1) {
                    return new ResultVo("添加失败，请先取消其他模块【菠萝推荐】", StatusVo.Error, null);
                }
            }

            int i = categoryMapper.insert(category);
            if (i > 0) {
                return new ResultVo("增加成功", StatusVo.success, null);
            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
            }


        }
    }


    @Override
    public boolean SelectByIdForBoolean(int Id) {

        Category category = categoryMapper.selectById(Id);

        return category != null;
    }


    @Override
    public ResultVo DeleteById(int Id) {
        if (SelectByIdForBoolean(Id)) {

            Long data = productMapper.selectCount(new MPJLambdaWrapper<Product>().select(Product::getProductId)
                    .eq(Product::getCategoryId, Id));

            System.out.println(data + "-------------------------------------------");


            if (data != 0) {
                return new ResultVo("删除失败：请先清除该分类下的商品", StatusVo.Error, null);
            }
            int category = categoryMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }
        } else {
            return new ResultVo("删除失败：这个商品不存在", StatusVo.Error, null);
        }


    }


    @Override
    public ResultVo UpdateByModel(Category category) {
        if (category.getCategoryStar() == 1) {
            LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>().eq(Category::getCategoryStar, 1);
            List<Category> data = categoryMapper.selectList(wrapper);

            for (Category datum : data) {
                if (Objects.equals(datum.getCategoryId(), category.getCategoryId())) {
                    categoryMapper.updateById(category);

                    redisUtil.del("CategoryList");
                    redisUtil.del("SelectByParent");
                    redisUtil.del("CategoryStar");

                    return new ResultVo("更新成功", StatusVo.success, null);
                }
            }

        }
        if (category.getCategoryStar() == 2) {

            LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>().eq(Category::getCategoryStar, 2);
            Long data = categoryMapper.selectCount(wrapper);

            if (data != 0) {
                return new ResultVo("更新失败，请先取消其他模块【菠萝推荐】", StatusVo.Error, null);
            } else {
                categoryMapper.updateById(category);

                redisUtil.del("CategoryList");
                redisUtil.del("SelectByParent");
                redisUtil.del("CategoryStar");
                return new ResultVo("更新成功", StatusVo.success, null);
            }

        } else {
            if (SelectByIdForBoolean(category.getCategoryId())) {
                categoryMapper.updateById(category);
                redisUtil.del("CategoryList");
                redisUtil.del("SelectByParent");
                redisUtil.del("CategoryStar");
                return new ResultVo("更新成功", StatusVo.success, null);
            } else {
                return new ResultVo("更新失败，该分类不存在", StatusVo.Error, null);
            }
        }

    }


    @Override
    public boolean SelectByNameForBoolean(String Name) {

        QueryWrapper<Category> wrapper = new QueryWrapper<>();

        wrapper.lambda().select(Category::getCategoryName).eq(Category::getCategoryName, Name);

        Category category = categoryMapper.selectOne(wrapper);

        return category != null;


    }

    @Override
    public ResultVo SelectByParent() {

        //复合查询先拿出 star==3 的id

        if (redisUtil.hasKey("SelectByParent")) {

            return new ResultVo("请求成功", StatusVo.success, redisUtil.get("SelectByParent"));
        } else {
            QueryWrapper<Category> wrapper = new QueryWrapper<>();
            wrapper.lambda().select(Category::getCategoryId).eq(Category::getCategoryStar, 3);
            Category categoryId = categoryMapper.selectOne(wrapper);

            if (categoryId == null) {
                return new ResultVo("请求失败：管理员未设置商品信息", StatusVo.success, null);
            }

            MPJLambdaWrapper<Category> data = new MPJLambdaWrapper<Category>()
                    .selectAll(Category.class)
                    .selectCollection(Product.class, CategoryVO::getProductList, map -> map
                            .collection(ProductImg.class, ProductListVo::getImgList)
                            .collection(ProductSku.class, ProductListVo::getSkuList))

                    .leftJoin(Product.class, Product::getCategoryId, Category::getCategoryId)
                    .leftJoin(ProductImg.class, ProductImg::getItemId, Product::getProductId)
                    .leftJoin(ProductSku.class, ProductSku::getProductId, Product::getProductId)
                    .eq(ProductImg::getIsMain, 1)
                    .eq(Category::getParentId, categoryId.getCategoryId());

            List<CategoryVO> category = categoryMapper.selectJoinList(CategoryVO.class, data);

            redisUtil.set("SelectByParent", category);

            return new ResultVo("请求成功", StatusVo.success, category);
        }


    }
}
