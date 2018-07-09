package com.lpf.djb.service.serviceInterface;

import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Supplier;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/27.
 */
public interface SupplierService {
    List<Supplier> loadingsupplier(LmUser lmUser);

    Supplier queryByid(Integer integer);


    void updateSupplier(Supplier supplier);

    void delsupplier(Integer integer);

    int querynewId();

    void insertsupplier(Supplier supplier);

    List<Supplier> querysupplier(HashMap map);

    Supplier fillcutomer(HashMap map);

    Boolean supplierisexist(String supplierName);
}
