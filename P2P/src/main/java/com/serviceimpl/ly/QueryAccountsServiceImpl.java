package com.serviceimpl.ly;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ly.UsersDao;
import com.entity.tzt.Accounts;
import com.entity.tzt.Roletable;
import com.service.ly.queryAccountService;
@Service
public class QueryAccountsServiceImpl implements queryAccountService{

	@Autowired
	UsersDao usersdao;
	
	@Override
	public Roletable queryRolename(Roletable roletable) {
		// TODO Auto-generated method stub
		return usersdao.queryrolename(roletable);
	}

	
	

	public List<Object> queryPowers(Roletable roletable) {
		// TODO Auto-generated method stub
		return usersdao.queryAllPowers(roletable);
	}




	@Override
	public int insPowers(String string) {
		// TODO Auto-generated method stub
		JSON json = new JSONArray();
		
		Map<String, Object> map=json.parseObject(string);
		System.out.println("-----------map:"+map);
		List list=(List) map.get("powersid");
		Integer roleid=Integer.parseInt(map.get("roleid").toString()) ;
		Map mm=new HashMap();
		mm.put("roleid", roleid);
		usersdao.deletePowers(map);
		System.out.println("-----------list:"+list);
		if(list.size()>0){
			return usersdao.insertPower(list);
		}else {
			return 0;
		}
		
	}




	
	
	
}
