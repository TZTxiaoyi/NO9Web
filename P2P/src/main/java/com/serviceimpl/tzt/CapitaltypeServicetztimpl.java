package com.serviceimpl.tzt;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.CapitaltypeDaotzt;
import com.entity.tzt.Capitaltype;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.service.tzt.CapitaltypeServicetzt;

@Service
public class CapitaltypeServicetztimpl implements CapitaltypeServicetzt {
	//类别dao接口
	@Autowired
	CapitaltypeDaotzt capitaltypeDaotzt;
	
	/**
	 * Title: queryCapitaltype  
	 * Description: 查询资金流向类别  
	 * @return   
	 * @see com.service.tzt.CapitaltypeServicetzt#queryCapitaltype()
	 */
	public String queryCapitaltype() {
		String result=JSON.toJSONString(capitaltypeDaotzt.queryCapitaltype());
		System.out.println(result);
		return result;
	}
/**
 * Title: addCapitaltype  
 * Description: 添加资金流向种类 
 * @param capitaltype
 * @return   
 * @see com.service.tzt.CapitaltypeServicetzt#addCapitaltype(com.entity.tzt.Capitaltype)
 */
	public String addCapitaltype(Capitaltype capitaltype) {
		Map result =new HashMap();
		int flag= capitaltypeDaotzt.addCapitaltype(capitaltype);;
		if (flag!=0) {
			result.put("resultType", "true");
			System.out.println(result);
			return JSON.toJSONString(result);
		}else {
			result.put("resultType", "addfail");
			System.out.println(result);

			return JSON.toJSONString(result);
		}
	}

	/**
	 * Title: updateCapitaltype  
	 * Description:  更新资金流向种类信息
	 * @param capitaltype
	 * @return   
	 * @see com.service.tzt.CapitaltypeServicetzt#updateCapitaltype(com.entity.tzt.Capitaltype)
	 */
	public String updateCapitaltype(Capitaltype capitaltype) {
		Map result =new HashMap();
		int flag= capitaltypeDaotzt.updateCapitaltype(capitaltype);;
		if (flag!=0) {
			result.put("resultType", "true");
			System.out.println(result);

			return JSON.toJSONString(result);
		}else {
			result.put("resultType", "addfail");
			System.out.println(result);

			return JSON.toJSONString(result);
		}
	}

}
