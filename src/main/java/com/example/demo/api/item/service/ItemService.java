package com.example.demo.api.item.service;

import com.example.demo.api.item.dto.Item;

import java.util.List;

public interface ItemService {

    int insertItem(Item item);

    List<Item> selectItemList();
}
