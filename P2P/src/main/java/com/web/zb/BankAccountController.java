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
 * @Description:TODO(�����˺ŵĿ��Ʋ�)   
 * @author: ���
 * @date:   2017��9��5�� ����9:57:08   
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
	* @Description: TODO(��ѯ)
	* @param @param resp    �趨�ļ�
	* @return void    ��������
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
	* @Title: AddBankAccount
	* @Description: TODO(������з���)
	* @param     �趨�ļ�
	* @return void    ��������
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
	@RequestMapping(value="/saveBankAccount.do",method=RequestMethod.POST)
	public String saveBankAccount(BankAccount bankaccount){
		bac.addBankAccount(bankaccount);
		return "success";
	}
}
