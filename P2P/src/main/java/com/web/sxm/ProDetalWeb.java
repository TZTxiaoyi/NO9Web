package com.web.sxm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.entity.sxm.Projects_indetail;
import com.service.sxm.ProDetalService;

@Controller
@RequestMapping("detal")
public class ProDetalWeb {
	@Autowired
	ProDetalService pService;
	@ResponseBody
	@RequestMapping(value="/selectProDetal.do")
	public List selectProDetal(@RequestBody Integer pid){
		System.out.println("------");
		List<Object> tList =pService.selectProdetal(pid);
		System.out.println(tList);
		//response.setCharacterEncoding("utf-8");
		return tList;

	}
}
