package com.iotek.controller;

import com.iotek.po.Customer;
import com.iotek.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/6/14.
 */
@Controller
public class CustomerLogin {
    @Resource
    CustomerService customerService;
    @RequestMapping(value = "/customerLoginPage.view",method = RequestMethod.GET)
    public  String customerLoginPage(){

        return "customerLoginPage";

    }

    @RequestMapping(value = "/customerRegisterPage.view", method = RequestMethod.GET)
    public   String   customerRegisterPage(){
        return "customerRegisterPage";

    }
    @RequestMapping(value = "/customerRegister.do", method = RequestMethod.POST)
    public   String  customerRegister(@ModelAttribute Customer customer,
                                      HttpSession httpSession, Model model){
      customer.setCustomerMoney(0.00);
        boolean isSave= customerService.saveCustomer(customer);
        if (isSave){
            /*如果用户保存成功 将用户信息填入session中 并且 转发到主页面*/
            System.out.println(customer);
            httpSession.setAttribute("customer",customer);
            return  "success";

        }else{
            /*如果没有保存成功 跳转到注册页面 提醒用户 注册失败请重新注册*/
            model.addAttribute("info","注册失败，请重新注册");

            return "customerRegisterPage";

        }


    }
    @RequestMapping(value = "/customerLogin.do",method = RequestMethod.POST)
    public  String  customerLogin(@ModelAttribute Customer customer,
                                  HttpSession httpSession, Model model){
        Customer customertByName = customerService.findCustomertByName(customer);


        if (customertByName!=null){
            System.out.println(customer);
            httpSession.setAttribute("customer",customer);
            return  "success";

        }
        model.addAttribute("info","登录失败，请重新登录");
        return "customerLoginPage";


    }
    @RequestMapping(value = "/checkCustomerName.do" ,method = RequestMethod.POST)
    public @ResponseBody String  checkCustomerName(@RequestParam(value = "customerName",required = false)
                                                               String customerName){
        System.out.println(customerName+"111111");
        boolean existCustomerName = customerService.isExistCustomerName(customerName);
//        如果用户存在则为true  用户不存在为false
        if (existCustomerName){
            return "exist";
        }
        return  "notExist";

    }
}
