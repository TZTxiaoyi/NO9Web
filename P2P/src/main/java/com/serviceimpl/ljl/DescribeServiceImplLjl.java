package com.serviceimpl.ljl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ljl.DescribeProjectsDaoLjl;
import com.entity.ljl.DescribeLjl;
import com.service.ljl.DescribeServiecLjl;
@Service
public class DescribeServiceImplLjl implements DescribeServiecLjl{
	@Autowired
	DescribeProjectsDaoLjl DescribeDao;
	@Override
	public int UpdataDescribe(DescribeLjl describe) {
		int flag =DescribeDao.UpdateDescribeProjects(describe);
		return flag;
	}

	@Override
	public String AllDescribe(DescribeLjl describe) {
		List list=DescribeDao.AllDescribeProjects(describe);
		JSON json=new JSONArray(list);
		System.out.println(list.size());
		if(list.size()==1){
			return json.toString();
			
		}
		return "数据异常";
	}

	@Override
	public Map SaveCover(Map map, DescribeLjl describe) {
		String url=(String)map.get("url");
		describe.setCover(url);
		
		int flag=DescribeDao.UpdateDescribeProjects(describe);
		if(flag==1){
			return map;
		}else{
			map.put("flag",1);
			return map;
		}
	}

}
