package com.serviceimpl.ljl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.dao.ljl.EmployeeDaoLjl;
import com.dao.ljl.PlatformFundsDaoLjl;
import com.dao.ljl.TwoLoanDaoLjl;
import com.entity.ljl.PlatformFundsLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Orders;
import com.service.ljl.TwoLoanServiceLjl;
@Service
public class TwoLoanServiceImplLjl implements TwoLoanServiceLjl {
	@Autowired
	TwoLoanDaoLjl twoloan;
	@Autowired
	EmployeeDaoLjl employeeDaoLjl;
	@Autowired
	PlatformFundsDaoLjl platformfunds;
	@Autowired
	EmployeeDaoLjl employeedao;
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public List AllReturn() {
		// TODO Auto-generated method stub
		List list= twoloan.AllReturn();
		return list;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void Loan(String str){
		try{
			JSONArray json=new JSONArray();
			Map map=(Map)json.parseObject(str);
			System.out.println("map:"+map);
			Map funds=new HashMap();
			Float money=Float.parseFloat(map.get("money").toString());
			funds.put("promoney",-money);
			funds.put("usermoney",money);
			
			Map employee=new HashMap();
			//employee.put("",);
			employee.put("balance",money);
			System.out.println(funds);
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		        //获取String类型的时间
		    String createdate = sdf.format(new Date());
			Map<String ,Object> capital=new HashMap<String ,Object>();
			capital.put("empid", map.get("empid"));
			capital.put("projectsid", map.get("proid"));
			capital.put("capital", money);
			capital.put("capitalflow", 6);
			//capital.put("time", createdate);
	        //设置要获取到什么样的时间
	       System.out.println(capital);
			//platformfunds.Updatefund(funds);
			employeedao.UpdateEmployee(map);
			platformfunds.InsertCapital(capital);
			
			
		}catch (Exception e){
			
			
		}
		
	}
	
}
