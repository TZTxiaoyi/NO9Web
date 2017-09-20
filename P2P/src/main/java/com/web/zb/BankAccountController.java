package com.web.zb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
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
	@RequestMapping("/queryBankAccount")
	@ResponseBody
	public List queryBankAccount(Integer empid){
		//System.out.println("----------------zhubin.empid-------------------"+empid);
		List<Object> lbank = bac.queryBankAccount(empid);
	//	System.out.println("_________empid____________+"+lbank.get(0).toString());
		return lbank;
		
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
		//System.out.println("=====================");
		//System.out.println("str="+str);
		BankAccount bankaccount = JSON.parseObject(str, BankAccount.class);
		//System.out.println("bank"+bankaccount.getBankAccounts());
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
	* @Title: updateBankAccount
	* @Description: TODO(提现的方法)
	* @param @param txbalance
	* @param @param empid
	* @param @return    设定文件
	* @return int    返回类型
	* @throws
	 */
	@RequestMapping("/updateBankAccount")
	@ResponseBody
	public int updateBankAccount(float txbalance,Integer empid){
	//	System.out.println(txbalance+"  -----    "+empid);		
		int flag = -1;
		flag = bac.updateBankAccount(txbalance, empid);
		if(flag > 0){
			return 1;
		}
		return 0;
	}
}
