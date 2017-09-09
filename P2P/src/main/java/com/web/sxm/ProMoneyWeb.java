package com.web.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.sxm.ProMoneyService;
@Controller
@RequestMapping("money")
public class ProMoneyWeb {
	@Autowired
	ProMoneyService pmService;
	@ResponseBody
	@RequestMapping(value="/selectProMoney.do")
	public List selectProMoney(@RequestBody Integer pid){
		System.out.println("--money----");
		System.out.println(pid);
		List<Object> tList =pmService.selectProMoney(pid);
		System.out.println(tList);
		//response.setCharacterEncoding("utf-8");
		return tList;

	}
}
