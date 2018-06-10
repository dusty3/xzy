package com.iotek.controller;

import com.iotek.po.Product;
import com.iotek.po.ProductDetail;
import com.iotek.service.ProductService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2017/6/14.
 */
@Controller
public class ProductController {
    @Resource
    ProductService productService;
    @Resource
    ServletContext  context;
    @RequestMapping(value = "/addProductPage.view", method = RequestMethod.GET)
    public String addProductPage(){
        return "addProductPage";
    }
    @RequestMapping(value = "/addProduct.do", method = RequestMethod.POST)
    public  String addProduct(@ModelAttribute Product product ,
                              @RequestParam(value = "productCaption",required =false) String productCaption,
                              @RequestParam(value = "image1",required = false) MultipartFile image1,
                              @RequestParam(value = "image2",required = false) MultipartFile image2,
                              Model model){
        String saveImage1 = saveImage(image1);
        String saveImage2 = saveImage(image2);
        ProductDetail productDetail=new ProductDetail();
        productDetail.setImage1(saveImage1);
        productDetail.setImage2(saveImage2);
        productDetail.setProductCaption(productCaption);
        product.setProductDetail(productDetail);
        boolean b = productService.saveProduct(product);
        if (b){
            model.addAttribute("info","商品保存成功");
        }else{
            model.addAttribute("info","商品保存失败");
        }

        return "addProductPage";



    }

    private String  saveImage(MultipartFile file) {
        System.out.println(context+"111");
        /*确定保存文件的根目录*/
        String uploadPath = context.getRealPath("") + File.separator + "images" + File.separator;
        /*确定文件名和路径*/
       String desPath=uploadPath+file.getOriginalFilename();
        /*创建目标文件*/
        File desFile=new File(desPath);
        try {
            FileCopyUtils.copy(file.getBytes(),desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "images"+File.separator+file.getOriginalFilename()+"*"+System.currentTimeMillis();

    }

}
