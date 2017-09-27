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
import com.dao.ljl.EmployeeDaoLjl;
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
import com.entity.tzt.Employee;
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
	@Autowired
	EmployeeDaoLjl employeedao;
	
	/**
	 * Title: RemoveProjects  取消项目
	 * Description:  
	 * @param projectsMoneyinfotzt
	 * @return   
	 * @see com.service.tzt.ProjectsServerstzt#RemoveProjects(com.entity.tzt.ProjectsMoneyinfotzt)
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public String RemoveProjects(ProjectsMoneyinfotzt projectsMoneyinfotzt) {
		//查询项目下所有订单
		Orders orders = new Orders();
		orders.setProjectsid(projectsMoneyinfotzt.getProjectsid());
		List<Map> projectsorder= ordersDaotzt.queryOrders(orders);
		System.out.println(JSON.toJSONString(projectsorder));
		if(projectsorder.size()>0){
			//更改订单信息
			 orders.setOrdstatus(87);
			 ordersDaotzt.updateOrders(orders);
			//退回至余额
			 EmployeeDaotzt.updataEmployeelist(projectsorder);
			System.out.println("jine");
			//添加用户的退款记录
			employeedao.InsertTransactionListremove(projectsorder);
			
			//添加平台资金表记录

			 CapitalDaotzt.addCapitalRemoveProjectList(projectsorder);
			 
				//修改总资金
			 PlatformFundsLjl platfrom=new PlatformFundsLjl();
			 platfrom.setUsermoney(projectsMoneyinfotzt.getBlacne());
			 platfrom.setPromoney(-projectsMoneyinfotzt.getBlacne());
			 
			 platformFundsDaoLjl.Updatefunds(platfrom);
			 System.out.println("zongzijin");

		}
		
	
		
		


		//修改项目状态
		 projestsdaotzt.updataProject(projectsMoneyinfotzt);
		 System.out.println("状态");
		
		return "true";
	}

	/**
	 * Title: FinshProjects   
	 * Description:  项目完成
	 * @param projectsMoneyinfotzt
	 * @return   
	 * @see com.service.tzt.ProjectsServerstzt#FinshProjects(com.entity.tzt.ProjectsMoneyinfotzt)
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public String FinshProjects(ProjectsMoneyinfotzt projectsMoneyinfotzt) {
		//更改订单状态
		Orders orders = new Orders();
		orders.setProjectsid(projectsMoneyinfotzt.getProjectsid());
		orders.setOrdstatus(80);
		ordersDaotzt.updateOrders(orders);
		
		
		//盈利表存入   
		Profit  profit = new Profit();
		Date myDate =new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String hehe = dateFormat.format( myDate ); 
		profit.setStarttime(hehe);
		profit.setProjectsid(projectsMoneyinfotzt.getProjectsid());
		float gain= (float) (projectsMoneyinfotzt.getBlacne()*0.03);//计算利润
		profit.setCapital(gain);
		profit.setCapitalflow(11);
		profit.setOperator("系统自律");
		System.out.println(JSON.toJSON(profit));
		profitDaotzt.addProfit(profit);
		System.out.println("盈利表存入");
		
		
		//放款至发起人
		Employee employee = new Employee();
		employee.setEmpid(projectsMoneyinfotzt.getEmpid());
		float blan= (float)(projectsMoneyinfotzt.getBlacne()*0.97*0.7);//放款金额
		employee.setBalance(blan);
		System.out.println(JSON.toJSONString(employee));
		EmployeeDaotzt.updataEmployeeBalance(employee);
		System.out.println("放款至发起人");
		//放款记录details
		Map emap=new HashMap();
		emap.put("empid", projectsMoneyinfotzt.getEmpid());
		emap.put("money", blan);
		emap.put("details", 196);
		employeedao.InsertTransaction(emap);
		//增加项目资金记录
		Capital capital = new Capital();
		capital.setCapital (-(float) (blan+gain));//项目一阶段总发放（放款+盈利收付费）
		capital.setProjectsid(projectsMoneyinfotzt.getProjectsid());//项目id
		capital.setEmpid(projectsMoneyinfotzt.getEmpid()); //发起人的id
		capital.setStarttime(hehe);
		capital.setCapitalflow(4);
		System.out.println(JSON.toJSONString(capital));
		CapitalDaotzt.addCapital(capital);
		System.out.println("增加项目资金记录");
		
		
		
		//更改项目状态
		System.out.println(JSON.toJSONString(projectsMoneyinfotzt));
		projestsdaotzt.updataProjectFinsh(projectsMoneyinfotzt);//更改项目状态
		System.out.println("更改项目状态");
		//更改平台资金
		PlatformFundsLjl platformfunds=new PlatformFundsLjl();
		platformfunds.setProfitmoney(gain);
		platformfunds.setPromoney(-(float)(blan+gain));
		platformfunds.setUsermoney(blan);
		System.out.println(JSON.toJSONString(platformfunds));
		platformFundsDaoLjl.Updatefunds(platformfunds);
		System.out.println("更改总资金");
		
		//更改项目预计回报时间
		System.out.println("更改项目预计回报时间");
		 Map <String ,Object> datemap=new HashMap<String ,Object>();
		 datemap.put("projectsid", projectsMoneyinfotzt.getProjectsid());
		 List<Map<String ,Object>> datelist=returnprodao.TopReturn(datemap);
		 System.out.println(datelist);
		 Map <String ,Object> retdatemap=datelist.get(0);
		 String return_time="\'"+retdatemap.get("RETURN_TIME").toString()+"\'";
		 retdatemap.put("return_time",return_time);
		 retdatemap.put("projectsid",projectsMoneyinfotzt.getProjectsid());
		 System.out.println(retdatemap);
		 returnprodao.updateprodate(retdatemap);	
		return "true";
	}

	public List<Map> queryAllProjectAudit() {
		
		
		return projestsdaotzt.queryAllProjectsAudit();
	}


	
}
