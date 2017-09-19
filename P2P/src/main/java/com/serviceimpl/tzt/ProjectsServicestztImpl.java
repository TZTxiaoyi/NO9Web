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

import com.alibaba.fastjson.JSON;
import com.dao.ljl.PlatformFundsDaoLjl;
import com.dao.ljl.ReturnProjectsDaoLjl;
import com.dao.sxm.OrdersDao;
import com.dao.tzt.CapitalDaotzt;
import com.dao.tzt.EmployeeDaotzt;
import com.dao.tzt.OrdersDaotzt;
import com.dao.tzt.ProfitDaotzt;
import com.dao.tzt.ProjectsDaotzt;
import com.entity.ljl.PlatformFundsLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Capital;
import com.entity.tzt.Orders;
import com.entity.tzt.Profit;
import com.entity.tzt.ProjectsMoneyinfotzt;
import com.service.tzt.ProjectsServerstzt;

import oracle.net.aso.p;
import redis.clients.jedis.BinaryClient.LIST_POSITION;

@Service
public class ProjectsServicestztImpl implements ProjectsServerstzt {

	@Autowired
	OrdersDaotzt ordersDaotzt;
	@Autowired
	EmployeeDaotzt EmployeeDaotzt;
	@Autowired
	CapitalDaotzt CapitalDaotzt;
	@Autowired
	ProjectsDaotzt projestsdaotzt;
	@Autowired
	PlatformFundsDaoLjl platformFundsDaoLjl;
	@Autowired
	ProfitDaotzt profitDaotzt;
	@Autowired
	ReturnProjectsDaoLjl returnprodao; 
	
	
	@Transactional(propagation=Propagation.REQUIRED)
	public String RemoveProjects(ProjectsMoneyinfotzt projectsMoneyinfotzt) {
		//查询项目下所有订单
		Orders orders = new Orders();
		orders.setProjectsid(projectsMoneyinfotzt.getProjectsid());
		List<Map> projectsorder= ordersDaotzt.queryOrders(orders);
		System.out.println(JSON.toJSONString(projectsorder));
		//更改订单信息
		 orders.setOrdstatus(87);
		 ordersDaotzt.updateOrders(orders);
		//退回至余额
		 EmployeeDaotzt.updataEmployeelist(projectsorder);
		System.out.println("jine");
		//添加平台资金表记录
		 System.out.println(projectsorder.size());
		 System.out.println(projectsorder.getClass());
		 CapitalDaotzt.addCapitalRemoveProjectList(projectsorder);
		 System.out.println("pigntai");
		//修改总资金
		 PlatformFundsLjl platfrom=new PlatformFundsLjl();
		 platfrom.setUsermoney(projectsMoneyinfotzt.getBlacne());
		 platfrom.setPromoney(-projectsMoneyinfotzt.getBlacne());
		 platformFundsDaoLjl.Updatefunds(platfrom);
		 System.out.println("zongzijin");

		//修改项目状态
		 projestsdaotzt.updataProject(projectsMoneyinfotzt);
		 System.out.println("状态");
		
		return "true";
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public String FinshProjects(ProjectsMoneyinfotzt projectsMoneyinfotzt) {
		//更改订单状态
		Orders orders = new Orders();
		orders.setProjectsid(projectsMoneyinfotzt.getProjectsid());
		orders.setOrdstatus(87);
		ordersDaotzt.updateOrders(orders);
		
		
		//盈利表存入    增加项目资金记录
		Profit  profit = new Profit();
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate ); 
		profit.setStrattime(hehe);
		profit.setCapital(projectsMoneyinfotzt.getProjectsid());
		float gain= (float) (projectsMoneyinfotzt.getBlacne()*0.03);//计算利润
		profit.setCapital(gain);
		profit.setCapitalflow(11);
		profitDaotzt.addProfit(profit);
		
			//增加项目资金记录
		Capital capital = new Capital();
		capital.setCapital (gain);//减去利润后的发放
		capital.setProjectsid(projectsMoneyinfotzt.getProjectsid());//项目id
		capital.setEmpid(projectsMoneyinfotzt.getEmpid()); //发起人的id
		CapitalDaotzt.addCapital(capital);
		
		//放款至发起人
		
		//增加项目资金记录
		
		//更改订单项目状态
		
		//更改总资金
		 Map <String ,Object> datemap=new HashMap<String ,Object>();
		 datemap.put("projectsid", projectsMoneyinfotzt.getProjectsid());
		 List<Map<String ,Object>> datelist=returnprodao.TopReturn(datemap);
		 System.out.println(datelist);
		 Map <String ,Object> retdatemap=datelist.get(0);
		 retdatemap.put("projectsid",projectsMoneyinfotzt.getProjectsid());
		 System.out.println(retdatemap);
		 returnprodao.updateprodate(retdatemap);	
		return "true";
	}


	
}
