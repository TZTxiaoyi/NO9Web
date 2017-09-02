package com.serviceimpl.tzt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.roletableDaotzt;
import com.entity.tzt.Roletable;
import com.service.tzt.RoleTableServicetzt;

@Service
public class RoleTableServicetztImpl implements RoleTableServicetzt {

	/**
	 * 角色表增删查接口
	 */
	@Autowired
	private roletableDaotzt roletableDaotzt;
	
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

}
