package com.web.ljl;

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
	@RequestMapping("/AllReturn")
	@ResponseBody
	public List AllReturn(){
		List list=twoloanservice.AllReturn();
		System.out.println(list);
		return list;
	}
}
