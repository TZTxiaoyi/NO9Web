package com.serviceimpl.tzt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.RoletableDaotzt;
import com.entity.tzt.Roletable;
import com.service.tzt.RoleTableServicetzt;

@Service
public class RoleTableServicetztImpl implements RoleTableServicetzt {

	/**
	 * 角色表增删查接口
	 */
	@Autowired
	private RoletableDaotzt roletableDaotzt;
	
	/**
	 * 
	 * Title: queryRoletable  
	 * Description:   查询角色信息
	 * @param roletable 
	 * @return   
	 * @see com.service.tzt.RoleTableServicetzt#queryRoletable(com.entity.tzt.Roletable)
	 */
	public String queryRoletable() {
		
			return JSON.toJSONString(roletableDaotzt.queryRoletable());
	}

	/**
	 * 
	 * Title: addRoletable  
	 * Description:  增加一个角色
	 * @param roletable
	 * @return   
	 * @see com.service.tzt.RoleTableServicetzt#addRoletable(com.entity.tzt.Roletable)
	 */
	@Override
	public String addRoletable(Roletable roletable) {
		Map result =new HashMap();
		int flag= roletableDaotzt.addRoletable(roletable);;
		if (flag!=0) {
			result.put("resultType", "true");
			return JSON.toJSONString(result);
		}else {
			result.put("resultType", "addfail");
			return JSON.toJSONString(result);
		}
		
	}
	/**
	 * 
	 * Title: updateRoletable  更新角色表信息
	 * Description:  
	 * @param roletable
	 * @return   
	 * @see com.service.tzt.RoleTableServicetzt#updateRoletable(com.entity.tzt.Roletable)
	 */
	public String updateRoletable(Roletable roletable) {
		
		Map result =new HashMap();
		int flag = roletableDaotzt.updateRoletable(roletable);
		if(flag!=0){
			result.put("resultType", true);
		}else{
			result.put("resultType", false);
		}
		return JSON.toJSONString(result);
	}

}
