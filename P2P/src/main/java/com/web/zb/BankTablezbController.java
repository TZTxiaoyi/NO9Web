package com.web.zb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.zb.BankTablezbService;

/**
 * 
 * @ClassName:  BankTablezbController   
 * @Description:TODO(银行表的控制层)   
 * @author: 朱彬
 * @date:   2017年9月9日 下午2:53:29   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class BankTablezbController {
	@Autowired
	BankTablezbService bts;
	/**
	 * 
	* @Title: queryBankTablezb
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param     设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/queryBankTable.do")
	@ResponseBody
	public List queryBankTablezb(){
		//System.out.println("----------------zhubin.queryBankTable-------------------");
		List<Object> lbank = bts.queryBankTablezb();
		
		return lbank;
	}
}
