package com.example.demo.api.item.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("item")
public class Item {

    private String itemId;
    private String itemName;
    private String itemColor;
    private Integer fullPrice;
    private Integer saleRate;
    private String contents;
    private Timestamp regDate;
    private String itemCode;
    private String photo1;
    private String photo2;
    private String photo3;
}
