package lpf.jdb.controller;

import lpf.jdb.po.Customer;
import lpf.jdb.service.CustomerService;
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
            /*����û�����ɹ� ���û���Ϣ����session�� ���� ת������ҳ��*/
            System.out.println(customer);
            httpSession.setAttribute("customer",customer);
            return  "success";

        }else{
            /*���û�б���ɹ� ��ת��ע��ҳ�� �����û� ע��ʧ��������ע��*/
            model.addAttribute("info","ע��ʧ�ܣ�������ע��");

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
        model.addAttribute("info","��¼ʧ�ܣ������µ�¼");
        return "customerLoginPage";


    }
    @RequestMapping(value = "/checkCustomerName.do" ,method = RequestMethod.POST)
    public @ResponseBody String  checkCustomerName(@RequestParam(value = "customerName",required = false)
                                                               String customerName){
        System.out.println(customerName+"111111");
        boolean existCustomerName = customerService.isExistCustomerName(customerName);
//        ����û�������Ϊtrue  �û�������Ϊfalse
        if (existCustomerName){
            return "exist";
        }
        return  "notExist";

    }
}
