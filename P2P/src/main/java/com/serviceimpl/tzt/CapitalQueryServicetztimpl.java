package com.serviceimpl.tzt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.CapitalDaotzt;
import com.entity.tzt.Capital;
import com.service.tzt.CapitalQueryServicetzt;


@Service
public class CapitalQueryServicetztimpl implements CapitalQueryServicetzt {

	@Autowired
	CapitalDaotzt capitalDaotzt;
	
	
	public String queryCapital(Capital capital) {
		List <Map>result =capitalDaotzt.queryCapital(capital);
		
		String resultString =JSON.toJSONStringWithDateFormat(result, "yyyy-MM-dd HH:mm:ss");
		System.out.println(resultString);
		return resultString;
	}

}
