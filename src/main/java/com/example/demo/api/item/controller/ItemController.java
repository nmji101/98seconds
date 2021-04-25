package com.example.demo.api.item.controller;

import com.example.demo.Constants;
import com.example.demo.api.item.dto.Item;
import com.example.demo.api.item.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
public class ItemController {
    static final String uri_prefix = Constants.ApiConstants.uri_prefix + "/item";

    private ItemService itemService;

    @Autowired
    public ItemController(ItemService itemService){
        this.itemService = itemService;
    }

    @PostMapping(uri_prefix + "/insert")
    public ResponseEntity<Map<String,Object>> insertItem(@RequestBody Item item){
        Map<String, Object> result = new HashMap<>();
        result.put("insertCnt",itemService.insertItem(item));
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping(uri_prefix + "/list")
    public ResponseEntity selectItemList(){
        return new ResponseEntity(itemService.selectItemList(), HttpStatus.OK);
    }

    @PostMapping(uri_prefix + "/test")
    public ResponseEntity testItem(@RequestBody String name){
        log.info(name);
        return ResponseEntity.ok(name);
    }
}
