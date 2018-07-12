package com.lpf.djb.service.impl;

import com.lpf.djb.dao.InquiryMapper;
import com.lpf.djb.dao.InquiryproductMapper;
import com.lpf.djb.pojo.*;
import com.lpf.djb.service.serviceInterface.InquiryService;
import com.lpf.djb.util.MailUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dusty on 2018/7/1.
 */
@Service
public class InquiryServiceImpl implements InquiryService {

    @Resource
    private InquiryMapper  inquiryMapper;

    @Resource
    private InquiryproductMapper  inquiryproductMapper;

    @Override
    public List<Inquiry> loadingInquiry(LmUser lmUser) {
        return inquiryMapper.loadingInquiry(lmUser);
    }

    @Override
    public Inquiry queryByid(Integer integer) {
        return inquiryMapper.selectByPrimaryKey(integer);
    }

    @Override
    public List<Inquiryproduct> queryIPbyid(Integer inquiryId) {
        return inquiryproductMapper.queryIPbyid(inquiryId);
    }

    @Override
    public void sendmail(Inquiry inquiry, Supplier supplier, Brand brand, List<Inquiryproduct> inquiryproducts) {
        StringBuffer buffer=createcontent(inquiry,supplier,brand,inquiryproducts);
        send( inquiry,buffer,inquiry.getInquiryId());
    }

    @Override
    public void issend(Integer inquiryId) {
        inquiryMapper.issend(inquiryId);
    }

    @Override
    public void delinquiry(Integer integer) {
        inquiryMapper.delinquiry(integer);
    }

    @Override
    public List<Inquiry> queryinquiry(HashMap map) {
        return inquiryMapper.queryinquiry(map);
    }

    @Override
    public int querynewId() {
        return inquiryMapper.querynewinquiryId();
    }

    @Override
    public void insert(Inquiry inquiry) {
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format1 = format.format(date);
        inquiry.setInquiryCreatetime(format1);
        inquiry.setInquiryDr(0);
        inquiryMapper.insert(inquiry);
    }

    @Override
    public void insertinquriyproduct(List<Inquiryproduct> realinquiryproducts) {
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Inquiryproduct x:
                realinquiryproducts  ) {
            x.setIpDr(0);
        }
        inquiryproductMapper.insertinquriyproduct(realinquiryproducts);
    }

    @Override
    public void updateinquiry(Inquiry inquiry) {
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        inquiry.setInquiryModifytime(format.format(date));
        inquiry.setInquiryDr(0);
        inquiryMapper.updateinquiry(inquiry);
    }

    @Override
    public void updateinquriyproduct(List<Inquiryproduct> realinquiryproducts) {
        for (Inquiryproduct  x:realinquiryproducts) {
            inquiryproductMapper.updateinquriyproduct(x);
        }
    }

    @Override
    public void deleteinquriyproduct(HashMap map) {
        inquiryproductMapper.deleteinquriyproduct(map);
    }

    @Override
    public List<Inquiry> loadingAllInquiry() {
        return inquiryMapper.loadingAllInquiry();
    }

    private void send(Inquiry inquiry,StringBuffer buffer, Integer inquiryId) {
        MailUtil mailUtil=new MailUtil();
        String path = Thread.currentThread().getContextClassLoader().getResource("../").getPath();
        path=path+"mailfile/11.txt";
        // 设置发件人地址、收件人地址和邮件标题
        mailUtil.setAddress("inquiry@126.com", "inquiry@da-wind.com", "询价单号:"+inquiry.getInquiryMakingpartname()+inquiryId);
        // 设置要发送附件的位置和标题
        mailUtil.setAffix(path, "11.txt");

        /**
         * 设置smtp服务器以及邮箱的帐号和密码
         * 用QQ 邮箱作为发生者不好使 （原因不明）
         * 163 邮箱可以，但是必须开启  POP3/SMTP服务 和 IMAP/SMTP服务
         * 因为程序属于第三方登录，所以登录密码必须使用163的授权码
         */
        // 注意： [授权码和你平时登录的密码是不一样的]
        mailUtil.send("smtp.126.com", "inquiry@126.com", "daiwen20182018",buffer);
    }

    private StringBuffer createcontent(Inquiry inquiry, Supplier supplier, Brand brand, List<Inquiryproduct> inquiryproducts) {
          StringBuffer context=new StringBuffer();
           String mail=supplier.getSupplierInquiryemail()==null?"null":supplier.getSupplierInquiryemail();
          context.append("E-Mail: ").append(mail).append("\n");
        context.append("\n");
        context.append("\n");

        for (Inquiryproduct inquiryproduct:inquiryproducts) {
            String brandname=  brand.getBrandName()==null?"null": brand.getBrandName();
            context.append("Marke: ").append(brandname).append("\n");
            String  prdes=  inquiryproduct.getProductDescription()==null?"null":inquiryproduct.getProductDescription();
            context.append("Beschreibung: ").append(prdes).append("\n");
            String protype=  inquiryproduct.getProductType()==null?"null":inquiryproduct.getProductType();
            context.append("Type: ").append(protype).append("\n");
            Integer inquirynumber=inquiryproduct.getInquiryNumber()==null?0:inquiryproduct.getInquiryNumber();
            context.append("Menge: ").append(String.valueOf(inquirynumber)).append("\n");
        }
        context.append("\n");
        context.append("\n");
        context.append("\n");

       String  lanauage= inquiry.getInquiryLanguage()==null?"null":(inquiry.getInquiryLanguage()==0?"DE":"EN");
        context.append("Language: ").append(lanauage).append("\n");
        String  suppliername= supplier.getSupplierName()==null?"null": supplier.getSupplierName();
        context.append("Firma: ").append(suppliername).append("\n");
       String  sim= supplier.getSupplierInquiryman()==null?"null": supplier.getSupplierInquiryman();
        context.append("Kontakt:").append(sim).append("\n");
        String phone=supplier.getSupplierInquiryphone()==null?"null":supplier.getSupplierInquiryphone();
        context.append("Tel: ").append(phone).append("\n");
        return  context;
    }
    
}
