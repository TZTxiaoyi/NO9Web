package com.serviceimpl.tzt;

import java.lang.reflect.MalformedParameterizedTypeException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.keyvalue.TiedMapEntry;
import org.apache.shiro.crypto.hash.Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dao.tzt.CountDaotzt;
import com.service.tzt.CountServertzt;

@Service
public class CountServerstztImpl implements CountServertzt{
	
	@Autowired
	CountDaotzt countDaotzt;
	
	
	/**
	 * Title: Projectrate  
	 * Description:  统计项目的成功率失败率
	 * @return   
	 * @see com.service.tzt.CountServertzt#Projectrate()
	 */
	public List<Map>  Projectrate() {
		List<Map> result=countDaotzt.projectrate();
			System.out.println(result);
		List<Map> count=new ArrayList<Map>();
		float sum =  Float.parseFloat(String.valueOf(result.get(0).get("SUM")));
		float sucess =  Float.parseFloat(String.valueOf(result.get(0).get("SUCESS")));
		float fail=  Float.parseFloat(String.valueOf(result.get(0).get("FAIL")));
		
		Map sucessmap=new HashMap();
		sucessmap.put("name", "成功");
		sucessmap.put("y",(float)(Math.round(sucess/sum*100)));
		count.add(sucessmap);
		
		Map failmap=new HashMap<>();
		failmap.put("name", "失败");
		failmap.put("y", (float)(Math.round(fail/sum*100)));
		count.add(failmap);
		
		Map othermap=new HashMap<>();
		othermap.put("name", "其他(审核中)");
		othermap.put("y",(float)(Math.round( (sum-sucess-fail)/sum*100)));
		count.add(othermap);
		
		return count;
	}
	
	
	/**
	 * Title: Projcettime  
	 * Description:  统计近一周新增项目发起
	 * @return   
	 * @see com.service.tzt.CountServertzt#Projcettime()
	 */
	public String Projcettime() {
		List<Map> result=countDaotzt.projcettime();
		System.out.println(result);
		
		List categories= new ArrayList();
		List data=new ArrayList();
		
		List<Map> series= new ArrayList<Map>();
		Map time = new HashMap();
		//取值
		for (int i = 0; i < result.size(); i++) {
			result.get(i).get("TIME");
			result.get(i).get("SUM");
			
			categories.add(	result.get(i).get("TIME"));
			data.add(result.get(i).get("SUM"));
		}
		//放入数据数组
		time.put("name", "新增项目");
		time.put("data", data);
		series.add(time);
		
		//返回的总MAP
		Map Jsonmap=new HashMap();
		Jsonmap.put("categories", categories);
		Jsonmap.put("series", series);
		return JSON.toJSONString(Jsonmap);
	}

	/**
	 * Title: TypeFit  
	 * Description:  统计资金收支
	 * @return   
	 * @see com.service.tzt.CountServertzt#TypeFit()
	 */
	public String fit() {
		List<Map> result=countDaotzt.fit();
		System.out.println(result);
		

		List categories= new ArrayList();
		List data=new ArrayList();
		
		List<Map> series= new ArrayList<Map>();
		Map time = new HashMap();
		//取值
		for (int i = 0; i < result.size(); i++) {
			result.get(i).get("TIME");
			result.get(i).get("SUM");
			
			categories.add(	result.get(i).get("TIME"));
			data.add(result.get(i).get("SUM"));
		}
		//放入数据数组
		time.put("name", "资金收支");
		time.put("data", data);
		series.add(time);
		
		//返回的总MAP
		Map Jsonmap=new HashMap();
		Jsonmap.put("categories", categories);
		Jsonmap.put("series", series);
		
		return JSON.toJSONString(Jsonmap);
	}


	public String repay() {
		List<Map> result=countDaotzt.repay();
		
		return JSON.toJSONString(result);
	}


	@Override
	public String typeFit() {
		List<Map> result=countDaotzt.typeFit();
		
		return JSON.toJSONString(result);
	}
}
