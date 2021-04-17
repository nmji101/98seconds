package com.example.demo.api.item.service;

import com.example.demo.api.item.dao.ItemDao;
import com.example.demo.api.item.dto.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService{

    private ItemDao itemDao;
    @Autowired
    public  ItemServiceImpl(ItemDao itemDao){
        this.itemDao = itemDao;
    }

    @Override
    public int insertItem(Item item) {
        return itemDao.insertItem(item);
    }

    @Override
    public List<Item> selectItemList() {
        return itemDao.selectItemList();
    }
}
