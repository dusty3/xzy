package com.lpf.djb.service.impl;

import com.lpf.djb.dao.SupplierMapper;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Supplier;
import com.lpf.djb.service.serviceInterface.SupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/27.
 */
@Service
public class SupplierServiceImpl implements SupplierService {
    @Resource
    private SupplierMapper supplierMapper;
    @Override
    public List<Supplier> loadingsupplier(LmUser lmUser) {
        return supplierMapper.loadingsupplier(lmUser);
    }

    @Override
    public Supplier queryByid(Integer integer) {
        return supplierMapper.selectByPrimaryKey(integer);
    }

    @Override
    public void updateSupplier(Supplier supplier) {
        supplier.setSupplierDr(0);
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        supplier.setSupplierModifytime(format.format(date));
        supplierMapper.updateSupplier(supplier);
    }

    @Override
    public void delsupplier(Integer integer) {
        supplierMapper.delsupplier(integer);
    }

    @Override
    public int querynewId() {
        return supplierMapper.querySuppliernewid();
    }

    @Override
    public void insertsupplier(Supplier supplier) {
        Date date=new Date();
        supplier.setSupplierDr(0);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        supplier.setSupplierCreatetime(format.format(date));
        supplierMapper.insertsupplier(supplier);
    }

    @Override
    public List<Supplier> querysupplier(HashMap map) {
        return supplierMapper.querysupplier(map);
    }

    @Override
    public Supplier fillcutomer(HashMap map) {
        return supplierMapper.fillcutomer(map);
    }

    @Override
    public Boolean supplierisexist(String supplierName) {
        List<Supplier> findsupplierbyname = supplierMapper.findsupplierbyname(supplierName);
        if(findsupplierbyname==null||findsupplierbyname.size()==0){
            return  false;
        }else{
            return  true;
        }
    }
}
