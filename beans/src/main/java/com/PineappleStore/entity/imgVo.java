package com.PineappleStore.entity;

import lombok.Data;

import java.util.List;

@Data
public class imgVo {

    private String itemId;

    private Integer del;
    private List<ProductImg> imgList;
}
