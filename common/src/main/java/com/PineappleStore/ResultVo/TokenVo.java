package com.PineappleStore.ResultVo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TokenVo {


    private String Msg;

    private int Code;

    private Object Data;

    private String Token;
}
