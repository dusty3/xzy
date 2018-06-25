package com.lpf.djb.ctroller;


import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.CustomerService;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = "/updatecustomerView",method = RequestMethod.GET)
    public String  forwardtoUpdateView(@RequestParam("customerId") String customerId, HttpSession httpSession, Model model){
        Customer customer = customerService.queyByid(Integer.valueOf(customerId));
        model.addAttribute("customer",customer);
        return  "view/customer/customer/customer_update";

    }

    @RequestMapping(value = "updatecustomer",method = RequestMethod.POST)
    public String  updatecustomer(@ModelAttribute  Customer customer, HttpSession httpSession, Model model){


        //少了校验控制
        customerService.updateCustomer(customer);

        httpSession.setAttribute("info","修改成功！");

        LmUser user = (LmUser) httpSession.getAttribute("user");
        List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
        httpSession.setAttribute("custmers",loadingcustomer);

         return  "view/customer/customer/customer_list";
    }
}
