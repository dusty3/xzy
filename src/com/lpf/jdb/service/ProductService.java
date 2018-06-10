package lpf.jdb.service;

import lpf.jdb.po.Product;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
public interface ProductService {
    boolean saveProduct(Product product);
    List<Product> getProductByName(Product product);
    List<Product> getProductHashMapByName(HashMap hashMap);
    List<Product>  findAllProduct();

}
