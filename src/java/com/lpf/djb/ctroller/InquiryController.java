package com.lpf.djb.ctroller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lpf.djb.pojo.*;
import com.lpf.djb.service.serviceInterface.BrandService;
import com.lpf.djb.service.serviceInterface.CustomerService;
import com.lpf.djb.service.serviceInterface.InquiryService;
import com.lpf.djb.service.serviceInterface.SupplierService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/7/1.
 */
@Controller
public class InquiryController  {
    @Resource
    private InquiryService inquiryService;

    @Resource
    private CustomerService  customerService;

    @Resource
    private SupplierService  supplierService;


    @Resource
    private BrandService brandService;








    @RequestMapping(value = "/inquiryview",method = RequestMethod.GET)
    public String  forwordtoinquiryview(HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Inquiry> loadingInquirys = inquiryService.loadingInquiry(user);
        httpSession.setAttribute("inquirys",loadingInquirys);
        return  "view/inquiry/inquiry_list";
    }

    @RequestMapping(value = "/updateinquiryView",method = RequestMethod.GET)
    public String  forwardtoInuiryUpdateView(@RequestParam("inquiryId") String inquiryId, HttpSession httpSession, Model model){

      //已发送不能修改
        Inquiry inquiry = inquiryService.queryByid(Integer.valueOf(inquiryId));
        Integer inquirySend = inquiry.getInquirySend();
        if(inquirySend==1){
            model.addAttribute("info", "该询价已发送，不能修改");
            return "view/inquiry/inquiry_list";
        }
        List<Inquiryproduct> inquiryproducts=inquiryService.queryIPbyid(Integer.valueOf(inquiryId));
        Customer customer = customerService.findcutomerbyname(inquiry.getCustomerName());
        Supplier supplier = supplierService.queryByid(inquiry.getSupplierId());
        Brand brand = brandService.queryByid(inquiry.getBrandId());
        model.addAttribute("inquiry",inquiry);
        model.addAttribute("inquiryproducts",inquiryproducts);
        model.addAttribute("customer",customer);
        model.addAttribute("supplier",supplier);
        model.addAttribute("brand",brand);
        return  "view/inquiry/inquiry_update";

    }


    @RequestMapping(value = "/sendinquery",method = RequestMethod.GET)
    public String  sendinquery(@RequestParam("inquiryId") String inquiryId,HttpSession httpSession, Model model){
        Inquiry inquiry = inquiryService.queryByid(Integer.valueOf(inquiryId));
        if(inquiry.getInquirySend()==0) {
            if (inquiry.getInquiryStyle()==0) {
                Supplier supplier = supplierService.queryByid(inquiry.getSupplierId());
                Brand brand = brandService.querybyname(inquiry.getBrandName());
                List<Inquiryproduct> inquiryproducts = inquiryService.queryIPbyid(Integer.valueOf(inquiryId));
                inquiryService.sendmail(inquiry, supplier, brand, inquiryproducts);
                inquiryService.issend(Integer.valueOf(inquiryId));
                LmUser user = (LmUser) httpSession.getAttribute("user");
                List<Inquiry> loadingInquirys = inquiryService.loadingInquiry(user);
                httpSession.setAttribute("inquirys", loadingInquirys);
                model.addAttribute("info", "发送询价成功");
                return "view/inquiry/inquiry_list";
            }else{
                return "view/inquiry/inquiry_list";
            }
        }else{
            return "view/inquiry/inquiry_list";
        }

    }


    @RequestMapping(value = "/sendmoremail",method = RequestMethod.POST)
    public @ResponseBody List<String> sendmoremail(@RequestBody JSONArray a, HttpSession httpSession, Model model){
       List<String> result=new ArrayList<>();

        for (int i=0;i<a.size();i++){
            String  o = (String) a.get(i);
            Inquiry inquiry = inquiryService.queryByid(Integer.valueOf(o));
            if(inquiry.getInquirySend()==0) {
                if (inquiry.getInquiryStyle()==0) {
                    Supplier supplier = supplierService.queryByid(inquiry.getSupplierId());
                    Brand brand = brandService.querybyname(inquiry.getBrandName());
                    List<Inquiryproduct> inquiryproducts = inquiryService.queryIPbyid(Integer.valueOf(o));
                    inquiryService.sendmail(inquiry, supplier, brand, inquiryproducts);
                    inquiryService.issend(Integer.valueOf(o));
                    result.add(o);
                }else{

                }
            }else{

            }
        }
        return result;
    }


    @RequestMapping(value = "/deleteinquiry",method = RequestMethod.GET)
    public String  deleteinquiry(@RequestParam("inquiryId") String inquiryId, HttpSession httpSession, Model model){
        inquiryService.delinquiry(Integer.valueOf(inquiryId) );
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Inquiry> loadingInquirys = inquiryService.loadingInquiry(user);
        httpSession.setAttribute("inquirys",loadingInquirys);
        model.addAttribute("info", "删除成功");
        return  "view/inquiry/inquiry_list";
    }


    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

        @RequestMapping(value = "/queryinquiry",method = RequestMethod.POST)
    public String  queryinquiry(@RequestParam("inquiryCreatetime1") String inquiryCreatetime1,@ModelAttribute  Inquiry inquiry, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("inquiryCreatetime1",inquiryCreatetime1);
        map.put("loginUsercode",user.getLoginUsercode());
        map.put("inquiryId",inquiry.getInquiryId());
        map.put("brandName",inquiry.getBrandName());
        map.put("customerName",inquiry.getCustomerName());
        map.put("supplierName",inquiry.getSupplierName());
        map.put("inquiryStyle",inquiry.getInquiryStyle());
        map.put("inquiryCreatetime",inquiry.getInquiryCreatetime());
        map.put("inquirySend",inquiry.getInquirySend());
        List<Inquiry> queryinquiry=inquiryService.queryinquiry(map);
        if(queryinquiry==null||queryinquiry.size()==0) {

            model.addAttribute("info", "没有您要查询的询价");
        }

            httpSession.setAttribute("inquirys",queryinquiry);
            return  "view/inquiry/inquiry_list";
    }


    @RequestMapping(value = "/addinquiryview",method = RequestMethod.GET)
    public String  addinquiryview( HttpSession httpSession, Model model){

        int i = inquiryService.querynewId();
        model.addAttribute("newinquiryid",i+1);
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
        model.addAttribute("createdate",format);
        return  "view/inquiry/inquiry_add";
    }

    @RequestMapping(value = "/addinquiry",method = RequestMethod.POST)
    public String  addinquiry(@ModelAttribute  Inquiry inquiry, HttpSession httpSession, Model model){
        //判断品牌是否存在
        String brandName = inquiry.getBrandName();
        Boolean isexsit = brandService.customerisexist(brandName);
            if (!isexsit) {
                model.addAttribute("info", "品牌名不存在");
                return  "view/inquiry/inquiry_add";
            }

       //判断客户是否存在
        String customerName = inquiry.getCustomerName();
        isexsit = customerService.customerisexist(customerName);
        if (!isexsit) {
            model.addAttribute("info", "公司名不存在");
            return  "view/inquiry/inquiry_add";
        }
        //判断供应商是否存在
        String supplierName = inquiry.getSupplierName();
         isexsit = supplierService.supplierisexist(supplierName);
        if (!isexsit) {
            model.addAttribute("info", "供应商名不存在");
            return  "view/inquiry/inquiry_add";
        }
        inquiryService.insert(inquiry);
        List<Inquiryproduct> inquiryproducts = inquiry.getInquiryproducts();
        List<Inquiryproduct>  realinquiryproducts=new ArrayList<>();
        for (Inquiryproduct x: inquiryproducts ) {
                if(x.getIpDr()!=null)realinquiryproducts.add(x);
            x.setInquiryId(inquiry.getInquiryId().toString());
        }
        inquiryService.insertinquriyproduct(realinquiryproducts);
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Inquiry> loadingInquirys = inquiryService.loadingInquiry(user);
        httpSession.setAttribute("inquirys",loadingInquirys);
        model.addAttribute("info", "添加成功");
        return  "view/inquiry/inquiry_list";
    }



    @RequestMapping(value = "/updateinquiry",method = RequestMethod.POST)
    public String  updateinquiry(@ModelAttribute  Inquiry inquiry, HttpSession httpSession, Model model){
        //判断品牌是否存在
        String brandName = inquiry.getBrandName();
        Boolean isexsit = brandService.customerisexist(brandName);
        if (!isexsit) {
            model.addAttribute("info", "品牌名不存在");
            return  "view/inquiry/inquiry_update";
        }

        //判断客户是否存在
        String customerName = inquiry.getCustomerName();
        isexsit = customerService.customerisexist(customerName);
        if (!isexsit) {
            model.addAttribute("info", "公司名不存在");
            return  "view/inquiry/inquiry_update";
        }
        //判断供应商是否存在
        String supplierName = inquiry.getSupplierName();
        isexsit = supplierService.supplierisexist(supplierName);
        if (!isexsit) {
            model.addAttribute("info", "供应商名不存在");
            return  "view/inquiry/inquiry_update";
        }
        inquiryService.updateinquiry(inquiry);
        List<Inquiryproduct> inquiryproducts = inquiry.getInquiryproducts();
        List<Inquiryproduct>  realinquiryproducts=new ArrayList<>();
        for (Inquiryproduct x: inquiryproducts ) {
            if(x.getIpDr()!=null||x.getCpId()!=null) {
                realinquiryproducts.add(x);
                x.setInquiryId(inquiry.getInquiryId().toString());
            }
        }
        if(realinquiryproducts.size()!=0) {
            List<Inquiryproduct>  updatelist=new ArrayList<>();
            List<Inquiryproduct>  addlist=new ArrayList<>();
            List<Integer>  cpid=new ArrayList<>();
            for (Inquiryproduct x: realinquiryproducts ) {
               if(x.getCpId()!=null){
                   updatelist.add(x);
                   cpid.add(x.getCpId());
               }    else{
                   addlist.add(x);
               }

            }
            if(cpid.size()!=0){
                HashMap map=new HashMap();
                map.put("inquiryid",inquiry.getInquiryId());
                map.put("cpid",cpid);
                inquiryService.deleteinquriyproduct(map);
            }
            if(addlist.size()!=0) inquiryService.insertinquriyproduct(realinquiryproducts);
            if(updatelist.size()!=0) inquiryService.updateinquriyproduct(realinquiryproducts);

        }
        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Inquiry> loadingInquirys = inquiryService.loadingInquiry(user);
        httpSession.setAttribute("inquirys",loadingInquirys);
        model.addAttribute("info", "修改成功");
        return  "view/inquiry/inquiry_list";
    }

    @RequestMapping(value = "/inquiryrefer",method = RequestMethod.GET)
    public String  forwordtoinquiryrefview(HttpSession httpSession, Model model){
        List<Inquiry> loadingInquirys = inquiryService.loadingAllInquiry();
        httpSession.setAttribute("inquirys",loadingInquirys);
        return  "view/inquiry/inquiry_refer";
    }


    @RequestMapping(value = "/queryallinquiry",method = RequestMethod.POST)
    public String  queryallinquiry(@RequestParam("inquiryCreatetime1") String inquiryCreatetime1,@RequestParam("productType") String productType,@ModelAttribute  Inquiry inquiry, HttpSession httpSession, Model model){
        HashMap map=new HashMap<String,Object>();
        map.put("inquiryCreatetime1",inquiryCreatetime1);
        map.put("inquiryId",inquiry.getInquiryId());
        map.put("productType",productType);
        map.put("brandName",inquiry.getBrandName());
        map.put("supplierName",inquiry.getSupplierName());
        map.put("inquiryStyle",inquiry.getInquiryStyle());
        map.put("inquiryCreatetime",inquiry.getInquiryCreatetime());
        map.put("inquirySend",inquiry.getInquirySend());
        List<Inquiry> queryinquiry=inquiryService.queryinquiry(map);
        if(queryinquiry==null||queryinquiry.size()==0) {

            model.addAttribute("info", "没有您要查询的询价");
        }

        httpSession.setAttribute("inquirys",queryinquiry);
        return  "view/inquiry/inquiry_refer";
    }

}
