package com.web.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ljl.ReturnLjl;
import com.service.sxm.ProReturnService;
@Controller
@RequestMapping("return")
public class ProReturnWeb {
	@Autowired
	ProReturnService prs;
	@ResponseBody
	@RequestMapping(value="selectProReturn.do")
	public List selectProReturn(@RequestBody ReturnLjl  r){
		System.out.println("----fffffff-----------");
		System.out.println("回报"+prs.selectProReturn(r));
		return prs.selectProReturn(r);
	}
}
