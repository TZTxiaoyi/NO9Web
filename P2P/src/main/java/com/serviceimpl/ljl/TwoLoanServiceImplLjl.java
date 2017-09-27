package com.serviceimpl.ljl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ljl.EmployeeDaoLjl;
import com.dao.ljl.MyOrdersDaoLjl;
import com.dao.ljl.PlatformFundsDaoLjl;
import com.dao.ljl.TwoLoanDaoLjl;
import com.dao.tzt.EmployeeDaotzt;
import com.entity.ljl.PlatformFundsLjl;
import com.entity.tzt.Orders;
import com.service.ljl.TwoLoanServiceLjl;
@Service
public class TwoLoanServiceImplLjl implements TwoLoanServiceLjl {
	@Autowired
	TwoLoanDaoLjl twoloan;
	@Autowired
	PlatformFundsDaoLjl platformfunds;
	@Autowired
	EmployeeDaoLjl employeedao;
	@Autowired
	EmployeeDaotzt empdao;
	@Autowired
	MyOrdersDaoLjl orders;
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
			employeedao.UpdateEmployee(employee);//更新用用余额
			platformfunds.InsertCapital(capital);//添加平台太资金操作记录
			employeedao.InsertTransaction(transaction);//添加用户交易记录
			twoloan.UpdateProState(projects);//更改项目状态完成
		}catch(Exception e){
			return "放款失败";
		}
		return "放款成功";
	}
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String loands(String str) {
		//"empid":row.EMPID,"proid":row.PROID,"money":mm.toFixed(2),"RAISE_MONEY":row.RAISE_MONEY}),
		try {
			JSONArray json=new JSONArray();
			Map map=(Map)json.parseObject(str);
			Float smoney=Float.parseFloat(map.get("money").toString());
			Integer proempid=Integer.parseInt(map.get("empid").toString());
			Float zmoney=Float.parseFloat(map.get("RAISE_MONEY").toString());
			System.out.println(smoney+","+proempid+","+zmoney);
			System.out.println("map:"+map);
			List<Map<String,Object>> listemoney=twoloan.selectemoney(map);
			System.out.println("list:"+listemoney);
			Float emoney=(float) 0;
			if(listemoney.size()!=0){
				Map<String,Object> mapemoney=listemoney.get(0);
				emoney=Float.parseFloat(mapemoney.get("EMONEY").toString());
			}
			System.out.println("emoney:"+emoney);
			System.out.println(emoney);
			if(emoney>smoney){
				//回报失败百分比退款给用户
				System.out.println("回报失败百分比退款给用户");
				
				//更改订单信息
				orders.UpdateOrderList(listemoney);
				System.out.println("更改订单信息");
				//退回至余额
				 employeedao.UpdateEmployees(listemoney);
				System.out.println("退回至余额");
				//添加用户交易记录
				 employeedao.InsertTransactionList(listemoney);
				 System.out.println("添加用户交易记录");
				//平台资金表流动
				 platformfunds.UpdatefundsList(listemoney);
				 System.out.println("平台资金流动");
				//平台资金操作记录表 类型
				 platformfunds.InsertCapitalList(listemoney);
				 System.out.println("平台资金操作记录");
				
				//项目资金操作记录
				 
				//修改项目状态
				 Map<String,Object> projects=new HashMap<String,Object>();
			       projects.put("projectsid", map.get("proid"));
			       projects.put("empid", map.get("empid"));
			       projects.put("projectsstate", 156);
				 twoloan.UpdateProState(projects);
				 System.out.println("修改项目状态");
				 System.out.println("552");
				 return "已向未收到回报的用户退回资金，项目回报成功率过低，项目失败";
			}else if(emoney<=smoney){
				if(emoney>0){
					System.out.println("213");
					List<Map<String,Object>> listemoneysuc=twoloan.selectemoneysuc(map);
					//回报成功原数退款给用户
					
					System.out.println("回报成功原数退款给用户");
					//更改订单信息
					
					orders.UpdateOrderList(listemoneysuc);
					System.out.println("更改订单信息");
					//退回至余额
					 employeedao.UpdateEmployees(listemoneysuc);
					System.out.println("退回至余额");
					//添加用户交易记录
					 employeedao.InsertTransactionList(listemoneysuc);
					 System.out.println("添加用户交易记录");
					//更新平台资金流动
					 platformfunds.UpdatefundsList(listemoneysuc);
					 System.out.println("更新平台资金流动");
					//平台资金操作记录表 类型
					 platformfunds.InsertCapitalList(listemoneysuc);
					 System.out.println("平台资金操作记录");
					 
					 //项目资金操作记录
				}

				Float promoney=smoney-emoney;
				Map funds=new HashMap();
					funds.put("promoney",-promoney);
					funds.put("usermoney",promoney);
					
				Map<String ,Object> employee=new HashMap<String ,Object>();
					employee.put("empid", map.get("empid"));
					employee.put("balance",promoney);
					System.out.println(employee);
					
				Map<String ,Object> capital=new HashMap<String ,Object>();
					capital.put("empid", map.get("empid"));
					capital.put("projectsid", map.get("proid"));
					capital.put("capital", promoney);
					capital.put("capitalflow", 6);
					//capital.put("time", createdate);
			        //设置要获取到什么样的时间
			       System.out.println(capital);
			    Map <String,Object> transaction =new HashMap<String,Object>();
			       transaction.put("empid", map.get("empid"));
			       transaction.put("money", promoney);
			       transaction.put("details", 117);
	
			     //修改项目状态
				Map<String,Object> projects=new HashMap<String,Object>();
				    projects.put("projectsid", map.get("proid"));
				    projects.put("empid", map.get("empid"));
				    projects.put("projectsstate", 86);
				employeedao.UpdateEmployee(employee);//更新用用余额
				employeedao.InsertTransaction(transaction);//添加用户交易记录
				platformfunds.Updatefund(funds);//更新平台资金流动
				platformfunds.InsertCapital(capital);//添加平台太资金操作记录
				//项目资金操作记录表
				twoloan.UpdateProState(projects);//更改项目状态完成
				System.out.println("修改项目完成状态");	
				return "已向未收到回报的用户退回资金，项目发起人收到剩余项目资金"+promoney+"元，项目成功";
			}
		} catch (Exception e) {
			throw new RuntimeException("数据异常");
		}
		return "数据异常";
	}
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String updateorders() {
		// TODO Auto-generated method stub
		
		try {
			List ordidlist=twoloan.selectordid();
			System.out.println("List:"+ordidlist);
			if(ordidlist.size()>0){
				twoloan.updateorders(ordidlist);
			}
			
		} catch (Exception e) {
			throw new RuntimeException("数据异常");
		}
		
		return "确认完成";
	}
	
}

