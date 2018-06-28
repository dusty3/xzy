package com.lpf.djb.ctroller;

import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Supplier;
import com.lpf.djb.service.serviceInterface.BrandService;
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


        //少了校验控制
        brandService.updateBrand(Brand);

        httpSession.setAttribute("info","修改成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);

        return  "view/brand/brand_list";
    }

    @RequestMapping(value = "/deletebrand",method = RequestMethod.GET)
    public String  deletebrand(@RequestParam("brandId") String brandId, HttpSession httpSession, Model model){
        brandService.delBrand(Integer.valueOf(brandId));

        httpSession.setAttribute("info","删除成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);

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



        brandService.insertBrand(brand);

        httpSession.setAttribute("info","添加成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Brand> loadingbrand = brandService.loadingBrand(user);
        httpSession.setAttribute("brands",loadingbrand);

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

            httpSession.setAttribute("info", "没有您要查询的品牌");
        }

        httpSession.setAttribute("brands",queryBrand);

        return  "view/brand/brand_list";
    }
}
