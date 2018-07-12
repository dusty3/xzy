package com.lpf.djb.ctroller;


import com.alibaba.fastjson.JSONObject;
import com.lpf.djb.pojo.Brand;
import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.BrandService;
import com.lpf.djb.service.serviceInterface.CustomerService;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/6/23.
 */
@Controller
public class CustomerCotroller {
    @Resource
    private CustomerService customerService;

    @Resource
    private UserLoginService userLoginService;

    @Resource
    private BrandService  brandService;

    @RequestMapping(value = "/updatecustomerView",method = RequestMethod.GET)
    public String  forwardtoUpdateView(@RequestParam("customerId") String customerId, HttpSession httpSession, Model model){
        Customer customer = customerService.queyByid(Integer.valueOf(customerId));
        model.addAttribute("customer",customer);
        return  "view/customer/customer_update";
    }

    @RequestMapping(value = "updatecustomer",method = RequestMethod.POST)
    public String  updatecustomer(@ModelAttribute  Customer customer, HttpSession httpSession, Model model){

        Customer customer1 = customerService.queyByid(customer.getCustomerId());
        if(!customer1.getCustomerName().equals(customer.getCustomerName())) {
            Boolean isexsit = customerService.customerisexist(customer.getCustomerName());
            if (isexsit) {
                model.addAttribute("info", "公司名已存在");
                return "view/customer/customer_update";
            }
        }
        customerService.updateCustomer(customer);


//        httpSession.setAttribute("info","修改成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);
        model.addAttribute("info","修改成功");
         return  "view/customer/customer_list";
    }





    @RequestMapping(value = "/deletecustomer",method = RequestMethod.GET)
    public String  deletecustomer(@RequestParam("customerId") String customerId, HttpSession httpSession, Model model){
        customerService.delcutomer(Integer.valueOf(customerId));

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);
        model.addAttribute("info","删除成功");
        return  "view/customer/customer_list";
    }


    @RequestMapping(value = "/tocustomerview",method = RequestMethod.GET)
    public String  tocustomerview( HttpSession httpSession, Model model){

        int i = customerService.querynewId();
        model.addAttribute("newcustomerid",i+1);
        return  "view/customer/customer_add";
    }



    @RequestMapping(value = "/addcustomer",method = RequestMethod.POST)
    public String  addcustomer(@ModelAttribute  Customer customer, HttpSession httpSession, Model model){

        Boolean isexsit=customerService.customerisexist(customer.getCustomerName());
        if(isexsit){
            model.addAttribute("info","公司名已存在");
            return  "view/customer/customer_add";
        }

        customerService.insertCustomer(customer);

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);
        model.addAttribute("info","添加成功");
        return  "view/customer/customer_list";
    }


    @RequestMapping(value = "/querycustomer",method = RequestMethod.POST)
    public String  querycustomer(@RequestParam("corpname") String corpname, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("corpname",corpname);
        map.put("loginUsercode",user.getLoginUsercode());

        List<Customer> querycustomer = customerService.querycustomer(map);
        if(querycustomer==null||querycustomer.size()==0) {
            model.addAttribute("info", "没有您要查询的公司");
        }

        httpSession.setAttribute("custmers",querycustomer);

        return  "view/customer/customer_list";
    }


    @RequestMapping(value = "/Searchcustomer",method = RequestMethod.POST)
    public @ResponseBody List<String> Searchcustomer(@RequestBody JSONObject corpname, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("corpname",corpname.get("corpname"));
        map.put("loginUsercode",user.getLoginUsercode());
        List<Customer> querycustomer = customerService.querycustomer(map);
        List<String> corpnames=new ArrayList<>();
        for(Customer customer:querycustomer){
            corpnames.add(customer.getCustomerName()) ;
        }
        return corpnames;
    }


    @RequestMapping(value = "/fillcustomer",method = RequestMethod.POST)
    public @ResponseBody Customer fillcustomer(@RequestBody JSONObject customername, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("customername",customername.get("customername"));
        map.put("customerId",user.getLoginId());
        Customer querycustomer = customerService.fillcutomer(map);

        return querycustomer;
    }

    @RequestMapping(value = "/customerview",method = RequestMethod.GET)
    public String  forwordcustomerviewView(HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);
        return  "view/customer/customer_list";
    }


}
