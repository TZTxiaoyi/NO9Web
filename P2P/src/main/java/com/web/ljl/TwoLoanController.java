package com.web.ljl;
/**
 * 项目二次放款
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.ljl.TwoLoanDaoLjl;
import com.service.ljl.TwoLoanServiceLjl;
@Controller
@RequestMapping("/TwoLoanController")
public class TwoLoanController {
	@Autowired
	TwoLoanServiceLjl twoloanservice;
	/**
	 * 查询项目回报率
	 */
	@RequestMapping("/AllReturn")
	@ResponseBody
	public List AllReturn(){
		List list=twoloanservice.AllReturn();
		System.out.println(list);
		return list;
	}
	/**
	 * 项目放款
	 */
	@RequestMapping(value="/Loan",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String Loan(@RequestBody String str){
		System.out.println("454");
		System.err.println(str);
		
		return twoloanservice.Loan(str);
		
		
		
	}
}
