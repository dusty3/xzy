package lpf.jdb.controller;

import lpf.jdb.po.Product;
import lpf.jdb.po.ProductDetail;
import lpf.jdb.service.ProductService;
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
            model.addAttribute("info","��Ʒ����ɹ�");
        }else{
            model.addAttribute("info","��Ʒ����ʧ��");
        }

        return "addProductPage";



    }

    private String  saveImage(MultipartFile file) {
        System.out.println(context+"111");
        /*ȷ�������ļ��ĸ�Ŀ¼*/
        String uploadPath = context.getRealPath("") + File.separator + "images" + File.separator;
        /*ȷ���ļ�����·��*/
       String desPath=uploadPath+file.getOriginalFilename();
        /*����Ŀ���ļ�*/
        File desFile=new File(desPath);
        try {
            FileCopyUtils.copy(file.getBytes(),desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "images"+File.separator+file.getOriginalFilename()+"*"+System.currentTimeMillis();

    }

}
