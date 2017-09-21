package com.web.zb;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.zb.Accountszb;
import com.service.zb.AccountzbService;

/**
 * 
 * @ClassName:  AccountzbController   
 * @Description:TODO(Account controller层)   
 * @author: 朱彬
 * @date:   2017年9月14日 下午2:45:11   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class AccountzbController {
	@Autowired
	AccountzbService aservice;
	/**
	 * 
	* @Title: updateAccounts
	* @Description: TODO(xiu gai mi ma de fang fa)
	* @param @param str
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/updateAccount.do")
	public void updateAccounts(@RequestBody String str,HttpServletResponse resp){
		System.out.println("=========="+str);
				JSON json=new JSONArray();		
				Map map=(Map)json.parse(str);
				System.out.println("-------"+map);
				int flag = aservice.updateAccounts(map);
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
	* @Title: queryAccount
	* @Description: TODO(查询账号的方法)
	* @param     设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("queryAccount.do")
	@ResponseBody
	public String queryAccount(String account, HttpServletRequest req){
		System.out.println("=======account========"+account);
		/*List account =  (List) req.getSession().getAttribute("accounts");
		System.out.println("--accounts--"+account);*/
		List<Accountszb> acc = aservice.queryAccount(account);
		System.out.println("---acc---"+acc.size());
		if(acc.size()>0){
			return "false";
		}else{
			return "ture";
		}
		
	}
}
