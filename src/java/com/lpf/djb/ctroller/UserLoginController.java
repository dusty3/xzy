package com.lpf.djb.ctroller;


import com.lpf.djb.pojo.Customer;
import com.lpf.djb.pojo.LmUser;
import com.lpf.djb.service.serviceInterface.UserLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by dusty on 2018/6/18.
 */
@Controller
public class UserLoginController {
     @Resource
     private UserLoginService userLoginService;
 

     @RequestMapping(value = "/loginAction",method = RequestMethod.POST)
      public  String userlogin(@ModelAttribute LmUser lmUser, HttpSession httpSession, Model model){
          LmUser  user=userLoginService.login(lmUser);
          if(user!=null){
              httpSession.setAttribute("user",user);
              List<Customer> loadingcustomer = userLoginService.loadingcustomer(user);
              httpSession.setAttribute("custmers",loadingcustomer);
              return  "index";
          }
          model.addAttribute("info","登录失败，用户名或密码错误");
          return  "login";
     }


}
