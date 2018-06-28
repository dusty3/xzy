package com.lpf.djb.ctroller;

import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.pojo.Supplier;
import com.lpf.djb.service.serviceInterface.SupplierService;
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
public class SupplierCotroller {

    @Resource
    private UserLoginService userLoginService;

    @Resource
    private SupplierService  supplierService;

    @RequestMapping(value = "/supplierview",method = RequestMethod.GET)
    public String  forwordtosupplierView( HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Supplier> loadingsupplier = supplierService.loadingsupplier(user);
        httpSession.setAttribute("suppliers",loadingsupplier);
        return  "view/supplier/supplier_list";
    }

    @RequestMapping(value = "/updatesupplierView",method = RequestMethod.GET)
    public String  forwardtoSupplierUpdateView(@RequestParam("supplierid") String supplierid, HttpSession httpSession, Model model){
        Supplier supplier = supplierService.queryByid(Integer.valueOf(supplierid));
        model.addAttribute("supplier",supplier);
        return  "view/supplier/supplier_update";
    }

    @RequestMapping(value = "updatesupplier",method = RequestMethod.POST)
    public String  updatesupplier(@ModelAttribute Supplier supplier, HttpSession httpSession, Model model){


        //少了校验控制
        supplierService.updateSupplier(supplier);

        httpSession.setAttribute("info","修改成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Supplier> loadingsupplier = supplierService.loadingsupplier(user);
        httpSession.setAttribute("suppliers",loadingsupplier);

        return  "view/supplier/supplier_list";
    }

    @RequestMapping(value = "/deletsupplier",method = RequestMethod.GET)
    public String  deletsupplier(@RequestParam("supplierid") String supplierid, HttpSession httpSession, Model model){
        supplierService.delsupplier(Integer.valueOf(supplierid));

        httpSession.setAttribute("info","删除成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Supplier> loadingsupplier = supplierService.loadingsupplier(user);
        httpSession.setAttribute("suppliers",loadingsupplier);

        return  "view/supplier/supplier_list";
    }


    @RequestMapping(value = "/addsupplierview",method = RequestMethod.GET)
    public String  addsupplierview( HttpSession httpSession, Model model){

        int i = supplierService.querynewId();
        model.addAttribute("newsupplierid",i+1);
        return  "view/supplier/supplier_add";
    }


    @RequestMapping(value = "/addsupplier",method = RequestMethod.POST)
    public String  addsupplier(@ModelAttribute  Supplier supplier, HttpSession httpSession, Model model){



        supplierService.insertsupplier(supplier);

        httpSession.setAttribute("info","添加成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Supplier> loadingsupplier = supplierService.loadingsupplier(user);
        httpSession.setAttribute("suppliers",loadingsupplier);

        return  "view/supplier/supplier_list";
    }



    @RequestMapping(value = "/querysupplier",method = RequestMethod.POST)
    public String  querysupplier(@RequestParam("supplierName") String supplierName, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("supplierName",supplierName);
        map.put("userloginid",user.getLoginId());
        List<Supplier> querysupplier = supplierService.querysupplier(map);
        if(querysupplier==null||querysupplier.size()==0) {

            httpSession.setAttribute("info", "没有您要查询的供应商");
        }

        httpSession.setAttribute("suppliers",querysupplier);

        return  "view/supplier/supplier_list";
    }
}
