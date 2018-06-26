package com.lpf.djb.ctroller;


import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.CustomerService;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import javafx.collections.ObservableMap;
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
import java.util.Map;

/**
 * Created by dusty on 2018/6/23.
 */
@Controller
public class CustomerCotroller {
    @Resource
    private CustomerService customerService;

    @Resource
    private UserLoginService userLoginService;

    @RequestMapping(value = "/updatecustomerView",method = RequestMethod.GET)
    public String  forwardtoUpdateView(@RequestParam("customerId") String customerId, HttpSession httpSession, Model model){
        Customer customer = customerService.queyByid(Integer.valueOf(customerId));
        model.addAttribute("customer",customer);
        return  "view/customer/customer_update";

    }

    @RequestMapping(value = "updatecustomer",method = RequestMethod.POST)
    public String  updatecustomer(@ModelAttribute  Customer customer, HttpSession httpSession, Model model){


        //少了校验控制
        customerService.updateCustomer(customer);

        httpSession.setAttribute("info","修改成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);

         return  "view/customer/customer_list";
    }





    @RequestMapping(value = "/deletecustomer",method = RequestMethod.GET)
    public String  deletecustomer(@RequestParam("customerId") String customerId, HttpSession httpSession, Model model){
        customerService.delcutomer(Integer.valueOf(customerId));

        httpSession.setAttribute("info","删除成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);

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



        customerService.insertCustomer(customer);

        httpSession.setAttribute("info","添加成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);

        return  "view/customer/customer_list";
    }


    @RequestMapping(value = "/querycustomer",method = RequestMethod.POST)
    public String  querycustomer(@RequestParam("corpname") String corpname, HttpSession httpSession, Model model){

        LmUser user = (LmUser) httpSession.getAttribute("user");
        HashMap map=new HashMap<String,Object>();
        map.put("corpname",corpname);
        map.put("customerId",user.getLoginId());
        List<Customer> querycustomer = customerService.querycustomer(map);
        if(querycustomer==null||querycustomer.size()==0) {

            httpSession.setAttribute("info", "没有您要查询的公司");
        }

        httpSession.setAttribute("custmers",querycustomer);

        return  "view/customer/customer_list";
    }


}
