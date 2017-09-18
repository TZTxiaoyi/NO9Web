package com.serviceimpl.ljl;


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
	/**
	 * 查询需要反款的项目
	 */
	public List AllReturn() {
		// TODO Auto-generated method stub
		List list= twoloan.AllReturn();
		return list;
	}
	/**
	 * 给项目放款
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public String Loan(String str){
		try{
			JSONArray json=new JSONArray();
			Map map=(Map)json.parseObject(str);
			System.out.println("map:"+map);
			Map funds=new HashMap();
			Float money=Float.parseFloat(map.get("money").toString());
			funds.put("promoney",-money);
			funds.put("usermoney",money);
			
			Map<String ,Object> employee=new HashMap<String ,Object>();
			employee.put("empid", map.get("empid"));
			employee.put("balance",money);
			System.out.println(employee);
			
			Map<String ,Object> capital=new HashMap<String ,Object>();
			capital.put("empid", map.get("empid"));
			capital.put("projectsid", map.get("proid"));
			capital.put("capital", money);
			capital.put("capitalflow", 6);
			//capital.put("time", createdate);
	        //设置要获取到什么样的时间
	       System.out.println(capital);
	       Map <String,Object> transaction =new HashMap<String,Object>();
	       transaction.put("empid", map.get("empid"));
	       transaction.put("money", money);
	       transaction.put("details", 117);

	       Map<String,Object> projects=new HashMap<String,Object>();
	       projects.put("projectsid", map.get("proid"));
	       projects.put("empid", map.get("empid"));
	       projects.put("projectsstate", 86);
			platformfunds.Updatefund(funds);//更新平台资金流动
			employeedao.UpdateEmployee(employee);//更新用余额
			platformfunds.InsertCapital(capital);//添加平台太资金操作记录
			employeedao.InsertTransaction(transaction);//添加用户交易记录
			twoloan.UpdateProState(projects);//更改项目状态完成
		}catch(Exception e){
			return "放款失败";
			
		}
		return "放款成功";
	}
	
}

