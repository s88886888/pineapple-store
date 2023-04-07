package com.PineappleStore.serviceImpl;

import com.PineappleStore.RedisService.RedisUtil;
import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.IndexImgMapper;
import com.PineappleStore.entity.IndexImg;
import com.PineappleStore.service.IndexImgService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 * 轮播图  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class IndexImgServiceImpl extends ServiceImpl<IndexImgMapper, IndexImg> implements IndexImgService {

    @Autowired
    private IndexImgMapper indexImgMapper;

    @Resource
    private RedisUtil redisUtil;

    @Override
    public ResultVo SelectByAll() {

        if (redisUtil.hasKey("indexImg")) {
            return new ResultVo("查询成功", StatusVo.success, redisUtil.get("indexImg"));
        } else {
            QueryWrapper<IndexImg> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(IndexImg::getStatus, 1);
            List<IndexImg> IndexImgList = indexImgMapper.selectList(wrapper);
            redisUtil.set("indexImg", IndexImgList, 60 * 60 * 24);

            return new ResultVo("查询成功", StatusVo.success, IndexImgList);
        }


    }

    @Override
    public ResultVo SelectByAllStatus() {
        QueryWrapper<IndexImg> wrapper = new QueryWrapper<>();
        List<IndexImg> IndexImgList = indexImgMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, IndexImgList);
    }

    @Override
    public ResultVo SelectById(String Id) {
        IndexImg IndexImg = indexImgMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, IndexImg);
    }

    @Override
    public ResultVo SelectByName(String Name) {
        LambdaQueryWrapper<IndexImg> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(IndexImg::getImgName, Name);
        List<IndexImg> data = indexImgMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, data);
    }

    @Override
    public ResultVo AddModel(IndexImg indexImg) {

        if (SelectByNameForBoolean(indexImg.getImgName())) {

            return new ResultVo("增加失败:已经存在这个名字", StatusVo.Error, indexImg);
        } else {

//            Long id = SelectCout();
//            indexImg.setImgId(String.valueOf(id));

            UUID uuid = UUID.randomUUID();
            indexImg.setImgId(String.valueOf(uuid));

            indexImg.setCreateTime(new Date());
            indexImg.setUpdateTime(new Date());

            int i = indexImgMapper.insert(indexImg);

            if (i > 0) {

                if (redisUtil.hasKey("indexImg")) {
                    redisUtil.del("indexImg");
                }

                return new ResultVo("增加成功", StatusVo.success, null);
            } else {
                return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
            }


        }
    }

    @Override
    public boolean SelectByIdForBoolean(String Id) {


        IndexImg indexImg = indexImgMapper.selectById(Id);
        return indexImg != null;


    }

    @Override
    public ResultVo DeleteById(String Id) {

        boolean checkModel = SelectByIdForBoolean(Id);

        if (checkModel) {
            int category = indexImgMapper.deleteById(Id);
            if (category > 0) {
                if (redisUtil.hasKey("indexImg")) {
                    redisUtil.del("indexImg");
                }
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该轮播图不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateByModel(IndexImg indexImg) {

        if (SelectByIdForBoolean(indexImg.getImgId())) {
            indexImg.setUpdateTime(new Date());
            indexImgMapper.updateById(indexImg);
            if (redisUtil.hasKey("indexImg")) {
                redisUtil.del("indexImg");
            }
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该轮播图不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateStatusById(String Id) {
        if (SelectByIdForBoolean(Id)) {

            IndexImg data = indexImgMapper.selectById(Id);


            if (data.getStatus().equals(0)) {
                data.setStatus(1);
            } else {
                data.setStatus(0);
            }


            indexImgMapper.updateById(data);
            if (redisUtil.hasKey("indexImg"))
            {
                redisUtil.del("indexImg");
            }
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该轮播图不存在", StatusVo.Error, null);
        }
    }

    @Override
    public boolean SelectByNameForBoolean(String Name) {

        QueryWrapper<IndexImg> wrapper = new QueryWrapper<>();

        wrapper.lambda().select(IndexImg::getImgName).eq(IndexImg::getImgName, Name);

        IndexImg indexImg = indexImgMapper.selectOne(wrapper);

        return indexImg != null;


    }


//    //就是不改int类型你能怎么样
//    public Long SelectCout() {
//        QueryWrapper<IndexImg> wrapper = new QueryWrapper<>();
//
//
//        Long num = indexImgMapper.selectCount(wrapper);
//
//        return num + 1;
//    }

}
