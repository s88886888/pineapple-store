package com.PineappleStore.service.impl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.Utils.Md5Utils;
import com.PineappleStore.dao.UsersMapper;
import com.PineappleStore.entity.Users;
import com.PineappleStore.service.UsersService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * <p>
 * 用户  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
@Scope("singleton")
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {


    @Autowired
    private UsersMapper usersMapper;

    public boolean CheckUserByname(String userName) {

        QueryWrapper<Users> checkwrapper = new QueryWrapper<>();
        checkwrapper.lambda().select(Users::getUsername).eq(Users::getUsername, userName).last("limit 1");
        Users checkuser = usersMapper.selectOne(checkwrapper);

        return checkuser == null;

    }


    @Override
    public ResultVo Login(String userName, String passWord) {


        boolean checkuser = CheckUserByname(userName);


        if (!checkuser) {

            String md5pwd = Md5Utils.md5(passWord);
            QueryWrapper<Users> wrapper = new QueryWrapper<>();
            wrapper.lambda().select(Users::getUsername, Users::getPassword).eq(Users::getUsername, userName).eq(Users::getPassword, md5pwd).last("limit 1");
            Users wrapperuser = usersMapper.selectOne(wrapper);

            if (md5pwd.equals(wrapperuser.getPassword())) {
                return new ResultVo("用户登录成功", 200, wrapperuser);
            } else {
                return new ResultVo("用户登录失败，密码错误", 404, null);
            }
        } else {
            return new ResultVo("用户不存在", 404, null);
        }
    }


    @Transactional
    public ResultVo Resgit(String userName, String passWord) {

        //线程锁
        synchronized (this) {

            boolean checkuser = CheckUserByname(userName);

            if (checkuser) {
//                Date datetime = new Date(); // 注意是util包下的Date
//                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//                String date = sdf.format(datetime);


                String md5pwd = Md5Utils.md5(passWord);//md5密码加密


                Users users = new Users();
                users.setUsername(userName);
                users.setPassword(md5pwd);
                users.setUserImg("img/user.jpg");

                users.setUserRegtime(new java.sql.Date(new java.util.Date().getTime()));
                users.setUserModtime(new java.sql.Date(new java.util.Date().getTime()));

                int i = usersMapper.insert(users);

                if (i > 0) {
                    return new ResultVo("注册成功", 200, users);
                } else {
                    return new ResultVo("注册失败", 404, null);
                }
            } else {
                return new ResultVo("用户已经被注册了", 404, null);
            }
        }
    }


}
