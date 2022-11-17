package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.dao.UserAddrMapper;
import com.PineappleStore.entity.UserAddr;
import com.PineappleStore.service.UserAddrService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 * 用户地址  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class UserAddrServiceImpl extends ServiceImpl<UserAddrMapper, UserAddr> implements UserAddrService {


    @Autowired
    private UserAddrMapper userAddrMapper;


    @Override
    public ResultVo SelectByAll() {
        QueryWrapper<UserAddr> wrapper = new QueryWrapper<>();
        List<UserAddr> IndexImgList = userAddrMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, IndexImgList);
    }

    @Override
    public ResultVo SelectById(String Id) {
        UserAddr UserAddr = userAddrMapper.selectById(Id);
        return new ResultVo("查询成功", StatusVo.success, UserAddr);
    }

    @Override
    public ResultVo SelectByUserId(String userId) {
        QueryWrapper<UserAddr> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserAddr::getUserId, userId);


        List<UserAddr> UserAddr = userAddrMapper.selectList(wrapper);
        return new ResultVo("查询成功", StatusVo.success, UserAddr);
    }

    @Override
    public ResultVo AddModel(UserAddr userAddr) {


        userAddr.setAddrId(String.valueOf(UUID.randomUUID()));
        userAddr.setCreateTime(new Date());
        userAddr.setUpdateTime(new Date());
        int i = userAddrMapper.insert(userAddr);
        if (i > 0) {
            return new ResultVo("增加成功", StatusVo.success, userAddr);
        } else {
            return new ResultVo("增加失败：请联系管理员", StatusVo.Error, null);
        }


    }


    @Override
    public ResultVo DeleteById(String Id) {


        UserAddr checkModel = userAddrMapper.selectById(Id);

        if (checkModel == null) {
            int category = userAddrMapper.deleteById(Id);
            if (category > 0) {
                return new ResultVo("删除成功", StatusVo.success, null);
            } else {
                return new ResultVo("删除失败：服务异常，请联系管理员", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("删除失败：该条记录不存在", StatusVo.Error, null);
        }

    }

    @Override
    public ResultVo UpdateByModel(UserAddr userAddr) {

        UserAddr checkModel = userAddrMapper.selectById(userAddr.getAddrId());

        if (checkModel == null) {
            userAddr.setUpdateTime(new Date());
            userAddrMapper.updateById(userAddr);
            return new ResultVo("更新成功", StatusVo.success, null);
        } else {
            return new ResultVo("更新失败，该记录不存在", StatusVo.Error, null);
        }

    }


}
