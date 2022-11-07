package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.ResultVo.TokenVo;
import com.PineappleStore.Utils.Md5Utils;
import com.PineappleStore.dao.UsersMapper;
import com.PineappleStore.entity.Users;
import com.PineappleStore.service.UsersService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.DefaultJwtBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


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
    public TokenVo Login(String userName, String passWord) {


        boolean checkuser = CheckUserByname(userName);


        if (!checkuser) {

            String md5pwd = Md5Utils.md5(passWord);

            QueryWrapper<Users> wrapper = new QueryWrapper<>();

            wrapper.lambda().select(Users::getUsername, Users::getPassword, Users::getUserId).eq(Users::getUsername, userName).eq(Users::getPassword, md5pwd).last("limit 1");

            Users wrapperuser = usersMapper.selectOne(wrapper);

            if (md5pwd.equals(wrapperuser.getPassword())) {

                JwtBuilder builder = new DefaultJwtBuilder();

                Map<String, Object> map = new HashMap<>();


                map.put("Username", userName);
                String token = builder.setSubject(userName) //就是 token中携带的数据 支持链式调用

                        .setIssuedAt(new Date()) //设置token的⽣成时间
                        .setId(wrapperuser.getUserId() + "") //设置⽤户id为 token id

                        .setClaims(map) //map中可以存 放⽤户的⻆⾊权限信息
                        .setExpiration(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000)) //设置过期时间
                        .signWith(SignatureAlgorithm.HS256, "Linson_H") //设置加密⽅式和加密密码
                        .compact();//返回字符串

                return new TokenVo("用户登录成功", StatusVo.success, wrapperuser, token);


            } else {
                return new TokenVo("用户登录失败，密码错误", StatusVo.Error, null, null);
            }
        } else {
            return new TokenVo("用户不存在", StatusVo.Error, null, null);
        }

    }


    @Transactional
    public TokenVo Resgit(String userName, String passWord) {

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

                users.setUserRegtime(new Date());
                users.setUserModtime(new Date());

                int i = usersMapper.insert(users);

                if (i > 0) {
                    return new TokenVo("注册成功", 200, users, null);
                } else {
                    return new TokenVo("注册失败", 404, null, null);
                }
            } else {
                return new TokenVo("用户已经被注册了", 404, null, null);
            }
        }
    }


}
