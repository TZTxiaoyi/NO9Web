package com.serviceimpl.ljl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	/**
	 * 更新项目的描述
	 * 项目主题，内容，目标资金，筹集时间
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public String UpdataDescribe(DescribeLjl describe) {
		int flag =0;
		flag =DescribeDao.UpdateDescribeProjects(describe);
		if(flag==1){
			return "success";
		}
		return "err";
		
	}
	/**
	 * 查询项目的描述
	 * 项目主题，内容，目标资金，筹集时间
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String AllDescribe(DescribeLjl describe) {
		List list=DescribeDao.AllDescribeProjects(describe);
		JSON json=new JSONArray(list);
		System.out.println(list.size());
		if(list.size()==1){
			return json.toString();
			
		}
		return "数据异常";
	}
	/**
	 * 保存更新项目封面
	 * 
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
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
