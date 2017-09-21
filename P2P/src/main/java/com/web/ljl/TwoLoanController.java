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
	 * 项目放款根据剩余项目资金和未回报订单金额退还用户资金
	 */
	@RequestMapping(value="/Loan",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String loands(@RequestBody String str){
		System.out.println("4546");
		System.err.println(str);
		
		return twoloanservice.loands(str);
	}
	/*public String Loan(@RequestBody String str){
		System.out.println("454");
		System.err.println(str);
		
		return twoloanservice.Loan(str);
		
		
		
	}*/
	/**
	 * 系统自动确认收货
	 * @return
	 */
	@RequestMapping(value="/updateorders",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateorders(){
		return twoloanservice.updateorders();
	}
}
