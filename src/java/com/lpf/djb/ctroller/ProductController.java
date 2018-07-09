package com.lpf.djb.ctroller;

import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Product;
import com.lpf.djb.service.serviceInterface.BrandService;
import com.lpf.djb.service.serviceInterface.ProductService;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/28.
 */
@Controller
public class ProductController {

    @Resource
    private ProductService productService;

    @RequestMapping(value = "/productview",method = RequestMethod.GET)
    public String  forwordtoproductView(HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Product> loadingProduct = productService.loadingProduct(user);
        httpSession.setAttribute("products",loadingProduct);
        return  "view/product/product_list";
    }

    @RequestMapping(value = "/updateproductView",method = RequestMethod.GET)
    public String  forwardtoproductUpdateView(@RequestParam("productId") String productId, HttpSession httpSession, Model model){
        Product product = productService.queryByid(Integer.valueOf(productId));
        model.addAttribute("product",product);
        return  "view/product/product_update";
    }

    @RequestMapping(value = "updateproduct",method = RequestMethod.POST)
    public String  updateproduct(@ModelAttribute Product product, HttpSession httpSession, Model model){

/*        Product product1 = productService.queryByid(product.getProductId());
        if(!product1.getProductId().equals(product.getProductId())) {
            Boolean isexsit = productService.productnameisexist(product.getp);
            if (isexsit) {
                model.addAttribute("info", "公司名已存在");
                return "view/customer/customer_update";
            }
        }*/

        productService.updateProduct(product);


        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Product> loadingProduct = productService.loadingProduct(user);
        httpSession.setAttribute("products",loadingProduct);
//        model.addAttribute("info","修改成功");
        return  "view/product/product_list";
    }

    @RequestMapping(value = "/deleteproduct",method = RequestMethod.GET)
    public String  deleteproduct(@RequestParam("productId") String productId, HttpSession httpSession, Model model){
        productService.delProduct(Integer.valueOf(productId));
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Product> loadingProduct = productService.loadingProduct(user);
        httpSession.setAttribute("products",loadingProduct);
        model.addAttribute("info","删除成功");
        return  "view/product/product_list";
    }


    @RequestMapping(value = "/addproductview",method = RequestMethod.GET)
    public String  addproductview( HttpSession httpSession, Model model){

        int i = productService.querynewId();
        model.addAttribute("newproductid",i+1);
        return  "view/product/product_add";
    }


    @RequestMapping(value = "/addproduct",method = RequestMethod.POST)
    public String  addproduct(@ModelAttribute  Product product, HttpSession httpSession, Model model){



        productService.insertProduct(product);
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Product> loadingProduct = productService.loadingProduct(user);
        httpSession.setAttribute("products",loadingProduct);
        model.addAttribute("info","添加成功");
        return  "view/product/product_list";
    }



    @RequestMapping(value = "/queryproduct",method = RequestMethod.POST)
    public String  queryproduct(@RequestParam("productType") String productType, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("productType",productType);
        map.put("userloginid",user.getLoginId());
        List<Product> queryProduct = productService.queryProduct(map);
        if(queryProduct==null||queryProduct.size()==0) {

            httpSession.setAttribute("info", "没有您要查询的产品型号");
        }

        httpSession.setAttribute("products",queryProduct);

        return  "view/product/product_list";
    }
}
