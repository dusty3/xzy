package com.lpf.djb.ctroller;

import com.alibaba.fastjson.JSONObject;
import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Supplier;
import com.lpf.djb.service.serviceInterface.BrandService;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/27.
 */
@Controller
public class BrandController {
    @Resource
    private UserLoginService userLoginService;

    @Resource
    private BrandService brandService;

    @RequestMapping(value = "/brandview",method = RequestMethod.GET)
    public String  forwordtobrandView(HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);
        return  "view/brand/brand_list";
    }

    @RequestMapping(value = "/updatebrandView",method = RequestMethod.GET)
    public String  forwardtoBrandUpdateView(@RequestParam("brandId") String brandId, HttpSession httpSession, Model model){
        Brand brand = brandService.queryByid(Integer.valueOf(brandId));
        model.addAttribute("brand",brand);
        return  "view/brand/brand_update";
    }

    @RequestMapping(value = "updatebrand",method = RequestMethod.POST)
    public String  updatebrand(@ModelAttribute Brand Brand, HttpSession httpSession, Model model){

        Brand brand1 = brandService.queryByid(Brand.getBrandId());
        if(!brand1.getBrandName().equals(Brand.getBrandName())) {
            Boolean isexsit = brandService.customerisexist(Brand.getBrandName());
            if (isexsit) {
                model.addAttribute("info", "品牌名已存在");
                return  "view/brand/brand_update";
            }
        }

        brandService.updateBrand(Brand);



        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);
        model.addAttribute("info","修改成功");
        return  "view/brand/brand_list";
    }

    @RequestMapping(value = "/deletebrand",method = RequestMethod.GET)
    public String  deletebrand(@RequestParam("brandId") String brandId, HttpSession httpSession, Model model){
        brandService.delBrand(Integer.valueOf(brandId));
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);
        model.addAttribute("info","删除成功");
        return  "view/brand/brand_list";
    }


    @RequestMapping(value = "/addbrandview",method = RequestMethod.GET)
    public String  addbrandview( HttpSession httpSession, Model model){

        int i = brandService.querynewId();
        model.addAttribute("newbrandid",i+1);
        return  "view/brand/brand_add";
    }


    @RequestMapping(value = "/addbrand",method = RequestMethod.POST)
    public String  addbrand(@ModelAttribute  Brand brand, HttpSession httpSession, Model model){

        Boolean isexsit = brandService.customerisexist(brand.getBrandName());
        if (isexsit) {
            model.addAttribute("info", "品牌名已存在");
            return  "view/brand/brand_update";
        }
        brandService.insertBrand(brand);
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);
        model.addAttribute("info","添加成功");
        return  "view/brand/brand_list";
    }



    @RequestMapping(value = "/querybrand",method = RequestMethod.POST)
    public String  querybrand(@RequestParam("brandname") String brandname, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("brandname",brandname);
        map.put("userloginid",user.getLoginId());
        List<Brand> queryBrand = brandService.queryBrand(map);
        if(queryBrand==null||queryBrand.size()==0) {
            model.addAttribute("info", "没有您要查询的品牌");
        }

        httpSession.setAttribute("brands",queryBrand);

        return  "view/brand/brand_list";
    }



    @RequestMapping(value = "/SearchBrand",method = RequestMethod.POST)
    public @ResponseBody
    List<String> SearchBrand(@RequestBody JSONObject brandName, HttpSession httpSession, Model model){


        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("brandname",brandName.get("brandname"));
        map.put("customerId",user.getLoginId());
        List<Brand> queryBrand = brandService.queryBrand(map);
        List<String> brands=new ArrayList<>();
        for(Brand brand:queryBrand){
            brands.add(brand.getBrandName()) ;
        }
        return brands;
    }


    @RequestMapping(value = "/fillbrand",method = RequestMethod.POST)
    public @ResponseBody Brand fillbrand(@RequestBody JSONObject brandname, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("brandname",brandname.get("brandname"));
        map.put("customerId",user.getLoginId());
        Brand brand = brandService.fillbrand(map);

        return brand;
    }
}
