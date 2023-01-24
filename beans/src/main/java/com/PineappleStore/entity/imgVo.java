package com.PineappleStore.entity;

import lombok.Data;

import java.util.List;

@Data
public class imgVo {

    private String itemId;
    private List<ProductImg> imgList;
}
