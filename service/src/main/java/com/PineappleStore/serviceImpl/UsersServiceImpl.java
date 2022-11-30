package com.PineappleStore.serviceImpl;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.PineappleStore.ResultVo.TokenVo;
import com.PineappleStore.Utils.Client;
import com.PineappleStore.Utils.DingxiangCheck;
import com.PineappleStore.Utils.Md5Utils;
import com.PineappleStore.dao.UserChenckMapper;
import com.PineappleStore.dao.UsersMapper;
import com.PineappleStore.entity.UserChenck;
import com.PineappleStore.entity.Users;
import com.PineappleStore.service.UsersService;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.DefaultJwtBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


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

    @Autowired
    private UserChenckMapper userChenckMapper;

    public boolean CheckUserByName(String userName) {

        QueryWrapper<Users> checkwrapper = new QueryWrapper<>();
        checkwrapper.lambda().select(Users::getUsername).eq(Users::getUsername, userName).last("limit 1");
        Users checker = usersMapper.selectOne(checkwrapper);

        return checker == null;

    }

    @Override
    public boolean CheckUserByPhone(String Phone) {

        QueryWrapper<Users> checkwrapper = new QueryWrapper<>();
        checkwrapper.lambda().select(Users::getUserMobile).eq(Users::getUserMobile, Phone);
        Users checkuser = usersMapper.selectOne(checkwrapper);

        return checkuser == null;
    }


    @Override

    public TokenVo Login(String userAccount, String passWord, String loginToken, int loginType) throws Exception {

        if (DingxiangCheck.Checktoken(loginToken)) {


            String md5pwd = Md5Utils.md5(passWord);
            QueryWrapper<Users> wrapper = new QueryWrapper<>();
            if (loginType == 1) {
                wrapper.lambda().select(Users::getUserMobile, Users::getUsername, Users::getPassword, Users::getUserId).eq(Users::getUsername, userAccount)
                        .eq(Users::getPassword, md5pwd);
            } else {
                wrapper.lambda().select(Users::getUsername, Users::getUserMobile, Users::getPassword, Users::getUserId).eq(Users::getUserMobile, userAccount)
                        .eq(Users::getPassword, md5pwd);
            }

            Users user = usersMapper.selectOne(wrapper);

            if (user == null) {
                return new TokenVo("请先检查账号和密码", StatusVo.Error, null, null);
            }

            if (md5pwd.equals(user.getPassword())) {
                return new TokenVo("用户登录成功", StatusVo.success, user, createToken(userAccount, user));
            } else {
                return new TokenVo("用户登录失败:密码错误", StatusVo.success, user, null);
            }

        } else {
            return new TokenVo("请重新进行人机认证", StatusVo.Error, null, null);
        }

    }


    @Override
    @Transactional
    public TokenVo resgit(String userName, String phone, String passWord, String phoneCode) {

        //线程锁
        synchronized (this) {

            boolean checker = CheckUserByName(userName);
            boolean chenckphone = CheckUserByPhone(phone);
            if (checker || chenckphone) {


                //检查验证码过期模块
                LambdaQueryWrapper<UserChenck> wrapper = new LambdaQueryWrapper<>();
                wrapper.select(UserChenck::getPhone, UserChenck::getCode, UserChenck::getCreateTime).orderByDesc(UserChenck::getCreateTime).eq(UserChenck::getPhone, phone).eq(UserChenck::getCode, phoneCode);

                UserChenck userChenck = userChenckMapper.selectOne(wrapper);

                if (userChenck == null) {
                    return new TokenVo("验证码错误", 4004, StatusVo.Error, null);
                } else {

                    Date date = userChenck.getCreateTime();
                    //验证码创建时间加上5分钟便是 过期时间
                    Date afterDate = new Date(date.getTime() + 300000); //60000为1分钟  //300000为5分钟

// 1、如果指定的数与参数相等返回0。
//                2、如果指定的数小于参数返回 -1。
//                3、如果指定的数大于参数返回 1。3
//                  2020-10-10 11：15 < 2020-10-10 11：20  ===>  -1
                    int checktime = afterDate.compareTo(new Date());

                    if (checktime < 0) {
                        return new TokenVo("手机验证码有效期5分钟，验证码过期了", 4005, null, null);
                    }

                }

                String md5pwd = Md5Utils.md5(passWord);//md5密码加密
                Users users = new Users();
                users.setUsername(userName);
                users.setPassword(md5pwd);
                users.setUserMobile(phone);
                users.setUserImg("img/user.jpg");
                users.setUserRegtime(new Date());
                users.setUserModtime(new Date());

                int i = usersMapper.insert(users);

                if (i > 0) {
                    return new TokenVo("注册成功", StatusVo.success, users, createToken(userName, users));
                } else {
                    return new TokenVo("注册失败", StatusVo.Error, null, null);
                }
            } else {
                return new TokenVo("用户名或手机号码已经被注册了", StatusVo.Error, null, null);
            }
        }
    }

    private String createToken(String userName, Users users) {
        JwtBuilder builder = new DefaultJwtBuilder();
        Map<String, Object> map = new HashMap<>();
        map.put("Username", userName);
        return builder.setSubject(userName) //token中携带的数据 支持链式调用  token 主题
                .setIssuedAt(new Date()) //设置token的⽣成时间
                .setId(users.getUserId() + "") //设置⽤户id为 token id
                .setClaims(map) //map中可以存 放⽤户的⻆⾊权限信息
                .setExpiration(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000)) //设置过期时间  ==1 天
                .signWith(SignatureAlgorithm.HS256, "Linson_H") //设置加密⽅式和 加密的密钥
                .compact();//返回字符串

    }


    /* 请求后端发送手机验证码*/
    @Override
    public ResultVo getPhoneCode(String phone, String resgitToken) throws Exception {

        if (phone.equals("")) {
            return new ResultVo("手机号码不允许为空!", StatusVo.Error, null);
        }

        if (DingxiangCheck.Checktoken(resgitToken)) {


            if (CheckUserByPhone(phone)) {
                Date date = new Date();
                Date afterDate = new Date(date.getTime() + 60000); //60000为1分钟


//            SELECT phone,create_time,expiration_time FROM user_chenck WHERE (phone = '11111111111') ORDER BY expiration_time DESC LIMIT 1
                LambdaQueryWrapper<UserChenck> Wrapper = new LambdaQueryWrapper<>();
                Wrapper.select(UserChenck::getPhone, UserChenck::getExpirationTime).eq(UserChenck::getPhone, phone).orderByDesc(UserChenck::getExpirationTime).last("LIMIT 1");

                UserChenck userChenck = userChenckMapper.selectOne(Wrapper);


                if (userChenck != null) {
                    //进行时间对比
                    //如果现在的时间 超过了 到期的时间 则允许用户重新发起请求
//                1、如果指定的数与参数相等返回0。
//                2、如果指定的数小于参数返回 -1。
//                3、如果指定的数大于参数返回 1。

                    int checkmate = userChenck.getExpirationTime().compareTo(new Date());
                    if (checkmate > 0) {
                        return new ResultVo("请耐心等等60S后再试", StatusVo.Error, null);
                    }
                }


                Client client = new Client();
                Client.Request request = new Client.Request();

                //创建json 发送对象
                JSONObject send = new JSONObject();

                //随机生成4位随机验证码
                Random randObj = new Random();
                Integer phoneCode = (1000 + randObj.nextInt(9000));

                //手机号
                Set<String> phoneList = new HashSet<>();
                phoneList.add(phone);
                send.put("mobile", phoneList);
                send.put("type", 0);
                send.put("template_id", "ST_2020101100000005");
                send.put("sign", "闪速码");
                send.put("send_time", "");

                //发送随机的验证码
                Map<String, Integer> code = new HashMap<>();
                code.put("code", phoneCode);
                send.put("params", code);
                request.setBizContent(String.valueOf(send));
                request.setMethod("sms.message.send");


                UserChenck model = new UserChenck();
                model.setPhone(phone);
                model.setCode(String.valueOf(phoneCode));
                model.setCreateTime(new Date());
                model.setExpirationTime(afterDate);
                int i = userChenckMapper.insert(model);
                if (i < 1) {
                    return new ResultVo("系统错误，请稍后再试", StatusVo.wrong, null);
                }
                //发送验证码
                client.execute(request);
                return new ResultVo("验证码发送成功，验证码有效期5分钟", StatusVo.success, null);
            } else {
                return new ResultVo("手机号码已经被注册", StatusVo.Error, null);
            }

        } else {
            return new ResultVo("人机校验过期", StatusVo.Error, null);
        }


    }
}
