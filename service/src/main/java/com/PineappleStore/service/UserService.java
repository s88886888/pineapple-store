package com.PineappleStore.service;


import com.PineappleStore.ResultVo.ResultVo;

public interface UserService {


    public ResultVo Login(String userName , String passWord);

    public ResultVo Resgit(String name,String passWord);





}
