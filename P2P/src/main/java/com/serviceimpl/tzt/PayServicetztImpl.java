package com.serviceimpl.tzt;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ljl.EmployeeDaoLjl;
import com.dao.tzt.AccountsDaotzt;
import com.dao.tzt.CapitalDaotzt;
import com.dao.tzt.OrdersDaotzt;
import com.dao.tzt.PromoneyDaotzt;
import com.entity.tzt.Accounts;
import com.entity.tzt.Capital;
import com.entity.tzt.Orders;
import com.entity.tzt.Promoney;
import com.service.tzt.PayServicetzt;

@Service
public class PayServicetztImpl implements PayServicetzt {

	@Autowired
	OrdersDaotzt ordersDaotzt;
	@Autowired
	PromoneyDaotzt promoneyDaotzt;
	@Autowired
	CapitalDaotzt capitalDaotzt;
	@Autowired
	AccountsDaotzt accountsDaotzt;
	@Autowired
	EmployeeDaoLjl employeeDaoLjl;
	
	@Transactional(propagation=Propagation.REQUIRED)
	public String payService(Orders orders) {
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate ); 
		Capital capital = new Capital();
		Promoney promoney =new Promoney();
		
		promoney.setProjectsid(orders.getProjectsid());
		List<Map> pro = promoneyDaotzt.queryPromoney(promoney);
		float money =  Float.parseFloat(String.valueOf(pro.get(0).get("RAISE_MONEY"))) + orders.getPaymoney();
		System.out.println(money);
		promoney.setRaisemoney(money);
		System.out.println(promoney.getRaisemoney());
		Accounts accounts =new Accounts();
		accounts.setEmpid(orders.getEmpid());
		List<Map> list=accountsDaotzt.queryAccounts(accounts);
		orders.setOrdertime(hehe);
		
		System.out.println(list);
		capital.setCapital(orders.getPaymoney());
		capital.setCapitalflow(2);
		capital.setEmpid(orders.getEmpid());
		capital.setAccountsid( Integer.parseInt(String.valueOf(list.get(0).get("ACCOUNTSID"))));
		capital.setProjectsid(orders.getProjectsid());
		capital.setStarttime(hehe);
		//查询余额
		int Paymoney1=(int)orders.getPaymoney();
		Map employee=new HashMap();
		employee.put("empid", orders.getEmpid());
		List listemployee=employeeDaoLjl.AllEmployee(employee);
		Map map=(Map)listemployee.get(0);
		System.out.println(map);
		int balance=Integer.parseInt(map.get("BALANCE").toString());
		//对比余额是否足够
		if(Paymoney1>balance){
			System.out.println("456");
			return "余额不足";
		}else if(Paymoney1<balance){
			//更新余额
			/*int ibalance=balance-Paymoney1;*/
			/*employee.put("balance", ibalance);*/
			employee.put("balance", Paymoney1);
			employeeDaoLjl.UpdateEmployee(employee);
		}
		Integer a =ordersDaotzt.addOrders(orders);
		capital.setOrdid(orders.getOrdid());
		Integer b= capitalDaotzt.addCapital(capital);
		Integer c =promoneyDaotzt.updatePromoney(promoney);
		if (a!=0&&b!=0&&c!=0) {
			return "支持成功";
		}
		return "支持失败，请重试";
	}

}
