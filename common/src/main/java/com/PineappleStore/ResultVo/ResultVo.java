package com.PineappleStore.ResultVo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultVo {

    private String Msg;

    private int Code;

    private Object Data;

    private String Token;

    public ResultVo(String msg, int code, Object data) {
        Msg = msg;
        Code = code;
        Data = data;
    }
}


