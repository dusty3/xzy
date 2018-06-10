package com.iotek.dao;

import com.iotek.po.Shelf;

/**
 * Created by Administrator on 2017/6/6.
 */
public interface ShelfDao {
    void saveShelf(Shelf shelf);
    void  updateShelf(Shelf shelf);
    Shelf findShelfByPId(Integer pId);
}
