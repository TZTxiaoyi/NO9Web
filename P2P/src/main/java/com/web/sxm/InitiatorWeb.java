package com.web.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ljl.ProjectsLjl;
import com.entity.sxm.Organizations;
import com.entity.sxm.Originator;
import com.service.sxm.InitiatorService;
@Controller
@RequestMapping("InitiatorWeb")
public class InitiatorWeb {
	@Autowired
	InitiatorService iservice;
	
	/**
	 * 
	    * @Title: selectOriginator  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询个人发起人信息 
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="selectOriginator")
	public List selectOriginator(@RequestBody Originator og){
		System.out.println("个人"+iservice.selectOriginator(og));
		return iservice.selectOriginator(og);
	}
	
	/**
	 * 
	    * @Title: selectOrganizations  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询机构发起人信息
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="selectOrganizations")
	public List selectOrganizations(@RequestBody Organizations oj){
		System.out.println("机构"+iservice.selectOrganizations(oj));
		return iservice.selectOrganizations(oj);
	}
}
