package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.ResultVo.TokenVo;
import com.PineappleStore.Utils.DingxiangCheck;
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

    public TokenVo Login(String userName, String passWord, String loginToken) throws Exception {

        if (DingxiangCheck.Checktoken(loginToken)) {

            String md5pwd = Md5Utils.md5(passWord);

            QueryWrapper<Users> wrapper = new QueryWrapper<>();
            wrapper.lambda().select(Users::getUsername, Users::getPassword, Users::getUserId)
                    .eq(Users::getUsername, userName)
                    .eq(Users::getPassword, md5pwd);

            Users user = usersMapper.selectOne(wrapper);

            if (user == null) {
                return new TokenVo("请先检查账号和密码", StatusVo.Error, null, null);
            }

            if (md5pwd.equals(user.getPassword())) {

                JwtBuilder builder = new DefaultJwtBuilder();

                Map<String, Object> map = new HashMap<>();

                map.put("Username", userName);

                String token = builder.setSubject(userName) //token中携带的数据 支持链式调用
                        .setIssuedAt(new Date()) //设置token的⽣成时间
                        .setId(user.getUserId() + "") //设置⽤户id为 token id
                        .setClaims(map) //map中可以存 放⽤户的⻆⾊权限信息
                        .setExpiration(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000)) //设置过期时间
                        .signWith(SignatureAlgorithm.HS256, "Linson_H") //设置加密⽅式和 加密的密钥
                        .compact();//返回字符串

                return new TokenVo("用户登录成功", StatusVo.success, user, token);

            } else {
                return new TokenVo("用户登录失败:密码错误", StatusVo.success, user, null);
            }

        } else {
            return new TokenVo("请重新进行人机认证", StatusVo.Error, null, null);
        }

    }


    @Override
    @Transactional
    public TokenVo resgit(String userName, String passWord, String resgitToken) throws Exception {

        //线程锁
        synchronized (this) {
            if (DingxiangCheck.Checktoken(resgitToken)) {
                boolean checker = CheckUserByname(userName);
                if (checker) {
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
            } else {
                return new TokenVo("验证码过期", StatusVo.Error, null, null);
            }
        }
    }
}
