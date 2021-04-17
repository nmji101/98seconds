package com.example.demo.api.item.dao;

import com.example.demo.api.item.dto.Item;
import com.example.demo.mybatis.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ItemDao {

    int insertItem(Item item);

    List<Item> selectItemList();
}
