package com.web.zb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.zb.BankAccount;
import com.service.zb.BankAccountService;

/**
 * 
 * @ClassName:  BankAccountController   
 * @Description:TODO(银行账号的控制层)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:11:59   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class BankAccountController {
	@Autowired
	BankAccountService bac;
	/**
	 * 
	* @Title: queryBankAccount
	* @Description: TODO(查询银行账户的方法)
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/queryBankAccount.do")
	public void queryBankAccount(HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		List<Object> lbank = bac.queryBankAccount();
		JSON json = new JSONArray(lbank);
		System.out.println("json:"+json.toString());
		try {
			resp.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * 
	* @Title: addBankAccount
	* @Description: TODO(添加银行信息的方法)
	* @param @param str
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/addBankAccount.do")	
	public void addBankAccount(@RequestBody String str,HttpServletResponse resp){
		System.out.println("=====================");
		System.out.println("str="+str);
		BankAccount bankaccount = JSON.parseObject(str, BankAccount.class);
		System.out.println("bank"+bankaccount.getBankAccounts());
		int flag = -1;
		flag = bac.addBankAccount(bankaccount);
		System.out.println("flag="+flag);
		try {
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	* @Title: saveBankAccount
	* @Description: TODO(保存)
	* @param @param bankaccount
	* @param @return    设定文件
	* @return String    返回类型
	* @throws
	 */
	@RequestMapping(value="/saveBankAccount.do",method=RequestMethod.POST)
	public String saveBankAccount(BankAccount bankaccount){
		bac.addBankAccount(bankaccount);
		return "success";
	}
}
