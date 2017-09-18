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
	/**
	 * 
	    * @Title: selectProDetal  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 查询订单详情 
	    * @param @param projects
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectProDetal.do")
	public List selectProDetal(@RequestBody ProjectsLjl projects){
		List<Object> tList =IndeService.AllIndetail(projects);
		//response.setCharacterEncoding("utf-8");
		return tList;

	}
}
