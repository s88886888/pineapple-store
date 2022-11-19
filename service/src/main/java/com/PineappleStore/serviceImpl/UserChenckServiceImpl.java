package com.PineappleStore.serviceImpl;

import com.PineappleStore.dao.UserChenckMapper;
import com.PineappleStore.entity.UserChenck;
import com.PineappleStore.service.UserChenckService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户发送短信码验证表 服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-11-19
 */
@Service
public class UserChenckServiceImpl extends ServiceImpl<UserChenckMapper, UserChenck> implements UserChenckService {

}
