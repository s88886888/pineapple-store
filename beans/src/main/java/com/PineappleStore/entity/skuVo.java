package com.PineappleStore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class skuVo {

    List<ProductSku> skuList;
    private String productId;
}
