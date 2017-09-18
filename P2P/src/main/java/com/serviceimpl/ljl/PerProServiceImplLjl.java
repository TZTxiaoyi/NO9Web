package com.serviceimpl.ljl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ljl.PersonalProjectsDaoLjl;
import com.dao.ljl.ProjectsDaoLjl;
import com.entity.ljl.PerProLjl;
import com.service.ljl.PerProServiceLjl;
@Service
public class PerProServiceImplLjl implements PerProServiceLjl{
	@Autowired
	PersonalProjectsDaoLjl PerDao;
	@Autowired
	ProjectsDaoLjl proLjl;
	/**
	 * 更新项目发起人的信息
	 * 提交的资料
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int UpdataPerPro(PerProLjl perpro) {
		int flag1=proLjl.UpdateProType(perpro);
		int flag=PerDao.UpdatePersonalProjects(perpro);
		return flag;
	}
	/**
	 * 查询项目发起人的资料信息
	 * 
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String AllPerPro(PerProLjl perpro) {
		List list=PerDao.AllPersonalProjects(perpro);
		JSON json=new JSONArray(list);
		System.out.println(list.size());
		if(list.size()==1){
			return json.toString();
			
		}
		return "数据异常";
	}

	/**
	 * 保存更新发起人身份证图片
	 * 
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public Map SaveIdentity(Map map,PerProLjl perpro){
		System.out.println("cardimage:"+perpro.getCardimage1());
		System.out.println("cardimage:"+perpro.getCardimage2());
		if(perpro.getCardimage1()!=null){
			String url=(String)map.get("url");
			System.out.println("url:"+url);
			perpro.setCardimage1(url);
		}
		if(perpro.getCardimage2()!=null){
			String url=(String)map.get("url");
			System.out.println("url:"+url);
			perpro.setCardimage2(url);
		}
		System.out.println("errew45");
		int flag=PerDao.UpdatePersonalProjects(perpro);
		if(flag==1){
			return map;
		}else{
			map.put("flag",1);
			return map;
		}
	}
	
	
}
