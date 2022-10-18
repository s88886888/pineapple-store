package com.PineappleStore.service.impl;

import com.PineappleStore.dao.UserLoginHistoryMapper;
import com.PineappleStore.entity.UserLoginHistory;
import com.PineappleStore.service.UserLoginHistoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 登录历史表  服务实现类
 * </p>
 *
 * @author Linson
 * @since 2022-10-17
 */
@Service
public class UserLoginHistoryServiceImpl extends ServiceImpl<UserLoginHistoryMapper, UserLoginHistory> implements UserLoginHistoryService {

}
