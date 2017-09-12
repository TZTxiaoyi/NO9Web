package com.web.sxm;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.entity.ljl.ProjectsLjl;
import com.service.ljl.IndetailServiceLjl;

@Controller
@RequestMapping("detal")
public class ProDetalWeb {
	@Autowired
	IndetailServiceLjl IndeService;
	@ResponseBody
	@RequestMapping(value="/selectProDetal.do")
	public List selectProDetal(@RequestBody ProjectsLjl projects){
		List<Object> tList =IndeService.AllIndetail(projects);
		//response.setCharacterEncoding("utf-8");
		return tList;

	}
}
